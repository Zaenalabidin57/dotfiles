#!/bin/bash
cd ~/wollpeper/buhaji/
ls -v | cat -n | while read n f; do mv -n "$f" "$n.jpg"; done 
exitfn () {
  trap SIGINT
  echo; feh --bg-fill ~/wollpeper/meeku.jpg
  # echo; "owo"
  exit
}
trap "exitfn" INT
while true
do 
  yeet=$(cd ~/wollpeper/buhaji; ls | ls -1 | wc -l)
  biji=$(shuf -i 1-$yeet -n1)
  notify-send "ganti jadi $biji.jpg"
  feh --bg-fill ~/wollpeper/buhaji/$biji.jpg
  sleep 10
  trap SIGINT
done
