# Load libraries
library(tidyverse)
library(here)

# Read the average ddG values for each mutation and plot them
df <- read.table(
    here("data/foldx/Average_high_confidence_AF-p12931_Repair.fxout"),
    skip = 8,
    sep = "\t",
    header = TRUE
    )
df %>% view()

# Read the csv file with the results from the mutational scan from mutateX
df2 <- read_csv(here("data/foldx/energies.csv"))
df2 %>% t() %>% view()
