#!/bin/bash
set -e

# Check that the `convert` and `ffmpeg` commands exist`
if ! command -v convert &> /dev/null; then
	echo "Error: 'convert' command not found. Please install ImageMagick."
	exit 1
fi

if ! command -v ffmpeg &> /dev/null; then
	echo "Error: 'ffmpeg' command not found. Please install ffmpeg."
	exit 1
fi

mkdir -p ./temp
wget -O ./temp/temp-favicon.png "https://raw.githubusercontent.com/Proman4713/Utile-OS/refs/heads/main/resources/Utile%20Transparent%20Logo.png"

convert ./temp/temp-favicon.png -resize 64x ./temp/resized-favicon.png
ffmpeg -i ./temp/resized-favicon.png ./favicon.ico

convert ./temp/temp-favicon.png -resize 192x ./logo192.png

rm -rf ./temp