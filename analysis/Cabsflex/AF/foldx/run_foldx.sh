#!/bin/bash

# Set the FoldX executable path. Replace /path/to/foldx with the correct path to the foldx binary
FOLDX_BIN=/home/ctools/foldx-5.2023/foldx

# Set the working directory to the current directory
WORK_DIR=/net/pupil1/home/projects/22117_proteins/projects/group14/CABSflex/AF/foldx

# Loop through each subdirectory
for dir in mut1 mut2 mut3 mut4 Shrek; do
  echo "Processing directory: ${dir}"

  # Move to the subdirectory
  cd "../${dir}/output_pdbs"

  rm pdb_files.tmp
  # Initialize an empty list of input PDB files
  touch pdb_files.tmp

  # Loop through model0.pdb to model10.pdb and add them to the pdb_files.tmp file
  for i in {0..9}; do
    echo "model_${i}.pdb" >> pdb_files.tmp
  done

  # Run FoldX Stability command
  $FOLDX_BIN --command=Stability --ionStrength=0.05 --pH=7 --vdwDesign=2 --pdbHydrogens=false --pdb-list=pdb_files.tmp --output-file="${dir}" --output-dir="${WORK_DIR}/${dir}_outs" > "${WORK_DIR}/${dir}_total_out"
  rm pdb_files.tmp

  echo "Finished processing directory: ${dir}"

  # Move back to the initial working directory
  cd "${WORK_DIR}"
done