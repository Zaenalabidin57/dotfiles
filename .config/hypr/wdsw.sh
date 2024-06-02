  yeet=$(cd ~/wollpeper/dolls; ls | ls -1 | wc -l)
  biji=$(shuf -i 1-$yeet -n1)
  swww init
  while true
  do
	biji=$(shuf -i 1-$yeet -n1)
	swww img ~/wollpeper/dolls/$biji.jpg --transition-type outer --transition-pos 0.854,0.977 --transition-step 90
	sleep 3
  done
