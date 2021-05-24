# updating a specfic line with desired content
sed -i '' "${lineNumber}s/.*/Version=\"$(date -u +'%y%m%d-%H%M%S')\"/" ${directory}
