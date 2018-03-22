library(tidyverse)

legume <- read_csv("Data/legume_weights_rhizobia_20str.csv") %>% 
mutate(Strain = as.character(Strain)) 


 
