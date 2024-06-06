#!/usr/bin/env bash

# Directory containing the images
DIR="$1"

if [[ -z "$DIR" ]]; then
	echo "Usage: $0 <directory>"
	exit 1
fi

# Check if ImageMagick is installed
if ! command -v magick &>/dev/null; then
	echo "ImageMagick (magick) could not be found, please install it first."
	exit 1
fi

# Convert all images to PNG
for file in "$DIR"/*; do
	if [[ -f "$file" ]]; then
		# Get the filename without extension
		filename=$(basename -- "$file")
		extension="${filename##*.}"
		filename="${filename%.*}"

		# Convert the file to PNG format
		magick convert "$file" "$DIR/$filename.png"

		# Optionally, remove the original file if you want to replace it
		# rm "$file"
	fi
done

echo "Conversion completed."
