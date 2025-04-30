#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
EXCLUDES=(".git" ".gitignore" "install.sh", "README.md", ".DS_Store") 


for file in "$HOME"/.??*; do
  filename=$(basename "$file")

  echo "Syncing $filename"

  if [[ " ${EXCLUDES[*]} " == *" $filename "* ]]; then
    continue
  fi

  if [ -d "$file" ]; then
    echo "Skipping $file"
    continue
  fi

  target="$DOTFILES_DIR/$filename"

  if ! cp "$HOME/$filename" "$DOTFILES_DIR/$filename"; then
    echo "Failed to sync $filename"
    continue
  fi

done

echo "Synced, ready for committing"
