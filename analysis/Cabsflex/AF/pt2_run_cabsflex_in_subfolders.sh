!/bin/bash

# Loop over all subdirectories in the current directory
for dir in */; do
    # Check if a PDB file exists in the directory
    pdb_file=$(find "$dir" -maxdepth 1 -type f -name '*.pdb')
    if [ -n "$pdb_file" ]; then
        # If a PDB file exists, change to the directory and execute the command
        echo "Running command in directory: $dir"
        cd "$dir"
        CMD="nohup CABSflex -i high_confidence_AF*.pdb -k 10 -y 30 -a 10 -v 3 -z 10 -A --sc-rest-add 394:A 407:A 3.8 1.0 --sc-rest-add 298:A 407:A 2.7 1.0 --sc-rest-add 298:A 394:A 6.2 1.0 --sc-rest-add 394:A 396:A 5.6 1.0 --sc-rest-add 396:A 344:A 3.9 1.0 --sc-rest-add 344:A 342:A 4.3 1.0 --sc-rest-add 342:A 296:A 3.7 1.0 --sc-rest-add 296:A 276:A 4.8 1.0 --sc-rest-add 276:A 284:A 5.9 1.0 --sc-rest-add 284:A 298:A 5.7 1.0 --sc-rest-add 394:A 391:A 3.8 1.0 >& log1 &"
        echo "$CMD"
        eval "$CMD"
        cd ..
    fi
done


