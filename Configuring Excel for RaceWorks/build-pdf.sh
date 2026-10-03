#!/usr/bin/env bash
# Build "Configuring Excel for RaceWorks.pdf" from the .md and the PNG screenshots beside it.
# Requires pandoc, weasyprint and the Oswald font
# (Fedora: sudo dnf install pandoc weasyprint vernnobile-oswald-fonts). Poppins is in fonts/.
# Run from anywhere:  bash "/home/claude/ISDRA/Raceworks/Configuring Excel for RaceWorks/build-pdf.sh"
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"

SRC="Configuring Excel for RaceWorks.md"
OUT="Configuring Excel for RaceWorks.pdf"

pandoc "$SRC" \
    --from markdown \
    --standalone \
    --embed-resources \
    --css guide.css \
    --pdf-engine weasyprint \
    --output "$OUT"

echo "Built: $OUT"
