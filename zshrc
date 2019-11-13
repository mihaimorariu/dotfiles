# Set variables.
ZSH=/usr/share/oh-my-zsh/
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
ZSH_SH_DIR=/usr/share/zsh/plugins/zsh-syntax-highlighting
ZSH_LOCAL=$HOME/.zshrc.local
ZSH_ALIASES=$HOME/.aliases

# Configure oh-my-zsh.
ZSH_THEME="bira"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"

plugins=(
  fzf
  git
  gpg-agent
  zsh-syntax-highlighting
)

[ ! -d $ZSH_CACHE_DIR ] && mkdir $ZSH_CACHE_DIR
[ -f $ZSH_LOCAL ] && source $ZSH_LOCAL

# Communicate with a running GPG agent.
gpg-connect-agent updatestartuptty /bye > /dev/null

# Source related files.
source $ZSH/oh-my-zsh.sh
source $ZSH_SH_DIR/zsh-syntax-highlighting.zsh
source $ZSH_ALIASES

# Disable annoying vim freeze behavior.
stty -ixon
