case $(uname) in
  'Linux')   export TERM=termite ;;
  'Darwin')  export TERM=xterm-256color ;;
esac

export PATH=/usr/local/bin:$PATH
export EDITOR=vim
export BROWSER=chromium
export XDG_CONFIG_HOME=$HOME/.config
