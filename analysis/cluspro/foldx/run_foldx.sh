#!/bin/bash

# Set the FoldX executable path. Replace /path/to/foldx with the correct path to the foldx binary
FOLDX_BIN=/home/ctools/foldx-5.2023/foldx

# Set the working directory to the current directory
WORK_DIR=/net/pupil1/home/projects/22117_proteins/projects/group14/clusPro/foldx

# Create list with individual mutations
touch individual_list.txt
rm individual_list.txt
touch individual_list.txt
echo "RA208H;" >> individual_list.txt
echo "RA391C;" >> individual_list.txt
echo "AA421V;" >> individual_list.txt
echo "EA527K;" >> individual_list.txt

# Loop through each subdirectory
for dir in ESR1 FAK1 EGFR_crystal EGFR_cryo_EM; do
  echo "Processing directory: ${dir}"

  # Move to the subdirectory
  cd "../${dir}"

  # Loop through cluster 1 and 2 poses
  for cluster in cl0 cl1; do
    current_pdb_file = "SRC_${dir}_${cluster}"
    # Run FoldX in repair mode:
    $FOLDX_BIN --command=RepairPDB --pdb="${current_pdb_file}.pdb" --ionStrength=0.05 --pH=7 --vdwDesign=2 --out-pdb=1 --pdbHydrogens=false > "foldx_${cluster}.log" 
    # Run FoldX in build mode to introduce mutations:
    $FOLDX_BIN --command=BuildModel --pdb="${current_pdb_file}_Repair.pdb" --mutant-file="${WORK_DIR}/individual_list.txt" --ionStrength=0.05 --pH=7 --vdwDesign=2 --out-pdb=1 --pdbHydrogens=false --numberOfRuns=5

  done

  echo "Finished processing directory: ${dir}"

  # Move back to the initial working directory
  cd "${WORK_DIR}"
done