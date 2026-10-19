# Conteúdo e convenções editoriais

## Estrutura atual

```text
/
├── AGENTS.md                  # Instruções para agentes (não publicado)
├── README.md                  # Apresentação no GitHub (não publicado no site)
├── index.md                   # Página inicial do site
├── regulamento/
│   └── regulamento.md
├── facilitacao/
│   ├── index.md               # Índice da biblioteca
│   ├── _template.md           # Template (não publicado pelo Jekyll)
│   └── gartic-phone.md
├── eventos/
│   └── 2026-10-16-evento-03/
│       └── agenda.md
└── docs/                      # Rascunhos internos, excluídos do site
```

Não existem os eventos 1 e 2 neste repositório. Não criar pastas, agendas ou sumários para eles sem confirmação.

## Eventos

Convenção: `eventos/YYYY-MM-DD-evento-NN/`, com a data ISO e o número ordinal do evento.

Estrutura de destino de cada evento:

```text
eventos/YYYY-MM-DD-evento-NN/
├── agenda.md
├── sumario.md          # Escrito após o evento
├── apresentacoes/      # PPTs e slides
└── fotografias/        # Fotografias do evento
```

- `agenda.md` usa `parent: Eventos` e um `nav_order` único entre eventos.
- Os ficheiros só aparecem no menu se tiverem *front matter* com `title` e `nav_order`.
- Páginas índice de secção usam `has_children: true` e `has_toc: false`.
- A secção `eventos/` ainda não tem `index.md`; criá-lo (com `has_children: true`) antes de acrescentar novas páginas de eventos, para o `parent: Eventos` resolver.
- Nos links internos do site, usar a extensão final `.html` (ex.: `agenda.html`), porque o Jekyll gera HTML a partir do Markdown. Nos links para imagens, usar o caminho relativo ao ficheiro atual.

## Licença

Todos os ficheiros publicados no site (`index.md` e ficheiros em `regulamento/`, `facilitacao/`, `eventos/`) terminam com:

```markdown
---
*© Portugal Agile Leaders Network — licenciado sob [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.pt).*
```

O `README.md` apresenta a licença em texto corrido e não é copiado para o site. Os rascunhos em `docs/` devem receber o aviso antes de serem promovidos a conteúdo público.

## Biblioteca de facilitação

- Um ficheiro por técnica, `facilitacao/<nome-da-tecnica>.md`, baseado em `_template.md`.
- Preencher tipo, duração, participantes, materiais, origem, quando usar, passo a passo, dicas e onde já foi usada na PALN.
- Acrescentar a técnica à tabela do `facilitacao/index.md` (técnica, tipo, evento).
- Nomes de ficheiros começados por `_` não são publicados pelo Jekyll; usar essa convenção apenas para templates e parciais.

## Fotografias e binários

- Nomes de fotografias: `YYYY-MM-DD-evento-NN-HHMMSS.jpg`, com a hora do ficheiro original; em caso de colisão, acrescentar `-2`, `-3`, etc.
- Inserir no Markdown uma variante de 600 px (`nome-600.jpg`); guardar o original na mesma pasta.
- Nomes de apresentações: `<nome-descritivo-da-sessao>.pptx`.
- Ficheiros binários grandes ficam nas pastas próprias; se o repositório crescer, migrar para Git LFS. Não guardar vídeos grandes no Git — usar links externos no sumário.
- Nomes de ficheiros em minúsculas, sem acentos e com hífenes.

## Estilo editorial

- PT-PT, tom acolhedor e inclusivo, adequado a uma comunidade de prática.
- Markdown simples e fácil de editar por humanos; evitar HTML complexo e usar tabelas apenas quando necessário.
- Os sumários são síntese, não transcrição: não incluir nomes de empresas, pessoas, projetos identificáveis ou dados sensíveis.
- Verificar os links internos depois de mover ou renomear ficheiros.
- Não publicar fotografias, apresentações ou outros materiais de membros sem autorização explícita dos autores.
