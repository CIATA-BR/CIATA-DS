#!/usr/bin/env node
/**
 * CIATA-DS — servidor HTTP do motor de validação de acessibilidade.
 *
 * O servidor MCP permanece compatível com clientes MCP existentes e fica,
 * por padrão, restrito ao loopback. A integração com MariaDB usa somente
 * variáveis de ambiente do processo; credenciais nunca são servidas ao cliente.
 */

import express from "express";
import { randomUUID } from "node:crypto";
import { StreamableHTTPServerTransport } from "@modelcontextprotocol/sdk/server/streamableHttp.js";
import { createServer } from "./server-core.js";
import { checkDatabase, databaseConfigured } from "./database.js";

const PORT = parseInt(process.env.PORT || "3100", 10);
const HOST = process.env.A11Y_MCP_HOST || "127.0.0.1";
const STATELESS = process.env.A11Y_MCP_STATELESS === "1";

const app = express();
app.use(express.json({ limit: "1mb" }));

// Nega chamadas cross-origin diretas. O acesso Web deve passar pelo mesmo
// host do CIATA-DS (Apache/reverse proxy) e por autenticação antes de escrita.
app.use((_req, res, next) => {
  res.setHeader("Access-Control-Allow-Origin", "null");
  res.setHeader("Access-Control-Allow-Methods", "POST, GET, DELETE");
  next();
});

if (STATELESS) {
  app.post("/mcp", async (req, res) => {
    const server = createServer();
    const transport = new StreamableHTTPServerTransport({
      sessionIdGenerator: undefined,
    });
    res.on("close", () => { transport.close(); server.close(); });
    await server.connect(transport);
    await transport.handleRequest(req, res, req.body);
  });

  app.get("/mcp", (_req, res) => {
    res.status(405).json({ error: "SSE indisponível no modo stateless. Use POST." });
  });

  app.delete("/mcp", (_req, res) => {
    res.status(405).json({ error: "Encerramento de sessão indisponível no modo stateless." });
  });
} else {
  const MAX_SESSIONS = 100;
  const SESSION_TTL_MS = 30 * 60 * 1000;
  const sessions = new Map();

  setInterval(() => {
    const now = Date.now();
    for (const [id, session] of sessions) {
      if (now - session.lastActivity > SESSION_TTL_MS) {
        session.transport.close();
        session.server.close();
        sessions.delete(id);
      }
    }
  }, 60_000).unref();

  app.post("/mcp", async (req, res) => {
    const sessionId = req.headers["mcp-session-id"];
    if (sessionId && sessions.has(sessionId)) {
      const session = sessions.get(sessionId);
      session.lastActivity = Date.now();
      await session.transport.handleRequest(req, res, req.body);
      return;
    }
    if (sessionId && !sessions.has(sessionId)) {
      res.status(404).json({ error: "Sessão não encontrada. Inicie uma nova sessão sem o cabeçalho mcp-session-id." });
      return;
    }
    if (sessions.size >= MAX_SESSIONS) {
      res.status(503).json({ error: "Limite de sessões ativas atingido. Tente novamente mais tarde." });
      return;
    }
    const server = createServer();
    const transport = new StreamableHTTPServerTransport({
      sessionIdGenerator: () => randomUUID(),
      onsessioninitialized: (id) => {
        sessions.set(id, { server, transport, lastActivity: Date.now() });
      },
    });
    transport.onclose = () => {
      const id = transport.sessionId;
      if (id) sessions.delete(id);
    };
    await server.connect(transport);
    await transport.handleRequest(req, res, req.body);
  });

  app.get("/mcp", async (req, res) => {
    const sessionId = req.headers["mcp-session-id"];
    if (!sessionId || !sessions.has(sessionId)) {
      res.status(400).json({ error: "ID de sessão ausente ou inválido para SSE." });
      return;
    }
    const { transport } = sessions.get(sessionId);
    await transport.handleRequest(req, res);
  });

  app.delete("/mcp", async (req, res) => {
    const sessionId = req.headers["mcp-session-id"];
    if (!sessionId || !sessions.has(sessionId)) {
      res.status(404).json({ error: "Sessão não encontrada." });
      return;
    }
    const { transport, server } = sessions.get(sessionId);
    await transport.handleRequest(req, res);
    transport.close();
    await server.close();
    sessions.delete(sessionId);
  });
}

app.get("/health", (_req, res) => {
  res.json({
    status: "ok",
    name: "CIATA-DS Validador",
    mcp: "ok",
    database: databaseConfigured() ? "configurada" : "não configurada",
    mode: STATELESS ? "stateless" : "stateful",
  });
});

// Endpoint somente de diagnóstico. Não retorna senha, host nem outros segredos.
app.get("/health/database", async (_req, res) => {
  if (!databaseConfigured()) {
    res.status(503).json({ status: "erro", database: "não configurada" });
    return;
  }

  try {
    const info = await checkDatabase();
    res.json({
      status: "ok",
      database: info.database_name,
      user: info.database_user,
      version: info.database_version,
    });
  } catch (error) {
    console.error("Falha ao verificar a base CIATA-DS:", error.message);
    res.status(503).json({ status: "erro", database: "indisponível" });
  }
});

if (HOST !== "127.0.0.1" && HOST !== "localhost" && HOST !== "::1") {
  console.warn("AVISO: servidor fora do loopback e sem autenticação própria. Restrinja o acesso por proxy/firewall.");
}

app.listen(PORT, HOST, () => {
  console.log(`CIATA-DS Validador ativo em http://${HOST}:${PORT}/mcp`);
  console.log(`Modo: ${STATELESS ? "stateless" : "stateful (sessões + SSE)"}`);
  console.log(`Saúde: http://${HOST}:${PORT}/health`);
  console.log(`Banco: http://${HOST}:${PORT}/health/database`);
});
