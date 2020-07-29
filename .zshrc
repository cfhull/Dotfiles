case $(uname) in
  'Linux')
    export BROWSER=chromium
    ;;
  'Darwin')
    export BROWSER=google-chrome
    ;;
esac


autoload -Uz compinit
compinit

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion"

export TERM=xterm-256color
export PATH=/usr/local/bin:/home/chris/.local/bin:$PATH
export EDITOR=vim
export XDG_CONFIG_HOME=$HOME/.config
export KEYTIMEOUT=1

alias vim="nvim"
alias vimrc="vim ~/.config/nvim/init.vim"
alias scrotclip=$'scrot \'/tmp/%F_%T.png\' -s -e \'xclip -selection c -t image/png $f\''

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GEM_HOME=~/.gems
export PATH=$PATH:~/.gems/bin

export FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD=fojr-mvvz-qibl-nuhx

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

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh

fpath=(~/.zsh/zsh-completions/ $fpath)

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source ~/.profile


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
