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

###now would split the years and redo both years' plots and combine them.. SLOW!



## Making a pipable correlation

Meat %>%
  mutate_at(vars(-Year), log10) %>%
  group_by(Year) %>%
  do(cor = cor(.[,1:4])) %>%
  broom::tidy(cor) %>%
  gather(.colnames, cor, -Year, -.rownames) %>%
  ggplot(aes(.rownames, .colnames, fill = cor)) +
  geom_tile(size = 0.1, colour = "black") +
  scale_fill_gradient(low = "purple", high = "blue", name = "Correlation") +
  facet_wrap(~Year) +
  labs(x = "Fatty Acid", y = "Fatty Acid") +
  theme(axis.title.y = element_text(size = rel(1.6), angle = 90)) +
  theme(axis.title.x = element_text(size = rel(1.6), angle = 00)) +
  theme(strip.text = element_text(size=20))  

#Tidying Data
Meat_tidy <- Meat %>% 

# Adding a unique identifier for each observation    
    mutate(ID = row_number(Year)) %>% 
  
#Gather Fatty acids into a single column
    gather(Fatty_Acid, val= Concentration, MOA, MNA, EOA, C17.0) %>%

#Make Year into character
    mutate(Year = as.character(Year))






