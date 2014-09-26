export TERM=xterm-256color
export EDITOR=vim
export TODOTXT_DEFAULT_ACTION=ls

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin


if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
