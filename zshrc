# Set variables.
ZSH=/usr/share/oh-my-zsh
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
ZSH_SH_DIR=/usr/share/zsh/plugins/zsh-syntax-highlighting
ZSH_LOCAL=$HOME/.zshrc.local
ZSH_ALIASES=$HOME/.aliases

# Configure oh-my-zsh.
ZSH_THEME="bira"
SOLARIZED_THEME="dark"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"

plugins=(
  fzf
  git
  gpg-agent
)

[ ! -d $ZSH_CACHE_DIR ] && mkdir $ZSH_CACHE_DIR
[ -f $ZSH_LOCAL ] && source $ZSH_LOCAL

# Export dotfiles/bin.
export PATH=$PATH:$HOME/.dotfiles/bin

# Communicate with a running GPG agent.
gpg-connect-agent updatestartuptty /bye > /dev/null

# Source related files.
source $ZSH_ALIASES
source $ZSH/oh-my-zsh.sh
source $ZSH_SH_DIR/zsh-syntax-highlighting.zsh

# Disable annoying vim freeze behavior.
stty -ixon
