#!/usr/bin/env bash
# Build "Submitting Race Results to ISDRA.pdf" from the .md (and any PNG screenshots) beside it.
# Requires pandoc, weasyprint and the Oswald font
# (Fedora: sudo dnf install pandoc weasyprint vernnobile-oswald-fonts). Poppins is in fonts/.
# Run from anywhere:  bash "/home/claude/ISDRA/Raceworks/Maintenance Project/guides/Submitting Race Results to ISDRA/build-pdf.sh"
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"

SRC="Submitting Race Results to ISDRA.md"
OUT="Submitting Race Results to ISDRA.pdf"

pandoc "$SRC" \
    --from markdown \
    --standalone \
    --embed-resources \
    --css guide.css \
    --pdf-engine weasyprint \
    --output "$OUT"

echo "Built: $OUT"
