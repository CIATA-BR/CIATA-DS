# CIATA-DS — motores automáticos do Validador

## Objetivo

Ativar o servidor MCP em loopback e permitir que a API CIATA-DS execute pré-validações automáticas com axe-core e Playwright sem expor o MCP diretamente à Internet.

## Dependências

No servidor:

```bash
cd /var/www/design/Validador/mcp-server
npm install
npm install playwright @axe-core/playwright
npx playwright install chromium
```

Confirmar o Node usado pelo Apache/PHP:

```bash
command -v node
node --version
```

O Node deve ser 18 ou superior.

## Teste manual do MCP

```bash
cd /var/www/design/Validador/mcp-server
npm start
```

O servidor deve permanecer em `127.0.0.1:3100`. Não publicar a porta 3100 no firewall, proxy reverso ou VirtualHost.

Em outro terminal:

```bash
curl -i http://127.0.0.1:3100/health
```

## Serviço systemd recomendado

Criar `/etc/systemd/system/ciata-ds-mcp.service`:

```ini
[Unit]
Description=CIATA-DS Accessibility MCP
After=network.target

[Service]
Type=simple
User=www-data
Group=www-data
WorkingDirectory=/var/www/design/Validador/mcp-server
Environment=A11Y_MCP_HOST=127.0.0.1
Environment=PORT=3100
ExecStart=/usr/bin/node /var/www/design/Validador/mcp-server/server.js
Restart=on-failure
RestartSec=3
NoNewPrivileges=true
PrivateTmp=true
ProtectSystem=strict
ProtectHome=true
ReadWritePaths=/var/www/design/Validador/mcp-server

[Install]
WantedBy=multi-user.target
```

Validar e ativar:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now ciata-ds-mcp
sudo systemctl status ciata-ds-mcp --no-pager
```

## Banco

Depois que a PR da integração estiver no `main`:

```bash
cd /var/www/design
mariadb -u ciata_design -p ciata_ds < database/ciata_ds_automatic_scans.sql
```

## Configuração da API

Adicionar ao `/etc/ciata-ds/validator.env`:

```ini
MCP_URL=http://127.0.0.1:3100/mcp
NODE_BIN=/usr/bin/node
VALIDATOR_SCAN_TIMEOUT=90
VALIDATOR_ALLOWED_HOSTS=ds.ciata.org.br
```

`VALIDATOR_ALLOWED_HOSTS` é uma lista separada por vírgulas. Adicionar somente hosts que a equipe realmente pretende auditar, por exemplo:

```ini
VALIDATOR_ALLOWED_HOSTS=ds.ciata.org.br,biblioteca.ciata.org.br,emprega.ciata.org.br
```

A lista existe para reduzir risco de SSRF. Não usar curingas e não adicionar `localhost`, IPs privados ou destinos arbitrários.

## Teste da ponte sem navegador

Com o MCP ativo:

```bash
cd /var/www/design/Validador/mcp-server
CIATA_MCP_URL=http://127.0.0.1:3100/mcp node ciata/scan-page.mjs https://ds.ciata.org.br/
```

A saída deve ser um único JSON contendo cinco motores:

- `axe`;
- `accessibility_tree`;
- `keyboard`;
- `contrast`;
- `viewport`.

## Interface

A interface para perfis `admin` e `analyst` fica em:

```text
https://ds.ciata.org.br/automatic-scan/
```

Cada execução é registrada em `automated_scan_runs`, inclusive quando a execução termina em erro.

## Limite de confiança

A varredura automática produz pré-validação e evidência técnica. Ela não promove componentes para estável e não substitui testes manuais com leitores de tela, navegação por teclado real, acesso alternativo ou pessoas usuárias.
