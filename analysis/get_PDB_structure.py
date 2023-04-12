# This script should be run from the root directory of the project

# Import libraries
from Bio import ExPASy
from Bio import SwissProt
from pypdb import describe_pdb
import pandas as pd

# Define the function
def get_structure_info(name, save = True, path = "", save_as = "csv"):
    """This function searches for PDB structures for a given 
    protein or gene name on UniPort/Swiss-Prot. The function 
    extracts the PDB ID, the resolution, the method, chains, and 
    structure length. Associated metrics for the PDB structure are 
    extracted which includes the R-values (free, work, observed) if 
    present RCSB. The function returns a pandas dataframe with the 
    extracted information and saves it as a csv file.
    
    Parameters
    ----------
    name : str
        The name of the protein/gene of interest
    save : bool
        If True, the function saves the extracted information as a csv file
    path : str
        The path to the directory where the csv file should be saved
    save_as : str
        The file format in which the extracted information should be saved
        
    Returns
    df : pandas dataframe
        A pandas dataframe with the extracted information
    """
    
    # Get the UniProt ID for the protein
    handle = ExPASy.get_sprot_raw(name)
    record = SwissProt.read(handle)
    uniprot_id = record.accessions[0]
    pdb_ids = record.cross_references
    print("For the provided protein/gene name: ", name, ", the UniProt ID is: " + uniprot_id)
    
    # Get the PDB IDs, the resolution, the method, 
    # chains and structure length
    pdb_ID = []
    resolution = []
    method = []
    chains = []
    structure_len = []
    
    for id in pdb_ids:
        if id[0] == "PDB":
            pdb_ID.append(id[1])
            method.append(id[2])
            resolution.append(id[3])
            chain_info = id[4].split("=")
            chains.append(chain_info[0])
            structure_len.append(chain_info[1])
    
    # Collect information in dataframe
    df = pd.DataFrame({"PDB ID": pdb_ID, 
                       "Resolution": resolution,
                       "Method": method,
                       "Chains": chains,
                       "Structure Length": structure_len})
    
    for id in pdb_ID:
        # Extract PDB information for the given PDB ID
        pdb_id = id.lower()
        pdb_info = describe_pdb(pdb_id)
        
        if 'refine' in pdb_info:
            # Extract the R-values if they are present else add NaN
            if 'ls_rfactor_rfree' in pdb_info['refine'][0]:
                r_free = pdb_info['refine'][0]['ls_rfactor_rfree']
            else:
                r_free = float('NaN')
            if 'ls_rfactor_rwork' in pdb_info['refine'][0]:
                r_work = pdb_info['refine'][0]['ls_rfactor_rwork']
            else:
                r_work = float('NaN')
            if 'ls_rfactor_obs' in pdb_info['refine'][0]:
                r_observed = pdb_info['refine'][0]['ls_rfactor_obs']
            else:
                r_observed = float('NaN')
        else:
            r_free = float('NaN')
            r_work = float('NaN')
            r_observed = float('NaN')
        
        # Add the R-values to the dataframe
        df.loc[df['PDB ID'] == id, 'R-free'] = r_free
        df.loc[df['PDB ID'] == id, 'R-work'] = r_work
        df.loc[df['PDB ID'] == id, 'R-observed'] = r_observed
        
    # Save the results in a csv or excel file
    if save:
        if save_as == "csv":
            file_name = path + "PDB_structure_info.csv"
            df.to_csv(file_name, index = False)
        elif save_as == "excel":
            file_name = path + "PDB_structure_info.xlsx"
            df.to_excel(file_name, index = False)
        else:
            print("The file format is not supported. Please choose between csv and excel.")
        
    return df


# Call the function and save the results
result = get_structure_info("SRC_HUMAN", 
                            save = True,
                            path = "data/",
                            save_as = "excel")

