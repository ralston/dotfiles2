#!/usr/bin/env bash

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
EXCLUDES=(".git" ".gitignore" "install.sh", "README.md") 


for file in "$DOTFILES_DIR"/.??* "$DOTFILES_DIR"/*; do
  filename=$(basename "$file")

  if [[ " ${EXCLUDES[*]} " == *" $filename "* ]]; then
    continue
  fi

  target="$HOME/$filename"

  echo "Creating symlink: $target → $file"
  ln -s "$file" "$target"
done

echo "Done."
