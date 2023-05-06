!/bin/bash

# Loop over all subdirectories in the current directory
for dir in */; do
    # Check if a PDB file exists in the directory
    pdb_file=$(find "$dir" -maxdepth 1 -type f -name '*.pdb')
    if [ -n "$pdb_file" ]; then
        # If a PDB file exists, change to the directory and execute the command
        echo "Running command in directory: $dir"
        cd "$dir"
        CMD="nohup CABSflex -i high_confidence_AF*.pdb -k 10 -y 30 -a 10 -v 3 -z 10 -A --sc-rest-add 394:A 394:A 4.9 1.0 --sc-rest-add 407:A 407:A 4.9 1.0 >& log1 &"
        echo "$CMD"
        eval "$CMD"
        cd ..
    fi
done

