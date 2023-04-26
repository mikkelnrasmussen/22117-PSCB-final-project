# Visualize the mutations that are conserved across all the tissues

# Load libraries
library(tidyverse)
library(ggplot2)
library(gt)

# Load the data
df <- read_csv("data/SRC_missense_mutations.csv")
colnames(df) <- str_replace_all(colnames(df), " ", "_")

# Visualize the mutations that are conserved across all the tissues
ggplot(df, aes(x = Primary_Tissue, y = AA_Mutation)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(
    x = "Tissue", 
    y = "Mutation", 
    title = "Mutations that are conserved across all the tissues"
    )
ggsave("plots/conserved_mutations.png", width = 7, height = 25)

# Count the number of times a mutation occurs in different unique tissues
mutation_unique_tissues <- df %>% 
    group_by(AA_Mutation) %>%
    summarise(unique =  n_distinct(Primary_Tissue)) %>%
    filter(unique > 1) %>%
    arrange(desc(unique))

mutation_unique_tissues %>% 
    DT::datatable()


df %>% 
    group_by(AA_Mutation) %>%
    summarise(num = ) %>%
    filter(num > 1) %>%
    arrange(desc(num)) %>%
    DT::datatable()

# Select the top 


df %>%
    group_by(AA_Mutation, Histology) %>%
    summarise(unique =  n()) %>%
    filter(unique > 1) %>%
    arrange(desc(unique)) %>%
    DT::datatable()

# Find the tissues the mutation is conserved in
df %>% 
    filter(AA_Mutation == "p.E527K") %>% 
    DT::datatable()
