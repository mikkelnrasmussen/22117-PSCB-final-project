#!/bin/bash

# Set the FoldX executable path. Replace /path/to/foldx with the correct path to the foldx binary
FOLDX_BIN=/home/ctools/foldx-5.2023/foldx

# Set the working directory to the current directory
WORK_DIR=/net/pupil1/home/projects/22117_proteins/projects/group14/CABSflex/AF/foldx

touch mutation_list.txt
rm mutation_list.txt
touch mutation_list.txt

echo "RA208H;" >> mutation_list.txt
echo "RA391C;" >> mutation_list.txt
echo "AA421V;" >> mutation_list.txt
echo "EA527K;" >> mutation_list.txt

# Move to the subdirectory
cd "../Shrek/output_pdbs"

# Loop through model0.pdb to model10.pdb and add them to the pdb_files.tmp file
for i in {0..9}; do
    $FOLDX_BIN --command=RepairPDB --ionStrength=0.05 --pH=7 --vdwDesign=2 --pdbHydrogens=false --pdb="model_${i}.pdb" --output-dir="${WORK_DIR}/outs" > "${WORK_DIR}/model_${i}_Repair_out"
    $FOLDX_BIN --command=BuildModel --pdb="${WORK_DIR}/outs/model_${i}_Repair.pdb" --mutant-file="${WORK_DIR}/mutation_list.txt" --ionStrength=0.05 --pH=7 --vdwDesign=2 --out-pdb=1 --pdbHydrogens=false --numberOfRuns=5
done

# Run FoldX Stability command
rm pdb_files.tmp

# Move back to the initial working directory
cd "${WORK_DIR}"