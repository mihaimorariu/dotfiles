ZSH=/usr/share/oh-my-zsh/
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
ZSH_SH_DIR=/usr/share/zsh/plugins/zsh-syntax-highlighting
ZSH_LOCAL=$HOME/.zshrc.local
ZSH_ALIASES=$HOME/.aliases

# oh-my-zsh configuration
ZSH_THEME="bira"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"

plugins=(
  git
  zsh-syntax-highlighting
)

[ ! -d $ZSH_CACHE_DIR ] && mkdir $ZSH_CACHE_DIR
[   -f $ZSH_LOCAL     ] && source $ZSH_LOCAL

source $ZSH/oh-my-zsh.sh
source $ZSH_SH_DIR/zsh-syntax-highlighting.zsh
source $ZSH_ALIASES
