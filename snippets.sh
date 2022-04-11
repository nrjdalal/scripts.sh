# updating a specfic line with desired content, e.g. Version="datetime-stamp"
sed -i '' "${lineNumber}s/.*/Version=\"$(date -u +'%y%m%d-%H%M%S')\"/" ${directory}

# getting dirs excluding 3 latest
ls -1 | grep -v "$(ls -1 | tail -n 3)"

# remove all to custom bin
rmx() {
  local content=$(ls -A1 | wc -l | xargs)
  local visible=$(ls -1 | wc -l | xargs)
  local hidden=$((content - visible))
  local time=~/.deleted/$(date +%Y-%m-%d)/$(date +%s)
  if ((content > 0)); then
    command mkdir -p $time
    if ((hidden > 0)); then
      command mv .* $time
    fi
    if ((visible > 0)); then
      command mv * $time
    fi
  fi
}
