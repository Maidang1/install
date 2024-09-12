
brew install --cask raycast

echo "success install raycast"

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Add plugins to .zshrc
sed -i '' 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc


# Install iTerm2
brew install --cask iterm2

# Set iTerm2 as the default terminal (optional)
# You may need to manually set this in System Preferences > Default apps

echo "Oh My Zsh and iTerm2 have been installed successfully!"
# echo "Please restart your terminal or run 'source ~/.zshrc' to apply changes."

# Install nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Add nvm to shell configuration
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc

# Install fnm (Fast Node Manager)
brew install fnm

# Add fnm to shell configuration
echo 'eval "$(fnm env --use-on-cd)"' >> ~/.zshrc

echo "nvm and fnm have been installed successfully!"


# Install Lazygit
brew install lazygit

echo "Lazygit has been installed successfully!"



# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Add Rust to PATH
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc

# Install common Rust tools
rustup component add rustfmt
rustup component add clippy

# Install cargo-edit for easier dependency management
cargo install cargo-edit

echo "Rust development environment has been installed successfully!"




# Install Bun
curl -fsSL https://bun.sh/install | bash

# Add Bun to PATH
echo 'export BUN_INSTALL="$HOME/.bun"' >> ~/.zshrc
echo 'export PATH="$BUN_INSTALL/bin:$PATH"' >> ~/.zshrc

# Add Bun completions
echo '[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"' >> ~/.zshrc

echo "Bun development environment has been installed successfully!"




# Install pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Add pnpm to PATH
echo 'export PNPM_HOME="$HOME/Library/pnpm"' >> ~/.zshrc
echo 'case ":$PATH:" in' >> ~/.zshrc
echo '  *":$PNPM_HOME:"*) ;;' >> ~/.zshrc
echo '  *) export PATH="$PNPM_HOME:$PATH" ;;' >> ~/.zshrc
echo 'esac' >> ~/.zshrc
echo "pnpm has been installed successfully!"

echo "Zsh plugins have been installed and configured successfully!"


# Install Starship
brew install starship

# Add Starship to shell configuration
echo 'eval "$(starship init zsh)"' >> ~/.zshrc


# Create or overwrite the Starship configuration file
cat > ~/.config/starship.toml << EOL
[git_branch]
symbol = "🌱 "

[git_commit]
commit_hash_length = 4
tag_symbol = '🔖 '

[git_status]
conflicted = "🏳"
ahead = "🏎💨"
behind = "😰"
diverged = "😵"
up_to_date = "✓"
untracked = "🤷"
stashed = "📦"
modified = "📝"
staged = '[++\($count\)](green)'
renamed = "👅"
deleted = "🗑"

[git_state]
format = '[\($state( $progress_current of $progress_total)\)]($style) '
cherry_pick = '[🍒 PICKING](bold red)'

[git_metrics]
added_style = 'bold blue'
format = '[+$added]($added_style)/[-$deleted]($deleted_style) '

[nodejs]
format = 'via [🤖 $version](bold green) '
EOL

echo "Starship has been installed successfully!"
echo "Starship configuration has been updated successfully!"



# 统计代码行数
brew install tokei

brew install git-delta

# Create or update Git configuration
cat > ~/.gitconfig << EOL
[filter "lfs"]
clean = git-lfs clean -- %f
smudge = git-lfs smudge -- %f
process = git-lfs filter-process
required = true
[init]
defaultBranch = master
[i18n]
commitEncoding = utf-8
logOutputEncoding = utf-8

[core]
pager = delta

[interactive]
diffFilter = delta --color-only

[delta]
navigate = true # use n and N to move between diff sections
light = false   # set to true if you're in a terminal w/ a light background color (e.g. the default macOS terminal)
side-by-side = true
[merge]
conflictstyle = diff3

[pager]
blame = delta
[color "blame"]
added = green
modified = yellow
removed = red
[rerere]
enabled = true
[column]
ui = auto

[diff]
tool = difftastic

[difftool]
prompt = false

[difftool "difftastic"]
cmd = difft "\$LOCAL" "\$REMOTE"

[pager]
difftool = true

[alias]
dft = difftool
[pull]
	rebase = true
EOL

echo "Git configuration has been updated successfully!"



echo "Please restart your terminal or run 'source ~/.zshrc' to apply changes."

