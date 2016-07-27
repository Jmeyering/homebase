export TERM=xterm-256color
export EDITOR=vim
export TODOTXT_DEFAULT_ACTION=ls

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GO15VENDOREXPERIMENT=1
export PATH=$PATH:/usr/local/go_appengine
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin


if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
