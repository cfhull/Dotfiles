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
POWERLEVEL9K_VCS_GIT_HOOKS=(git-remotebranch)

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

source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh


bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
