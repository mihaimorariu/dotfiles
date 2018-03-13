ZSH=/usr/share/oh-my-zsh/
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
ZSH_SH_DIR=/usr/share/zsh/plugins/zsh-syntax-highlighting

ZSH_THEME="bira"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"

plugins=(
  git
  zsh-syntax-highlighting
)

[[ ! -d $ZSH_CACHE_DIR ]] && mkdir $ZSH_CACHE_DIR

source $ZSH/oh-my-zsh.sh
source $ZSH_SH_DIR/zsh-syntax-highlighting.zsh

ZSH_LOCAL=$HOME/.zshrc.local
[[ ! -f $ZSH_LOCAL ]] && source $ZSH_LOCAL
