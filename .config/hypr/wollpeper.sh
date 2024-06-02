#!/bin/bash
cd ~/wollpeper/buhaji/
ls -v | cat -n | while read n f; do mv -n "$f" "$n.jpg"; done 
exitfn () {
  trap SIGINT
  echo; swww img ~/wollpeper/meeku.jpg --transition-type outer --transition-pos 0.854,0.977 --transition-step 90
  # echo; "owo"
  exit
}
trap "exitfn" INT
while true
do 
  yeet=$(cd ~/wollpeper/buhaji; ls | ls -1 | wc -l)
  biji=$(shuf -i 1-$yeet -n1)
  notify-send "ganti jadi $biji.jpg"
  swww img ~/wollpeper/buhaji/$biji.jpg --transition-type outer --transition-pos 0.854,0.977 --transition-step 90
  sleep 10
  trap SIGINT
done
