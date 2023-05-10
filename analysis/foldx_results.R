# Load libraries
library(tidyverse)
library(here)

read_file_to_dataframe <- function(file_number) {
    file_name <- paste0(
        "analysis/Cabsflex/AF/Shrek/output_pdbs/Average_model_",
        file_number,
        "_with_cofactors_Repair.fxout"
    )
    data <- read.table(
        here(file_name),
        skip = 8,
        sep = "\t",
        header = TRUE
    )
    return(data)
}

data_list <- lapply(0:9, read_file_to_dataframe)
combined_data <- do.call(rbind, data_list)
combined_data %>% view()
# Save the combined data to a csv file
write.csv(
    combined_data,
    here("analysis/Cabsflex/AF/Shrek/output_pdbs/combined_foldx_results.csv")
    )


read_file_to_dataframe_v2 <- function(dir) {
    file_name <- paste0(
        "analysis/cluspro/",
        dir,
        "/Average_SRC_",
        dir,
        "_cl0_Repair.fxout"
    )
    data <- read.table(
        here(file_name),
        skip = 8,
        sep = "\t",
        header = TRUE
    )
    return(data)
}

data_list <- lapply(
    c("ESR1", "FAK1", "EGFR_crystal", "EGFR_cryo_EM"),
    read_file_to_dataframe_v2
)
combined_data <- do.call(rbind, data_list)
write_excel_csv(
    combined_data, 
    here("analysis/cluspro/combined_cluspro_foldx_results.xlsx")
)


