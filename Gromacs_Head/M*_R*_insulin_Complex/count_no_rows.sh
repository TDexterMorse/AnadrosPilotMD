#!/bin/bash

# Check if the user provided the filename as an argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 filename.gro"
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "File not found: $1"
  exit 1
fi

count=0
while IFS= read -r line; do
  if [[ "$line" == *" N "* || "$line" == *" O "* ]]; then
    ((count++))
  fi
done < "$1"


echo "Number of rows with N or O in the second column: $count"
