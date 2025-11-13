#!/usr/bin/env bash
# Draw keymap using keymap-drawer with uv
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/keymap_drawer.config.yaml"
KEYMAP_FILE="$SCRIPT_DIR/config/glove80.keymap"
OUTPUT_DIR="$SCRIPT_DIR/keymap-drawer"
OUTPUT_YAML="$OUTPUT_DIR/glove80.yaml"
OUTPUT_SVG="$OUTPUT_DIR/glove80.svg"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Parse the keymap
echo "Parsing keymap from $KEYMAP_FILE..."
if [ -f "$CONFIG_FILE" ]; then
    uvx --from keymap-drawer keymap -c "$CONFIG_FILE" parse -z "$KEYMAP_FILE" > "$OUTPUT_YAML"
else
    uvx --from keymap-drawer keymap parse -z "$KEYMAP_FILE" > "$OUTPUT_YAML"
fi

# Draw the SVG
echo "Drawing SVG to $OUTPUT_SVG..."
if [ -f "$CONFIG_FILE" ]; then
    uvx --from keymap-drawer keymap -c "$CONFIG_FILE" draw "$OUTPUT_YAML" > "$OUTPUT_SVG"
else
    uvx --from keymap-drawer keymap draw "$OUTPUT_YAML" > "$OUTPUT_SVG"
fi

echo "Done! Keymap saved to:"
echo "  YAML: $OUTPUT_YAML"
echo "  SVG:  $OUTPUT_SVG"
