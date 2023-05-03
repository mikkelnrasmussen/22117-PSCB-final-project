#!/bin/bash

# Define the name of the original structure file with the Mg cofactor
base_struct="AF-P12931-with-cofactors_Repair.pdb"

# Define the names of the CABSflex model files
model_prefix="model"
model_suffix=".pdb"
num_models=9

# Loop over all CABSflex model files
for ((i=0; i<=num_models; i++)); do
    # Define the name of the current model file
    model_file="${model_prefix}${i}${model_suffix}"

    # Define the name of the output file with the added Mg cofactor
    output_file="${model_prefix}${i}_with_MG${model_suffix}"

    # Align the current model to the original structure with the Mg cofactor
    pymol -c-q <<EOF
        load $base_struct, base_struct
        load $model_file, model
        align model, base_struct
        save $model_file, model
EOF

    # Add the Mg cofactor to the aligned model
    pymol -c-q <<EOF
        load $base_struct, base
        load $model_file, model
        create mg, base and resname MG
        create final_model, model or mg
        save $output_file, final_model
EOF
done
