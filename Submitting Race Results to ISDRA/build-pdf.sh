#!/usr/bin/env bash
# Build "Submitting Race Results to ISDRA.pdf" with the shared template (../template).
# Run from anywhere:  bash "/home/claude/ISDRA/Documents/Submitting Race Results to ISDRA/build-pdf.sh"
set -euo pipefail
here="$(dirname "$(readlink -f "$0")")"
exec bash "$here/../template/build-guide.sh" "$here"
