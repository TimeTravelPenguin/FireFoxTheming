#!/usr/bin/env sh

ff_profiles="$HOME/Library/Application Support/Firefox/Profiles"

dir=$(find "$ff_profiles" -maxdepth 1 -type d -name "*.default-release")

if [ -z "${dir}" ]; then
  echo "No default-release profile found"
  exit 1
fi

rsync -rtvp --include=*/ --include=*.css --exclude=* ./* "$dir/chrome"
