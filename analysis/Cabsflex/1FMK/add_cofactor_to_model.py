import os
from pymol import cmd

def add_cofactors(base_struct, model):
    # Define the names of the CABSflex model files
    model_suffix = ".pdb"
    
    # Remove file extension from model name
    model_prefix = os.path.splitext(model)[0]
    print(f"Adding cofactors to {model_prefix}")
    
    # Load two PDB structures, where one contains a MG cofactor
    cmd.load(base_struct, "base_struct")
    cmd.load(model, "cabsflex_model")

    # Align the structures
    cmd.align("cabsflex_model", "base_struct")

    # Create a magnesium atom from the first structure
    cmd.select("mg_atom", "base_struct and resn MG and symbol MG")

    # Copy the magnesium atom to a new object
    cmd.create("mg_only", "mg_atom")

    # Select the ADP molecule from the first structure
    cmd.select("adp_molecule", "base_struct and resn ADP")

    # Create a new object for the ADP molecule
    cmd.create("adp_only", "adp_molecule")

    # Combine the second structure with the magnesium atom and the ADP molecule
    cmd.create("final_model", "cabsflex_model or mg_only or adp_only")
    
    # Define the name of the output file with the added Mg cofactor
    output_pdb = f"{model_prefix}_with_MG{model_suffix}"
    cmd.save(output_pdb, "final_model")

    print(f"Final model saved as {output_pdb}")
    
    return None


# Define the base structure with the MG cofactor
base_struct = "AF-P12931-with-cofactors_Repair.pdb"
num_models = 10
 
# Add cofactors to the 10 cabsflex models
for i in range(num_models):
    # Load two PDB structures
    model = f"model_{i}.pdb"
    
    # Add cofactors to the model
    add_cofactors(base_struct, model)