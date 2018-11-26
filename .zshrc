case $(uname) in
  'Linux')
    export BROWSER=chromium
    ;;
  'Darwin')
    export BROWSER=google-chrome
    ;;
esac

export TERM=xterm-256color
export PATH=/usr/local/bin:/home/chris/.local/bin:$PATH
export EDITOR=vim
export XDG_CONFIG_HOME=$HOME/.config
export KEYTIMEOUT=1

alias scrotclip='scrot -s ~/foo.png && xclip -selection clipboard -t image/png ~/foo.png && rm ~/foo.png'
alias vim="nvim"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  context
  dir_writable
  dir
  vcs
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status
  vi_mode
)

source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
