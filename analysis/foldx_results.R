# Load libraries
library(tidyverse)
library(here)

# Read the average ddG values for each mutation and plot them
df <- read.table(
    here("analysis/foldx_with_cofactors/Average_AF-p12931-with-cofactors_Repair.fxout"),
    skip = 8,
    sep = "\t",
    header = TRUE
    )
df %>% view()

# Read the csv file with the results from the mutational scan from mutateX
df2 <- read_csv(here("data/foldx/energies.csv"))
df2 %>% t() %>% view()
