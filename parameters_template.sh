#!/bin/bash
# Configuration file for your study.
# Copy this file and rename it as `parameters.sh`, then modify the variables
# according to your needs.

# Path to working directory, which contains data results, qc, etc. (do not add "/" at the end).
# This path should be absolute (i.e. should start with "/"). Example: PATH_DATA="/Users/bob/experiments"
export PATH_MAIN="/Users/francois/Documents/Neuropoly/results_csa"

# Path to the folder which contains all data
export PATH_DATA="/Users/francois/Documents/Neuropoly/marmoset_data"

# List of subjects to analyse. If you want to analyze all subjects in the
# PATH_DATA folder, then comment this variable.
export SUBJECTS=(
	#"Eva"
	"gretel"
	#"luisa"
	)

# tag used to identify WM files, it must be included in all and only in WM file names
export TAG_FILE_WM="nawm_seg"
# tag used to identify GM files, it must be included in all and only in GM file names
export TAG_FILE_GM="nagm_seg"


