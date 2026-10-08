#!/usr/bin/env bash
# Build one guide's PDF with the shared ISDRA look (guide.css, logo and fonts in this folder).
#   bash template/build-guide.sh "<guide folder>"
# The guide folder holds "<folder name>.md", its PNG screenshots and, optionally, guide-extra.css
# (rules for that guide only, loaded after guide.css). The PDF is written beside the .md.
# Requires pandoc, weasyprint and the Oswald font
# (Fedora: sudo dnf install pandoc weasyprint vernnobile-oswald-fonts). Poppins is in fonts/.
set -euo pipefail
TEMPLATE="$(dirname "$(readlink -f "$0")")"
GUIDE="$(readlink -f "${1:?usage: build-guide.sh <guide folder>}")"
NAME="$(basename "$GUIDE")"
cd "$GUIDE"

CSS=(--css "$TEMPLATE/guide.css")
if [[ -f guide-extra.css ]]; then CSS+=(--css guide-extra.css); fi

pandoc "$NAME.md" \
    --from markdown \
    --standalone \
    --embed-resources \
    "${CSS[@]}" \
    --pdf-engine weasyprint \
    --output "$NAME.pdf"

echo "Built: $GUIDE/$NAME.pdf"
