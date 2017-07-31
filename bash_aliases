alias tmux="TERM=xterm-256color /usr/bin/tmux"
alias vim="nvim"
alias t="~/todo.sh -d ~/todo.cfg"
alias ..="cd ../"

function z() {
    if ! tmux list-sessions | grep -q "failed to connect to server"; then
        # tmux has no sessions
        $(cd $GOPATH/src/github.com/zealotapp && tmux new -s zealot)
    elif ! tmux list-sessions | grep -q zealot; then
        # zealot session does not exist so create one.
        $(cd $GOPATH/src/github.com/zealotapp && tmux new -s zealot)
    else
        # zealot tmux session exists
        tmux attach -t zealot
    fi
}
