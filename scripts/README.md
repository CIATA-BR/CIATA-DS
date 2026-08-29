# Scripts

Esta pasta contém validações e geradores reproduzíveis do CIATA Design System.

Os scripts devem:

- funcionar sem credenciais quando operarem apenas sobre arquivos do repositório;
- falhar com mensagem clara e código de saída diferente de zero;
- não alterar arquivos sem que essa finalidade esteja explícita;
- preservar a fonte canônica e evitar cópias divergentes;
- possuir documentação de uso junto ao artefato relacionado.

## Scripts disponíveis

- `validar-wcag-22.mjs`: verifica estrutura, contagens, códigos, níveis, estados e fontes da base canônica WCAG 2.2.
