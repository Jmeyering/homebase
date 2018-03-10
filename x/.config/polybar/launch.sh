# Terminate already running bad instances
killall -q polybar

for i in $(polybar -m | awk -F: '{print $1}');
  do MONITOR=$i polybar main_bar -c ~/.config/polybar/config & done
