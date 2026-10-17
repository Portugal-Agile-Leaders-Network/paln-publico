# AGENTS.md — Portugal Agile Leaders Network

## Sobre o projeto

Plataforma de colaboração da **Portugal Agile Leaders Network**, uma Community of Practice (CoP) portuguesa de líderes em transformação para práticas ágeis de desenvolvimento de software.

Objetivo: servir de plataforma de colaboração entre membros da comunidade, usando Git/GitHub como repositório de informação. Os membros devem conseguir contribuir facilmente, mesmo com pouca experiência em Git (edits via interface web do GitHub são encorajados).

## Organização no GitHub

- **Organização**: [Portugal-Agile-Leaders-Network](https://github.com/Portugal-Agile-Leaders-Network)
- **`paln-publico`** (público) — apresentação da comunidade, regulamento, documentação de eventos destinada ao público.
- **`paln-membros`** (privado) — materiais só de membros: fotografias, apresentações internas, sumários internos.

## Licença

- Os ficheiros Markdown (e restante documentação textual) do repositório **público** são disponibilizados sob licença **Creative Commons Attribution 4.0 International (CC BY 4.0)**.
- Cada ficheiro Markdown público deve incluir o aviso de licença no final:

  ```markdown
  ---
  *© Portugal Agile Leaders Network — licenciado sob [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.pt).*
  ```

- Ficheiros binários (PPTs, PDFs, fotografias) pertencem aos seus autores; devem ser creditados e só publicados com a sua autorização.
- No repositório privado, manter a mesma licença para consistência (material poderá depois ser tornado público).

## Estrutura de pastas

```
/
├── AGENTS.md                  # Este ficheiro
├── README.md                  # Página inicial do repositório (apresentação da comunidade)
├── regulamento/               # Regulamento da comunidade
│   └── regulamento.md
├── eventos/
│   ├── 2026-07-xx-evento-01/  # Um directório por evento (exemplos de padrão)
│   ├── 2026-09-xx-evento-02/
│   └── 2026-10-16-evento-03/  # 3º evento, realizado a 16 de Outubro de 2026
└── (futuro) site/ ou docs/    # Página pública da comunidade, quando existir
```

### Convenção de nomes de eventos

`eventos/YYYY-MM-DD-evento-NN/` — data do evento em formato ISO + número ordinal do evento.

Dentro de cada directório de evento:

```
eventos/2026-10-16-evento-03/
├── agenda.md
├── sumario.md          # Sumário colaborativo escrito após o evento
├── apresentacoes/      # PPTs e slides
└── fotografias/        # Fotografias do evento
```

## Convenções

- **Língua**: português europeu (PT-PT) em toda a documentação.
- **Datas**: formato ISO `YYYY-MM-DD`.
- **Documentação**: preferir Markdown (`.md`) para texto editável e colaborativo (agendas, sumários, regulamento).
- **Licença em Markdown público**: todos os ficheiros `.md` do repositório público terminam com o aviso CC BY 4.0 indicado na secção Licença.
- **Ficheiros binários grandes** (PPTs, PDFs, fotografias): colocar nas pastas próprias e, se o repositório crescer, migrar para **Git LFS**. Evitar vídeos grandes no Git — usar links externos (YouTube, Drive) no sumário.
- **Nomes de ficheiros**: minúsculas, sem acentos, palavras separadas por hífenes (ex.: `abertura-e-boas-vindas.pptx`).
- **Commits**: mensagens curtas e descritivas, em português (ex.: `Adiciona agenda do evento 3`).

## Instruções para agentes (IA)

- Escrever sempre em PT-PT.
- Ao criar documentação de eventos, seguir a estrutura de pastas acima e nunca inventar datas/numerações de eventos sem confirmação.
- Sumários colaborativos devem ser fáceis de editar por humanos: Markdown simples, sem HTML complexo, tabelas apenas quando necessário.
- Não reformatar nem "melhorar" documentos existentes sem pedido explícito.
- Não apagar nem mover materiais de eventos passados sem pedido explícito.
- Ao sugerir alterações ao README ou ao regulamento, manter tom acolhedor e inclusivo, adequado a uma comunidade de prática.
- Verificar se os links internos (entre ficheiros Markdown) ficam válidos após qualquer movimentação de ficheiros.
- Ao criar ou editar ficheiros Markdown no repositório público, garantir que terminam com o aviso de licença CC BY 4.0.
- Não publicar materiais de membros (fotografias, apresentações) no repositório público sem autorização explícita dos autores.
