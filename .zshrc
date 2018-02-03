ZSH=$HOME/.oh-my-zsh/

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(zsh-syntax-highlighting)

export PATH=/home/chris/.local/bin:$PATH
export TERM=xterm-256color
export EDITOR=vim
export ASPNETCORE_ENVIRONMENT=development

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias csx='cd /mnt/c/Users/CHull/Source/Repos/csx2/CSX.Core/'

ZSH_THEME=powerlevel9k/powerlevel9k
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
