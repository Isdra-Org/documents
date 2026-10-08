#!/usr/bin/env bash
# Build "Configuring Excel for RaceWorks.pdf" with the shared template (../template).
# Run from anywhere:  bash "/home/claude/ISDRA/Documents/Configuring Excel for RaceWorks/build-pdf.sh"
set -euo pipefail
here="$(dirname "$(readlink -f "$0")")"
exec bash "$here/../template/build-guide.sh" "$here"
