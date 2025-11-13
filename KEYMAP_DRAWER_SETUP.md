# Keymap Drawer Setup

This repository is now configured to use [keymap-drawer](https://github.com/caksoylar/keymap-drawer) to generate visual representations of your ZMK keymap.

## What Was Set Up

1. **Local Script (`draw-keymap.sh`)**: A shell script that uses `uv` to run keymap-drawer
   - Parses `config/glove80.keymap` 
   - Generates YAML representation at `keymap-drawer/glove80.yaml`
   - Generates SVG visualization at `keymap-drawer/glove80.svg`

2. **GitHub Actions Workflow (`.github/workflows/draw-keymaps.yml`)**: Automatically regenerates keymap on push
   - Triggers on changes to `config/*.keymap`, `config/*.dtsi`, or `keymap_drawer.config.yaml`
   - Uploads generated files as build artifacts (not committed to repository)
   - Uses `uv` to run keymap-drawer
   - Download artifacts from the Actions tab → "Draw ZMK keymaps" workflow → workflow run → "keymap-visualization" artifact

3. **Configuration File (`keymap_drawer.config.yaml`)**: Customize appearance and behavior
   - Font sizes, colors, spacing
   - Key dimensions
   - SVG glyphs
   - See [CONFIGURATION.md](https://github.com/caksoylar/keymap-drawer/blob/main/CONFIGURATION.md)

4. **Output Directory (`keymap-drawer/`)**: Contains generated files
   - `glove80.yaml`: Parsed keymap in YAML format (can be manually edited)
   - `glove80.svg`: Visual representation of the keymap

## Usage

### Generate Locally

```bash
./draw-keymap.sh
```

Requirements: [uv](https://docs.astral.sh/uv/) (already installed on your system)

### Customize Appearance

Edit `keymap_drawer.config.yaml` to customize:
- Colors and styling
- Font sizes
- Key dimensions
- SVG glyphs for special keys

### Manual Tweaks

After initial generation, you can manually edit `keymap-drawer/glove80.yaml` to:
- Adjust combo positioning with `align` and `offset` properties
- Change display names for keys
- Add `type` specifiers (e.g., "ghost" for optional keys)

Then regenerate only the SVG:
```bash
uvx --from keymap-drawer keymap draw keymap-drawer/glove80.yaml > keymap-drawer/glove80.svg
```

### Re-parse After Changes

To preserve manual tweaks when re-parsing:
```bash
uvx --from keymap-drawer keymap parse -z config/glove80.keymap -b keymap-drawer/glove80.yaml > keymap-drawer/glove80-new.yaml
```

## Resources

- [keymap-drawer GitHub](https://github.com/caksoylar/keymap-drawer)
- [Web App Demo](https://caksoylar.github.io/keymap-drawer)
- [Configuration Documentation](https://github.com/caksoylar/keymap-drawer/blob/main/CONFIGURATION.md)
- [Keymap Spec](https://github.com/caksoylar/keymap-drawer/blob/main/KEYMAP_SPEC.md)
