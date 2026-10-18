#!/usr/bin/env bash
# sync-to-github-io.sh
#
# Copia o conteúdo do repositório paln-publico para o repositório
# portugal-agile-leaders-network.github.io, ajustando configurações
# para servir na raiz do domínio (sem baseurl).
#
# Uso:
#   ./sync-to-github-io.sh                    # destinos predefinidos
#   ./sync-to-github-io.sh /caminho/para/github-io-repo
#
# Predefinições:
#   ORIGEM  = diretório atual (assume que é paln-publico)
#   DESTINO = ../portugal-agile-leaders-network.github.io  (sibling)

set -euo pipefail

ORIGEM="$(cd "$(dirname "$0")" && pwd)"

if [[ $# -ge 1 ]]; then
    DESTINO="$1"
else
    DESTINO="$(dirname "$ORIGEM")/portugal-agile-leaders-network.github.io"
fi

if [[ ! -d "$DESTINO/.git" ]]; then
    echo "ERRO: '$DESTINO' não parece ser um repositório git (sem .git)." >&2
    exit 1
fi

echo "Origem:  $ORIGEM"
echo "Destino: $DESTINO"
echo

# ── 1. Ficheiros/diretórios a copiar (mantém estrutura relativa) ────────
ITENS=(
    index.md
    _config.yml
    _includes
    _sass
    imagens
    regulamento
    facilitacao
    eventos
)

# ── 2. Copiar ────────────────────────────────────────────────────────────
for item in "${ITENS[@]}"; do
    src="$ORIGEM/$item"
    dst="$DESTINO/$item"
    if [[ -e "$src" ]]; then
        echo "  →  $item"
        # Remove destino para copiar de novo (evita manter ficheiros
        # apagados na origem dentro de diretórios)
        rm -rf "$dst"
        if [[ -d "$src" ]]; then
            cp -a "$src" "$dst"
        else
            cp "$src" "$dst"
        fi
    else
        echo "  ⚠  $item não existe na origem — a ignorar"
    fi
done

# ── 3. Ajustar _config.yml para servir na raiz (sem baseurl) ───────────
#    - Remove/limpa a linha baseurl
#    - Logo path com / no início (raiz do domínio)
#    - Garante que não exclui AGENTS.md e docs/ (só existem na origem)
#    - Mantém o resto (title, description, remote_theme, etc.)
CONFIG="$DESTINO/_config.yml"

# Remover baseurl (qualquer formato: com ou sem aspas)
if [[ "$(uname)" == "Darwin" ]]; then
    sed -i '' '/^baseurl:/d' "$CONFIG"
else
    sed -i '/^baseurl:/d' "$CONFIG"
fi

# Garantir que logo tem / no início (para servir da raiz)
if grep -q '^logo:' "$CONFIG" && ! grep -q '^logo: /' "$CONFIG"; then
    if [[ "$(uname)" == "Darwin" ]]; then
        sed -i '' 's/^logo: \(.*\)/logo: \/\1/' "$CONFIG"
    else
        sed -i 's/^logo: \(.*\)/logo: \/\1/' "$CONFIG"
    fi
fi

# Remover da exclude: AGENTS.md, docs/ (não existem no destino)
if [[ "$(uname)" == "Darwin" ]]; then
    sed -i '' '/^[[:space:]]*- AGENTS\.md$/d' "$CONFIG"
    sed -i '' '/^[[:space:]]*- docs\/$/d' "$CONFIG"
else
    sed -i '/^[[:space:]]*- AGENTS\.md$/d' "$CONFIG"
    sed -i '/^[[:space:]]*- docs\/$/d' "$CONFIG"
fi

# ── 4. Manter README.md específico do github.io ─────────────────────────
# O README.md do paln-publico não é copiado (não está em ITENS), por isso
# o README.md do destino fica intacto.

echo
echo "Sincronização concluída."
echo "Verifique o diff em: $DESTINO"
echo "  git -C '$DESTINO' diff --stat"
echo
echo "Depois de confirmar as alterações, faça commit e push:"
echo "  git -C '$DESTINO' add -A && git commit -m 'Sincroniza com paln-publico' && git push"
