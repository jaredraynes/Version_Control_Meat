#Import Libraries
library(tidyverse)

#Read in Data
Meat <- read_csv("Data/bcfa_C17_fa.csv")

#Tidying Data
Meat_tidy <- Meat %>% 

# Adding a unique identifier for each observation    
    mutate(ID = row_number(Year)) %>% 
  
#Gather Fatty acids into a single column
    gather(Fatty_Acid, val= Concentration, MOA, MNA, EOA, C17.0) %>%

#Make Year into character
    mutate(Year = as.character(Year))






