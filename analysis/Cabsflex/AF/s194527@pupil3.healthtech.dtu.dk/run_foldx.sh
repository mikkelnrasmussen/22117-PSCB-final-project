#!/bin/bash

# Set the FoldX executable path. Replace /path/to/foldx with the correct path to the foldx binary
FOLDX_BIN=/home/ctools/foldx-5.2023/foldx

# Set the working directory to the current directory
WORK_DIR=$(pwd)

# Loop through each subdirectory
for dir in mut1 mut2 mut3 mut4 Shrek; do
  echo "Processing directory: ${dir}"
  
  # Move to the subdirectory
  cd "../${dir}"
  
  # Initialize an empty list of input PDB files
  pdb_files=""

  # Loop through model0.pdb to model10.pdb and add them to the pdb_files list
  for i in {0..10}; do
    pdb_files+="output_pdbs/model${i}.pdb"
    
    # Add a comma separator, except for the last file in the list
    if [ $i -ne 10 ]; then
      pdb_files+=","
    fi
  done
  
  # Run FoldX Stability command
  $FOLDX_BIN --command=Stability --pdb-list=${pdb_files} --output-dir="${WORK_DIR}"
  
  echo "Finished processing directory: ${dir}"
done

# Move back to the initial working directory
cd "${WORK_DIR}"
