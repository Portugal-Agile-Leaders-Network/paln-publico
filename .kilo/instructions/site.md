# Site, tema e sincronização

## Como o site é construído

- Jekyll na raiz do repositório, com o tema remoto **Just the Docs** (`_config.yml`).
- Site de projeto em `/paln-publico` (`url` + `baseurl`). O `github.io` serve o mesmo conteúdo na raiz, sem `baseurl`.
- As páginas são Markdown com *front matter*; a navegação vem de `title`, `parent`, `nav_order`, `has_children` e `has_toc`. A configuração `collections` não dispensa estas chaves.
- Não há `Gemfile`; validar as alterações através do build do GitHub Pages, não com um servidor local.

## Configuração e identidade visual

Decisões já tomadas — só alterar com pedido explícito:

- **Separação estrita de customizações:**
  - `_sass/color_schemes/paln.scss` — apenas variáveis SCSS de cor, ativadas por `color_scheme: paln`.
  - `_sass/custom/custom.scss` — layout e componentes (logo, cabeçalho, margens).
  - `_includes/head_custom.html` — Google Fonts e CSS do `<head>`.
- **Paleta:** fundo `#f7fafc`, sidebar `#edf3fa`, links e títulos `#1b4f8a`, texto `#25313d`. `$search-result-preview-color` é cor de **texto** na pré-visualização da pesquisa; usar tom escuro.
- **Fonte:** Work Sans em todo o site. Não introduzir fontes serifadas nem alterar tamanhos sem pedido.
- **Logo:** `logo: imagens/logo-200.jpg` no `_config.yml`, sem prefixar o `baseurl` (o tema acrescenta-o). Tamanho em `_sass/custom/custom.scss` (10 rem; o tema limita a ~36 px por defeito).
- **Menu:** páginas índice com `has_children: true` e `has_toc: false`; o Regulamento liga diretamente ao documento. Manter os nomes dos ficheiros das páginas.
- **Cascata CSS:** o `remote_theme` injeta regras depois das personalizadas. Para sobrepor classes do tema, usar seletor com especificidade superior **e** `!important` (padrão existente: `.site-nav .nav-list .nav-list-item.external`).
- Não remover `AGENTS.md`, `docs/` e `README.md` da lista `exclude` do `_config.yml`.

## Sincronização com o github.io

- Workflow: `.github/workflows/sync-github-io.yml`, em cada push para `main` e por execução manual. Requer o secret `PALN_SYNC_TOKEN` (PAT fine-grained com Contents: read/write no repositório `github.io`).
- Script: `sync-to-github-io.sh <destino>`.
- O script copia apenas a lista `ITENS` (`index.md`, `_config.yml`, `_includes`, `_sass`, `imagens`, `regulamento`, `facilitacao`, `eventos`). **Ao criar uma nova pasta de conteúdo de topo, acrescentá-la a `ITENS`**, senão não é sincronizada.
- No destino, o script remove a linha `baseurl`, prefixa o logo com `/` e retira `AGENTS.md` e `docs/` da lista `exclude`. O `README.md` do destino não é copiado.
- Nunca editar o conteúdo do repositório `github.io`: qualquer alteração é sobrescrita no push seguinte.

## Validação

- Após um push, o build do Pages demora ~1–2 minutos. Confirmar em Settings → Pages → Builds ou com `gh api repos/Portugal-Agile-Leaders-Network/paln-publico/pages/builds/latest`.
- Confirmar no CSS compilado (`assets/css/just-the-docs-default.css`) que as regras de estilo foram aplicadas.
- Fazer hard refresh no browser (Cmd+Shift+R) para evitar cache.
- Verificar que os links de navegação e as imagens continuam válidos, sobretudo após mover ficheiros.
