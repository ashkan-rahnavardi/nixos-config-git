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

# Initialize a counter variable
counter=0

# Convert all images to PNG
for file in "$DIR"/*; do
	if [[ -f "$file" ]]; then
		# Get the filename without extension
		filename=$(basename -- "$file")
		extension="${filename##*.}"
		filename="${filename%.*}"

		# Check if the image is grayscale
		colorspace=$(magick identify -format "%[colorspace]" "$file")

		if [[ "$colorspace" == "Gray" ]]; then
			# Strip color profile if grayscale and convert to PNG
			magick convert "$file" -strip "$DIR/$filename.png"
		else
			# Just convert if not grayscale
			magick convert "$file" "$DIR/$filename.png"
		fi

		# Alternate between two emojis
		if ((counter % 2 == 0)); then
			echo "PooPoo 💩"
		else
			echo "PeePee 🚽 𓂺   "
		fi

		# Increment the counter
		((counter++))
	fi
done

echo "🥵🥵🥵🥵 That was a lot of shiddn n pissn but I finished"
