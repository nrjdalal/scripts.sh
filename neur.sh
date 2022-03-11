# Primary clean up
rm -rf ../neur-sam
rm -rf ../neur-sam-no-git

# Copy neur to neur-sam-no-git
cp -r $(pwd) ../neur-sam-no-git

# Remove .git from neur-sam-no-git
rm -rf ../neur-sam-no-git/.git

cd ..

# Cloning neur-sam and switching to it
git clone https://github.com/nrjdalal/neur-sam.git
cd ./neur-sam

# Doing mandatory cleanup
rm -rf *
rm -rf ./.vscode
rm -rf ./.prettierrc.json

# Moving files from neur-sam-no-git to neur-sam
mv ../neur-sam-no-git/* ../neur-sam
mv ../neur-sam-no-git/.* ../neur-sam

# Auto commit
git add .
git commit -m "neur-sam"
git push origin main

cd ..

# Secondary clean up
rm -rf ./neur-sam
rm -rf ./neur-sam-no-git
