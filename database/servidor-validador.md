# CIATA-DS — conexão do Validador ao MariaDB

## Objetivo

Conectar a interface de validação publicada em `ds.ciata.org.br` à base `ciata_ds` sem expor usuário ou senha no navegador, no JavaScript ou no repositório.

## Arquitetura

```text
Navegador do analista
        |
        v
https://ds.ciata.org.br
        |
        v
Apache + PHP 8.4
        |
        v
API CIATA-DS (/api)
        |
        v
MariaDB / ciata_ds

Motor Validador MCP
127.0.0.1:3100
        |
        +-- integração futura pela API, sem acesso direto do navegador
```

A credencial da base pertence somente ao servidor. O frontend nunca recebe `DB_PASSWORD`.

## Arquivo de ambiente do servidor

Criar `/etc/ciata-ds/validator.env` fora do `DocumentRoot`:

```ini
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=ciata_ds
DB_USERNAME=ciata_design
DB_PASSWORD=SENHA_REAL_SOMENTE_NO_SERVIDOR
```

Permissões recomendadas:

```bash
sudo install -d -m 750 -o root -g www-data /etc/ciata-ds
sudo touch /etc/ciata-ds/validator.env
sudo chown root:www-data /etc/ciata-ds/validator.env
sudo chmod 640 /etc/ciata-ds/validator.env
```

O arquivo não deve ser copiado para o Git.

## Extensão PHP necessária

```bash
php -m | grep -Ei 'pdo_mysql|mysqli'
```

Se `pdo_mysql` não aparecer:

```bash
sudo apt update
sudo apt install php8.4-mysql
sudo systemctl reload apache2
```

## Criar as tabelas e dados iniciais

Se a base ainda estiver vazia:

```bash
cd /var/www/design
mariadb -u ciata_design -p ciata_ds < database/ciata_ds_schema.sql
```

Depois carregar o catálogo dos componentes e a plataforma `other`:

```bash
mariadb -u ciata_design -p ciata_ds < database/ciata_ds_seed_components.sql
```

O seed é idempotente e pode ser reaplicado após atualizações do catálogo.

## Teste direto do usuário da base

```bash
mariadb -u ciata_design -p -h localhost ciata_ds -e "SELECT DATABASE(), CURRENT_USER();"
```

## Teste pela aplicação

Após configurar `/etc/ciata-ds/validator.env`, acessar:

```text
https://ds.ciata.org.br/api/health.php
```

O retorno esperado é JSON com `status: ok`, nome da base, usuário efetivo e versão do MariaDB. A senha nunca é retornada.

## Autenticação para gravação

A consulta de status é pública, mas `POST /api/validation-runs.php` só grava quando o Apache fornece `REMOTE_USER`. Isso evita disponibilizar uma rota de escrita anônima na Internet.

Uma opção provisória é proteger o Validador com autenticação HTTP do próprio Apache. Exemplo de diretiva no VirtualHost HTTPS, ajustando o arquivo de usuários à política do servidor:

```apache
<Location "/validation/">
    AuthType Basic
    AuthName "CIATA-DS Validador"
    AuthUserFile /etc/ciata-ds/validator-users
    Require valid-user
</Location>

<Location "/api/validation-runs.php">
    AuthType Basic
    AuthName "CIATA-DS Validador"
    AuthUserFile /etc/ciata-ds/validator-users
    Require valid-user
</Location>
```

Criar o primeiro usuário fora do repositório:

```bash
sudo htpasswd -c /etc/ciata-ds/validator-users cassiqueiro
sudo chown root:www-data /etc/ciata-ds/validator-users
sudo chmod 640 /etc/ciata-ds/validator-users
sudo apachectl configtest
sudo systemctl reload apache2
```

Para adicionar outros analistas depois, não usar `-c` novamente:

```bash
sudo htpasswd /etc/ciata-ds/validator-users outro_usuario
```

Essa autenticação é uma etapa provisória. A identidade poderá ser substituída depois por login institucional sem alterar a modelagem das execuções.

## Tokens do CIATA-DS no Test Lab

A folha `test-lab/validation/validation.css` consome os tokens canônicos por `/tokens/cores.css` e `/tokens/tipografia.css`. Como o `DocumentRoot` atual é `test-lab`, disponibilizar os tokens sem duplicação:

```bash
cd /var/www/design/test-lab
ln -s ../tokens tokens
```

Se o link já existir, não recriar.

## Rotas atuais da API

- `GET /api/health.php` — diagnóstico da base;
- `GET /api/status.php?component=checkbox` — cobertura/status por plataforma;
- `POST /api/validation-runs.php` — grava uma execução e seus resultados em uma única transação, exige `REMOTE_USER`.

A gravação atualiza `component_platform_status` na mesma transação. Evidências binárias/anexos e autenticação institucional ficam para etapas posteriores.
