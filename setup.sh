# --- functions ---
create_symlink() {
  local TARGET_PATH=$1
  local SOURCE_PATH=$2
  mkdir -p "$(dirname "$TARGET_PATH")"
  if [ -L "$TARGET_PATH" ] || [ -e "$TARGET_PATH" ]; then
    if [ "$(readlink "$TARGET_PATH" 2>/dev/null)" = "$SOURCE_PATH" ]; then
      echo "Symlink already correct: $TARGET_PATH -> $SOURCE_PATH"
      return
    fi
    echo "Existing item found at $TARGET_PATH. Backing up..."
    TIMESTAMP=$(date +"%Y%m%d%H%M%S")
    BACKUP_PATH="${TARGET_PATH}.bak_${TIMESTAMP}"
    mv "$TARGET_PATH" "$BACKUP_PATH"
    echo "Backed up to $BACKUP_PATH"
  fi

  ln -s "$SOURCE_PATH" "$TARGET_PATH"
  echo "Symbolic link created: $TARGET_PATH -> $SOURCE_PATH"
}

brew_init() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # homebrew
  brew install --cask kitty
  brew install tmux
  brew tap homebrew/cask-fonts
  brew install --cask font-fira-code-nerd-font
  brew untap homebrew/cask-fonts
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- init config files ---
create_symlink $HOME/.zshrc $SCRIPT_DIR/zshrc/zshrc-macos.sh
create_symlink $HOME/.config/kitty/kitty.conf $SCRIPT_DIR/kitty/kitty.conf
create_symlink $HOME/.config/nvim $SCRIPT_DIR/nvim
