# updating a specfic line with desired content, e.g. Version="datetime-stamp"
sed -i '' "${lineNumber}s/.*/Version=\"$(date -u +'%y%m%d-%H%M%S')\"/" ${directory}

# getting dirs excluding 3 latest
ls -1 | grep -v "$(ls -1 | tail -n 3)"
