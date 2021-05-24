# updating a specfic line with desired content, e.g. Version="datetime-stamp"
sed -i '' "${lineNumber}s/.*/Version=\"$(date -u +'%y%m%d-%H%M%S')\"/" ${directory}
