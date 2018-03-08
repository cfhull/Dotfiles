ZSH=$HOME/.oh-my-zsh/

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(zsh-syntax-highlighting)
case $(uname) in
  'Linux')   export TERM=termite ;;
  'Darwin')  export TERM=xterm-256color ;;
esac

export PATH=/usr/local/bin:$PATH
export EDITOR=vim
export BROWSER=chromium
export XDG_CONFIG_HOME=$HOME/.config

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

#ZSH_THEME=powerlevel9k
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="↳ "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
