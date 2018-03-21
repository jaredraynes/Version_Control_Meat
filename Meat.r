#Import Libraries
library(tidyverse)
library(reshape2)
#Read in Data
Meat <- read_csv("Data/bcfa_C17_fa.csv") %>% 
  mutate(Year = as.character(Year)) 

##MAKING CORRELATION 

FA <- select(Meat, 1:4)
  
FA_cormat <- round(cor(FA),2)
head(FA_cormat)

melted_FA_cormat <- melt(FA_cormat)
head(melted_FA_cormat)

# Get lower triangle of the correlation matrix
get_lower_tri<-function(FA_cormat){
  FA_cormat[upper.tri(FA_cormat)] <- NA
  return(FA_cormat)}

# Get upper triangle of the correlation matrix
get_upper_tri <- function(FA_cormat){
  FA_cormat[lower.tri(FA_cormat)]<- NA
  return(FA_cormat)}

upper_tri <- get_upper_tri(FA_cormat)
upper_tri

# Melt the correlation matrix

melted_FA_cormat <- melt(upper_tri, na.rm = TRUE)



#Tidying Data
Meat_tidy <- Meat %>% 

# Adding a unique identifier for each observation    
    mutate(ID = row_number(Year)) %>% 
  
#Gather Fatty acids into a single column
    gather(Fatty_Acid, val= Concentration, MOA, MNA, EOA, C17.0) %>%

#Make Year into character
    mutate(Year = as.character(Year))






