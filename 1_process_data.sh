#!/bin/bash
#
# Process data
#
# Author: Francois Paugam

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
    for im in $( ls ); do
      # if wm segmentation identified
      if [[ $im == *"$TAG_FILE_GM"* ]]; then
        printf "${Green}${On_Black} Processing GM file : $folder$subfolder$im"
        sct_process_segmentation -i $im -p csa -ofolder $PATH_MAIN -z 0:100
      elif [[ $im == *"$TAG_FILE_WM"* ]]; then
        printf "${Green}${On_Black}Processing WM file : $folder$subfolder$im"
        sct_process_segmentation -i $im -p csa -ofolder $PATH_MAIN -z 0:100
      fi
    done
    cd ..
  done
  cd ..
done

source sct_launcher
python $PATH_SCRIPTS/make_output_files.py "$PATH_MAIN/csa_mean.xls"
rm "$PATH_MAIN/angle_image.nii.gz" "$PATH_MAIN/angle_mean.pickle" "$PATH_MAIN/angle_mean.txt" "$PATH_MAIN/angle_mean.xls" "$PATH_MAIN/csa_image.nii.gz" "$PATH_MAIN/csa_mean.pickle" "$PATH_MAIN/csa_mean.txt" "$PATH_MAIN/csa_mean.xls" "$PATH_MAIN/csa_per_slice.pickle" "$PATH_MAIN/csa_per_slice.txt"