#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$ROOT_DIR/src"
DIST_DIR="$ROOT_DIR/dist"
DOCS_DIR="$ROOT_DIR/docs"

mkdir -p "$DIST_DIR"

cat \
  "$SRC_DIR/tokens.css" \
  "$SRC_DIR/base.css" \
  "$SRC_DIR/animations.css" \
  "$SRC_DIR/components.css" \
  "$SRC_DIR/utilities.css" \
  "$SRC_DIR/themes.css" \
  > "$DIST_DIR/yashrajnayak-design-system.css"

cp "$DIST_DIR/yashrajnayak-design-system.css" "$DIST_DIR/yashrajnayak-design-system.min.css"
cp "$DIST_DIR/yashrajnayak-design-system.css" "$DOCS_DIR/yashrajnayak-design-system.css"

echo "Built $DIST_DIR/yashrajnayak-design-system.css"
