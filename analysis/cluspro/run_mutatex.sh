#!/bin/bash

# Set the working directory to the current directory
WORK_DIR=/home/people/s193518/group14/clusPro

# Create list with individual mutations
touch poslist.txt
rm poslist.txt
touch poslist.txt
echo "RA208" >> poslist.txt
echo "RA391" >> poslist.txt
echo "AA421" >> poslist.txt
echo "EA527" >> poslist.txt

# Copy the repair runfile template and mutation list to the current folder on the server:
cp /home/projects/22117_proteins/lecture4_exercise/group0/mutatex_templates/mutatex/templates/foldxsuite5/repair_runfile_template.txt .
cp /home/projects/22117_proteins/lecture4_exercise/group0/mutatex_templates/mutatex/templates/foldxsuite5/mutate_runfile_template.txt .
cp /home/projects/22117_proteins/lecture4_exercise/group0/mutatex_templates/mutatex/templates/mutation_list.txt .

# Loop through each subdirectory
for dir in ESR1 FAK1 EGFR_crystal EGFR_cryo_EM; do
  echo "Processing directory: ${dir}"

  # Move to the subdirectory
  cd "${dir}"

  # Loop through cluster 1 and 2 poses
  for cluster in cl0 cl1; do
    current_pdb_file="SRC_${dir}_${cluster}"

    # Run mutateX using the list of mutations:
    mutatex ${current_pdb_file}.pdb -p 3 -m mutation_list.txt -x /home/ctools/foldx-5.2023/foldx -f suite5 -R repair_runfile_template.txt -M mutate_runfile_template.txt -q poslist.txt -c -L -l -v & 

    # Extract results from the mutateX output:
    /home/ctools/anaconda3_2021.11/bin/ddg2excel -p ${current_pdb_file}.pdb -l mutation_list.txt -q c.txt -d results/mutation_ddgs/final_averages/ -F csv
    
  done

  echo "Finished processing directory: ${dir}"

  # Move back to the initial working directory
  cd "${WORK_DIR}"
done
