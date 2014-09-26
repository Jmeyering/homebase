alias tmux="TERM=xterm-256color /usr/bin/tmux"
alias t='~/todo.sh -d ~/todo.cfg'
alias ..='cd ../'
alias stopwatch='date1=`date +%s`; while true; do echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S:%N)\r"; done'
