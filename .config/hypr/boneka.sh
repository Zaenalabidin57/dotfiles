#!/bin/bash

# Folder containing your images
image_folder="/home/shigure/wollpeper/dolls/randos"

# Infinite loop
while true; do
  # Get a random list of 10 image paths with filetypes (using shuf if available)
  all_images=$(find "$image_folder" -type f \( -name "*.jpg" -or -name "*.png" \) -maxdepth 0)
  if command -v shuf &> /dev/null; then
    random_images=$(shuf -n 10 <<< "$all_images")
  else
    random_images=$(shuf -e "$all_images" | head -n 10)
  fi

  # Loop through each image path and construct the command with filename and filetype
  for image_path in $random_images; do
    filename=$(basename "$image_path")
    filetype=${filename##*.}
    swww img "$filename""$filetype"
  done

  # Wait for 10 seconds before looping again
  sleep 10
done

