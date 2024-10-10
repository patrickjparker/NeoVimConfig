#!/bin/bash

lock_file="lazy-lock.json"

git diff --quiet "$lock_file"
if [ $? -eq 1 ]; then # there are changes
  msg="Saving plugin updates"
  git commit -m "$msg" --author="Automatic Parker <robot@parker.me>" -- "$lock_file"
  exit 0
else
  exit 1
fi
