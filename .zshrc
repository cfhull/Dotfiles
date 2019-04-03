case $(uname) in
  'Linux')
    export BROWSER=chromium
    ;;
  'Darwin')
    export BROWSER=google-chrome
    ;;
esac

export ASPNETCORE_ENVIRONMENT=development
export TERM=xterm-256color
export PATH=/usr/local/bin:/home/chris/.local/bin:$PATH
export EDITOR=vim
export XDG_CONFIG_HOME=$HOME/.config
export KEYTIMEOUT=1

alias vim="nvim"
alias scrotclip=$'scrot \'/tmp/%F_%T.png\' -s -e \'xclip -selection c -t image/png $f\''


if [ -f ~/local-aliases ]; then
    source ~/local-aliases
fi

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  context
  dir_writable
  dir
  #vcs # way too slow to be usable
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status
  vi_mode
)

source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
