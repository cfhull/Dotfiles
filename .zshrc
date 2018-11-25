case $(uname) in
  'Linux')   export TERM=termite ;;
  'Darwin')  export TERM=xterm-256color ;;
esac

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  zsh-syntax-highlighting,
  git,
  zsh-autosuggestions
)

export PATH=/usr/local/bin:/home/chris/.local/bin:$PATH
export TERM=xterm-256color
export TERMINAL=termite
export EDITOR=vim
export BROWSER=chromium
export XDG_CONFIG_HOME=$HOME/.config
export ZSH=/usr/share/oh-my-zsh/

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias vim="nvim"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="↳ "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

alias scrotclip= 'scrot -s ~/foo.png && xclip -selection clipboard -t image/png ~/foo.png && rm ~/foo.png'

source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/oh-my-zsh/oh-my-zsh.sh
