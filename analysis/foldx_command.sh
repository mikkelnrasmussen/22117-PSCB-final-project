# !/bin/bash

# For reference the commands use to run Foldx on the high confidence part of the AF P12931 model

# First we need to copy the high confidence part of the AF P12931 model to the health tech server
# Should be run on local machine
# Copy high confidence part of the AF P12931 model to the health tech server
# scp high_confidence_AF-p12931.pdb s193518@pupil3.healthtech.dtu.dk:/home/projects/22117_proteins/projects/group14/foldx/

# Running NACCESS on the AF P12931 model
/home/ctools/naccess-2.1.1/naccess high_confidence_AF-p12931.pdb

# Run FoldX in repair mode:
/home/ctools/foldx-5.2023/foldx --command=RepairPDB --pdb=high_confidence_AF-p12931.pdb --ionStrength=0.05 --pH=7 --vdwDesign=2 --out-pdb=1 --pdbHydrogens=false  | tee foldx.log

# Create individual list with mutations
#cat >  individual_list.txt
#RA208H;
#RA391C;
#AA421V;
#EA527K;
# Ctrl + C

# Run FoldX in build model mode on the repaired model and introduce mutations:
/home/ctools/foldx-5.2023/foldx --command=BuildModel --pdb=high_confidence_AF-p12931_Repair.pdb --mutant-file=individual_list.txt --ionStrength=0.05 --pH=7 --vdwDesign=2 --out-pdb=1 --pdbHydrogens=false --numberOfRuns=5

# Copy the repair runfile template and mutation list to the current folder on the server:
cp /home/projects/22117_proteins/lecture4_exercise/group0/mutatex_templates/mutatex/templates/foldxsuite5/repair_runfile_template.txt .
cp /home/projects/22117_proteins/lecture4_exercise/group0/mutatex_templates/mutatex/templates/foldxsuite5/mutate_runfile_template.txt .
cp /home/projects/22117_proteins/lecture4_exercise/group0/mutatex_templates/mutatex/templates/mutation_list.txt .

# Run mutateX using the list of mutations:
nohup mutatex high_confidence_AF-p12931.pdb -p 3 -m mutation_list.txt -x /home/ctools/foldx-5.2023/foldx -f suite5 -R repair_runfile_template.txt -M mutate_runfile_template.txt -q poslist.txt -c -L -l -v & 

# Extract results from the mutateX output:
/home/ctools/anaconda3_2021.11/bin/ddg2excel -p high_confidence_AF-p12931.pdb -l mutation_list.txt -q poslist.txt -d results/mutation_ddgs/final_averages/ -F csv