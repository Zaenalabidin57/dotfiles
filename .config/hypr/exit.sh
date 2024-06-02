notify-send "sistem keluar"
sudo udisksctl unmount -b /dev/sdb1
sudo udisksctl power-off -b /dev/sdb
sudo udisksctl unmount -b /dev/sda1
sudo udisksctl power-off -b /dev/sda
cliphist wipe
# read -p"pilih sistem $'\n'1. reboot \n2. poweroff \n3. shutdown \n4. masuk ke sddm\n" biji
echo ""
echo ""
echo ""
echo ""
echo ""
clear
echo "pilih sistem"
echo "r. reboot"
echo "p. poweroff"
echo "s. shutdown"
echo "w. masuk ke sddm"
read -p":" biji
if [[ $biji == r ]]; then
  reboot
fi
if [[ $biji == p ]]; then
  swaylock
fi
if [[ $biji == w ]]; then
  hyprctl dispatch exit
  pkill Hypr
fi
if [[ $biji == s ]]; then
echo "shutting down in 5 seconds"
mpv --no-vid ~/.config/hypr/shutdown.mp3
# echo "bye bye :3"
# hour=0
#  min=0
#   sec=5
# while [ $hour -ge 0 ]; do
#        while [ $min -ge 0 ]; do
#               while [ $sec -ge 0 ]; do
#                  echo -ne "$hour:$min:$sec\033[0K\r"
#                     let "sec=sec-1"
#                      sleep 1
#                       done
#                        sec=59
#                           let "min=min-1"
#                    done
#                     min=59
#                                                                                                                                                                                                                                                                                          let "hour=hour-1"
#                                                                                                                                                                                                                                                                                                   done
                                                                                                                                                                                                                                                    shutdown -h now
fi 
if [[ $biji == 4 ]]; then
  logout
fi
