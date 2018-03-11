#! /bin/bash

. $(dirname $0)/i3_lemonbar_config

if [ $(pgrep -cx $(basename $0)) -gt 1 ] ; then
    printf "%s\n" "The status bar is already running." >&2
    exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "${panel_fifo}" ] && rm "${panel_fifo}"
mkfifo "${panel_fifo}"

# Window title, "WIN"
xprop -spy -root _NET_ACTIVE_WINDOW | sed -un 's/.*\(0x.*\)/WIN\1/p' > "${panel_fifo}" &

# i3 Workspaces, "WSP"
# TODO : Restarting I3 breaks the IPC socket con. :(
$(dirname $0)/i3_workspaces.pl > "${panel_fifo}" &

# Conky, "SYS"
conky -c $(dirname $0)/i3_lemonbar_conky > "${panel_fifo}" &

# Update interval meters
cnt_vol=${upd_vol}

while :; do
  # Volume, "VOL"
  if [ $((cnt_vol++)) -ge ${upd_vol} ]; then
    amixer get Master | grep "${snd_cha}" | awk -F'[]%[]' '/%/ {if ($7 == "off") {print "VOL×\n"} else {printf "VOL%d%%\n", $2}}' > "${panel_fifo}" &
    cnt_vol=0
  fi

  # Finally, wait 1 second
  sleep 1s;

done &

cat "${panel_fifo}" | $(dirname $0)/i3_lemonbar_parser.sh \
  | lemonbar -p -f "${font}" -f "${iconfont}" -g "${geometry}" -B "${color_back}" -F "${color_fore}" &

wait

