#!/bin/bash
#
# Process data
#
# Author: Julien Cohen-Adad

# Build color coding (cosmetic stuff)
Color_Off='\033[0m'
Green='\033[0;92m'
Red='\033[0;91m'
On_Black='\033[40m'

# fetch list of folders
list_folders=`ls -d */`

for folder in ${list_folders[@]}; do
  # go in folder
  cd $folder
  # get sub-folder
  list_subfolders=`ls -d */`
  # loop across sub-folder
  for subfolder in ${list_subfolders[@]}; do
    cd $subfolder
    # check if exist
    if [ -f "$FILE_WM" ]; then
      echo HAPPY
      sct_process_segmentation -i $FILE_WM -p csa -ofolder $PATH_MAIN -z 0:100
    else
      echo SAD
    fi
    cd ..
  done
  cd ..
done
