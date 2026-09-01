# Zoom, reflow e aumento de texto

## Contrato de experiência

A interface deve permanecer utilizável quando o conteúdo é ampliado, quando o tamanho do texto cresce e quando a área disponível é reduzida. A pessoa usuária não deve perder conteúdo, função, contexto ou foco por causa da adaptação visual.

## Regras comuns

- evite dimensões rígidas que cortem texto ou controles;
- permita quebra de linha e crescimento vertical quando necessário;
- não dependa de posição absoluta para manter significado;
- preserve ordem lógica de leitura quando o layout muda;
- mantenha controles, erros, rótulos e conteúdo essenciais disponíveis;
- respeite preferências de tamanho de texto da plataforma;
- não impeça zoom do navegador sem justificativa excepcional;
- teste estados com conteúdo real, textos longos e idiomas expansivos.

## Web

- suporte zoom do navegador e reflow sem perda de função;
- não desabilite `user-scalable` nem limite ampliação de forma injustificada;
- evite componentes que exijam rolagem bidimensional quando isso puder ser reorganizado;
- use unidades e layouts flexíveis de forma coerente;
- verifique conteúdo em 200% e cenários de reflow compatíveis com o critério aplicável;
- teste espaçamento de texto personalizado sem perda de conteúdo.

## Android

- respeite escala de fonte e display size do sistema;
- use componentes e layouts capazes de crescer com o conteúdo;
- evite altura fixa em campos, botões e células com texto variável;
- teste com tamanhos grandes de fonte, orientação e janelas redimensionáveis;
- confirme que conteúdo não desaparece da árvore de acessibilidade quando muda de layout.

## iOS

- suporte Dynamic Type quando aplicável;
- evite truncar conteúdo essencial quando o texto cresce;
- use layouts adaptativos e permita múltiplas linhas;
- teste categorias grandes de tamanho de texto, orientação e diferentes tamanhos de janela;
- mantenha ordem e contexto do VoiceOver após reorganização.

## Verificação

- texto ampliado não é cortado nem sobreposto;
- controles essenciais continuam disponíveis;
- ordem de leitura permanece coerente;
- zoom/reflow não exige movimentos excessivos ou navegação confusa;
- erros, hints e mensagens continuam perceptíveis;
- foco permanece associado ao elemento lógico após mudança de layout.
