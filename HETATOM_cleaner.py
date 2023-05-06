#!/usr/bin/env python
"""infiles = ['./analysis/foldx_with_cofactors/AF-P12931-with-cofactors_Repair.pdb',
          './analysis/foldx_with_cofactors/AF-P12931-with-cofactors_Repair_1_0.pdb',
          './analysis/foldx_with_cofactors/AF-P12931-with-cofactors_Repair_2_0.pdb',
          './analysis/foldx_with_cofactors/AF-P12931-with-cofactors_Repair_3_0.pdb',
          './analysis/foldx_with_cofactors/AF-P12931-with-cofactors_Repair_4_0.pdb']
outfiles = ['./analysis/Saracatinib_Type2/AF-P12931-without-cofactors_Repair.pdb',
           './analysis/Saracatinib_Type2/AF-P12931-without-cofactors_Repair_1_0.pdb',
           './analysis/Saracatinib_Type2/AF-P12931-without-cofactors_Repair_2_0.pdb',
           './analysis/Saracatinib_Type2/AF-P12931-without-cofactors_Repair_3_0.pdb',
           './analysis/Saracatinib_Type2/AF-P12931-without-cofactors_Repair_4_0.pdb']
"""
infiles = ['7syd.pdb',
          '7si1.pdb']
outfiles = ['7syd_cleaned.pdb',
           '7si1_cleaned.pdb']
for i in range(len(infiles)):
    # Open the file in read mode
    with open(infiles[i], 'r') as file:
        # Read the file line by line
        lines = file.readlines()
        
    # Open the file in write mode
    with open(outfiles[i], 'w') as file:
        # Write only the lines that do not start with "HETATM "
        for line in lines:
            if not line.startswith('HETATM '):
                file.write(line)