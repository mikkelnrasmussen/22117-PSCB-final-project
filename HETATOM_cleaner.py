#!/usr/bin/env python

# Open the file in read mode
with open('1fmk.pdb', 'r') as file:
    # Read the file line by line
    lines = file.readlines()
    
# Open the file in write mode
with open('1fmk_cleaned.pdb', 'w') as file:
    # Write only the lines that do not start with "HETATM "
    for line in lines:
        if not line.startswith('HETATM '):
            file.write(line)