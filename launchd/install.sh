#!/usr/bin/env bash
set -euo pipefail

# Installs every *.plist in this directory as a user LaunchAgent by
# symlinking it into ~/Library/LaunchAgents and (re)bootstrapping it.
# Re-runnable: existing agents are booted out and re-loaded.

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="$HOME/Library/LaunchAgents"
DOMAIN="gui/$(id -u)"

mkdir -p "$DEST_DIR"

shopt -s nullglob
for src in "$SRC_DIR"/*.plist; do
  name=$(basename "$src")
  label="${name%.plist}"
  dest="$DEST_DIR/$name"

  ln -sfn "$src" "$dest"
  echo "linked  $dest -> $src"

  launchctl bootout "$DOMAIN/$label" 2>/dev/null || true
  launchctl bootstrap "$DOMAIN" "$dest"
  echo "loaded  $label"
done
