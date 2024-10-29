notify-send "sistem keluar"
sudo udisksctl unmount -b /dev/sdb1
sudo udisksctl power-off -b /dev/sdb
sudo udisksctl unmount -b /dev/sda1
sudo udisksctl power-off -b /dev/sda
#sudo reboot
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
  sudo reboot
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
mpv --screen=1 --fs --fs-screen=1 ~/wollpeper/exit.mp4
sudo shutdown -h now
fi 
if [[ $biji == 4 ]]; then
  sudo logout
fi
