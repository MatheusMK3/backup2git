#!/bin/bash

# Setup stuff
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $script_dir
shopt -s extglob

# Configs, the remote Git repo and the temp directory
remote_git=''
working_dir='temp'

# Prepares or initializes the Git repo
echo "+---------------------------------+"
echo "| Preparing working repo...       |"
echo "+---------------------------------+"
git clone $remote_git $working_dir
mkdir -p $working_dir
cd $working_dir
git init
git remote add origin $remote_git

# Removes all current backup files
rm -rf !('.git')

# Handles the list of files and categories
while IFS=: read -r category file
do
  echo "Processing '$file' => '$category'"
  mkdir -p $category
  cp -r $file $category
done < '../backup.txt'

# Saves to Git
echo "+---------------------------------+"
echo "| Saving to Git...                |"
echo "+---------------------------------+"
date=`date`
git add .
git commit -m "Latest Version: $date"
git push -u origin master

# Cleanup
echo "+---------------------------------+"
echo "| Cleaning up...                  |"
echo "+---------------------------------+"
cd ..
rm -rf $working_dir