#!/bin/bash

# Check if the symlink exists before creating it
TARGET="$(pwd)/nvim"
SYMLINK="$HOME/.config"
if [ -L "$SYMLINK/nvim" ]; then
    echo "Symlink already exists at '$SYMLINK/nvim'. Unlinking it first."
    unlink "$SYMLINK/nvim"
fi

echo "Creating link to '$TARGET' at '$SYMLINK'"
ln -s $TARGET $SYMLINK

# Tmux symlink
TARGET="$(pwd)/.tmux.conf"
SYMLINK="$HOME"
if [ -L "$SYMLINK/.tmux.conf" ]; then
    echo "Symlink already exists at '$SYMLINK/.tmux.conf'. Unlinking it first."
    unlink "$SYMLINK/.tmux.conf"
fi
echo "Creating link to '$TARGET' at '$SYMLINK'"
ln -s $TARGET $SYMLINK

# Tmux plugins
TARGET="$(pwd)/.tmux/plugins"
SYMLINK="$HOME/.tmux"
if [ -L "$SYMLINK/plugins" ]; then
    echo "Symlink already exists at '$SYMLINK/plugins'. Unlinking it first."
    unlink "$SYMLINK/plugins"
fi
echo "Creating link to '$TARGET' at '$SYMLINK'"
ln -s $TARGET $SYMLINK
