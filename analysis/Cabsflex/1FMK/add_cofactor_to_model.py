import os
from pymol import cmd

# Load two PDB structures
base_struct = "AF-P12931-with-cofactor_Repair.pdb"
model = "model_1.pdb"
cmd.load(base_struct, "base_struct")
cmd.load(model, "model")

# Align the structures
cmd.align("model", "base_struct")

# Create a magnesium atom from the first structure
cmd.select("mg_atom", "base_struct and resn MG and symbol MG")

# Copy the magnesium atom to a new object
cmd.create("mg_only", "mg_atom")

# Combine the second structure with the magnesium atom
cmd.create("final_model", "model or mg_only")

# Save the final model as a PDB file
output_pdb = "final_model.pdb"
cmd.save(output_pdb, "final_model")

print(f"Final model saved as {output_pdb}")
