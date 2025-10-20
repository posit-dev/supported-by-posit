#!/bin/bash

# Check if URL is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <url> [output-file]"
  echo "Example: $0 http://localhost:3000 screenshot.png"
  exit 1
fi

URL=$1
WIDTH=$2
OUTPUT=${3:-"screenshot-$(date +%Y%m%d-%H%M%S).png"}

# Take screenshot using Chrome
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu --screenshot="$OUTPUT" \
  --window-size="$WIDTH,300" --hide-scrollbars --virtual-time-budget=5000 "$URL"

if [ $? -eq 0 ]; then
  echo "Screenshot of $URL saved to $OUTPUT"
else
  echo "Error: Failed to take screenshot of $URL"
  exit 1
fi
