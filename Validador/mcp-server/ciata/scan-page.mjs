import { Client } from '@modelcontextprotocol/sdk/client/index.js';
import { StreamableHTTPClientTransport } from '@modelcontextprotocol/sdk/client/streamableHttp.js';

const targetUrl = process.argv[2];
if (!targetUrl) {
  console.error(JSON.stringify({ status: 'erro', mensagem: 'URL de destino ausente.' }));
  process.exit(2);
}

let parsed;
try {
  parsed = new URL(targetUrl);
} catch {
  console.error(JSON.stringify({ status: 'erro', mensagem: 'URL de destino inválida.' }));
  process.exit(2);
}
if (!['http:', 'https:'].includes(parsed.protocol)) {
  console.error(JSON.stringify({ status: 'erro', mensagem: 'Somente URLs HTTP/HTTPS são aceitas.' }));
  process.exit(2);
}

const mcpUrl = process.env.CIATA_MCP_URL || 'http://127.0.0.1:3100/mcp';
const client = new Client({ name: 'ciata-validator-bridge', version: '1.0.0' });
const transport = new StreamableHTTPClientTransport(new URL(mcpUrl));
const tools = [
  ['axe', 'run_axe_scan', { url: targetUrl }],
  ['accessibility_tree', 'run_playwright_a11y_tree', { url: targetUrl }],
  ['keyboard', 'run_playwright_keyboard_scan', { url: targetUrl, maxTabs: 80 }],
  ['contrast', 'run_playwright_contrast_scan', { url: targetUrl }],
  ['viewport', 'run_playwright_viewport_scan', { url: targetUrl }],
];

function textFrom(result) {
  return (result?.content || [])
    .filter(item => item?.type === 'text')
    .map(item => item.text || '')
    .join('\n')
    .trim();
}

function classify(text) {
  const value = text.toLowerCase();
  if (!text) return 'unknown';
  if (value.includes('not installed') || value.includes('failed:') || value.includes('não instalado')) return 'error';
  if (value.includes('[fail]') || value.includes('violations:') && !value.includes('violations: 0') || value.includes('keyboard trap detected')) return 'issues';
  return 'ok';
}

const startedAt = new Date().toISOString();
const engines = [];
let overall = 'ok';

try {
  await client.connect(transport);
  for (const [engine, tool, args] of tools) {
    try {
      const result = await client.callTool({ name: tool, arguments: args });
      const text = textFrom(result);
      const status = classify(text);
      if (status === 'error') overall = 'error';
      else if (status === 'issues' && overall === 'ok') overall = 'issues';
      engines.push({ engine, tool, status, output: text });
    } catch (error) {
      overall = 'error';
      engines.push({ engine, tool, status: 'error', output: String(error?.message || error) });
    }
  }

  console.log(JSON.stringify({
    status: overall,
    target_url: targetUrl,
    mcp_url: mcpUrl,
    started_at: startedAt,
    completed_at: new Date().toISOString(),
    engines,
  }));
} catch (error) {
  console.error(JSON.stringify({
    status: 'erro',
    target_url: targetUrl,
    mensagem: String(error?.message || error),
  }));
  process.exitCode = 1;
} finally {
  try { await client.close(); } catch {}
}
