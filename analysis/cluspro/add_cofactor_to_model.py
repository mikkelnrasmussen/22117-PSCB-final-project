import os
import sys
import argparse
from pymol import cmd

def add_cofactors(base_struct, model, protein = None):
    # Define the names of the CABSflex model files
    model_suffix = ".pdb"
    
    # Remove file extension from model name
    model_org_name = model.split("/")[1]
    print(f"Adding cofactors to {model_org_name}")
    model_number = model_org_name.split(".")[2]
    
    # Load the clusPro PDB complex
    cmd.load(model, "cluspro_model")
    loaded_objects = cmd.get_names()
    
    model_name = f"lig.000.{model_number}.pdb"
    if model_name in loaded_objects:
        cmd.alter(model_name, "chain='B'")
    else:
        print(f"{model_name} not found in PyMol objects")
        sys.exit()
        
    
    # Load structure with MG and ADP
    cmd.load(base_struct, "base_struct")

    # Align the structures
    if "rec.pdb" in loaded_objects: 
        cmd.align("rec.pdb", "base_struct")
    else:
        print(f"rec.pdb not found in PyMol objects")
        sys.exit()

    # Create a magnesium atom from the first structure
    cmd.select("mg_atom", "base_struct and resn MG and symbol MG")

    # Copy the magnesium atom to a new object
    cmd.create("mg_only", "mg_atom")

    # Select the ADP molecule from the first structure
    cmd.select("adp_molecule", "base_struct and resn ADP")

    # Create a new object for the ADP molecule
    cmd.create("adp_only", "adp_molecule")
    cmd.alter("adp_only", "chain='A'")
    
    # Delete base structure from pymol
    cmd.delete("base_struct")

    # Combine the second structure with the magnesium atom and the ADP molecule
    cmd.create("final_model", f"rec.pdb or {model_name} or mg_only or adp_only")
    
    # Define the name of the output file with the added Mg cofactor
    output_pdb = f"{protein}/SRC_{protein}_cl{model_number[-1]}" + model_suffix
    cmd.save(output_pdb, "final_model")

    print(f"Final model saved as {output_pdb}")
    
    #return None


# Define the base structure with the MG cofactor
#base_struct = "AF-P12931-with-cofactors.pdb"
#num_models = 10
#protein = "ESR1"

# Example of running the script from the command line
# python add_cofactor_to_model.py AF-P12931-with-cofactors.pdb 10 ESR1

# Create the argument parser
parser = argparse.ArgumentParser(description="Process command-line arguments.")

# Add the arguments
parser.add_argument("base_struct", 
                    type=str, 
                    help="Path to the base structure file.")
parser.add_argument("num_models", 
                    type=int, 
                    help="Number of models.")
parser.add_argument("protein", 
                    type=str, 
                    help="Name of the protein.")

# Parse the arguments
args = parser.parse_args()

# Access the values of the arguments
base_struct = args.base_struct
num_models = args.num_models
protein = args.protein
 
# Add cofactors to the 10 cabsflex models
for i in range(num_models):
    
    # Load two PDB structures
    model = f"{protein}/model.000.0{i}.pdb"
    
    # Add cofactors to the model
    add_cofactors(base_struct, model, protein = protein)