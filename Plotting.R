#Plotting

#Plotting the tidy data
#Scatter plot 1
ggplot(Meat_tidy, aes(x = Fatty_Acid, y = Concentration, colour = Year)) +
  geom_point(size = 3, alpha = 0.2) +
  scale_y_log10() +
  labs(x = "Fatty Acid", y = "Concentration") +
  theme(axis.title.y = element_text(size = rel(1.6), angle = 90)) +
  theme(axis.title.x = element_text(size = rel(1.6), angle = 00))

#Scatter plot 2
ggplot(Meat_tidy, aes(x = Fatty_Acid, y = Concentration, shape = Year)) +
  geom_point(size = 3, alpha = 0.2) +
  scale_y_log10() +
  labs(x = "Fatty Acid", y = "Concentration") +
  theme(axis.title.y = element_text(size = rel(1.6), angle = 90)) +
  theme(axis.title.x = element_text(size = rel(1.6), angle = 00))

#Box Plot 1
ggplot(Meat_tidy, aes(x = Fatty_Acid, y = Concentration)) +
  geom_boxplot() +
  scale_y_log10() +
  facet_wrap(~Year) +
  labs(x = "Fatty Acid", y = "Concentration") +
  theme(axis.title.y = element_text(size = rel(1.6), angle = 90)) +
  theme(axis.title.x = element_text(size = rel(1.6), angle = 00))

#Box Plot 2
ggplot(Meat_tidy, aes(x = Fatty_Acid, y = Concentration, colour = Year)) +
  geom_boxplot() +
  scale_y_log10() +
  labs(x = "Fatty Acid", y = "Concentration") +
  theme(axis.title.y = element_text(size = rel(1.6), angle = 90)) +
  theme(axis.title.x = element_text(size = rel(1.6), angle = 00))

#Trying to plot individual Fatty acids..
ggplot(filter(Meat_tidy, Fatty_Acid == "MOA"), aes(Fatty_Acid, y = Concentration, colour = Year)) +
  geom_point() +
  scale_y_log10()

#Plotting the untidy data because I want to plot the Fatty acids against each other

ggplot(Meat, aes(x = MOA, y = MNA, colour = Year)) +
  geom_point(size = 3, alpha = 0.2) +
  scale_y_log10() 

ggplot(Meat, aes(x = MOA, y = EOA, colour = Year)) +
  geom_point(size = 3, alpha = 0.2) +
  scale_y_log10()

ggplot(Meat, aes(x = MOA, y = C17.0, colour = Year)) +
  geom_point(size = 3, alpha = 0.2) +
  scale_y_log10()

ggplot(Meat, aes(x = MNA, y = C17.0, colour = Year)) +
  geom_point(size = 3, alpha = 0.2) +
  scale_y_log10()

#Correlation plots from original untidy data

#Correlation plot 1
ggplot(melted_FA_cormat, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile()


#Correlation plot 2
##this contains both years' data so I would actually like to separating it
#by faceting. Cannot do this because have lost the years when made the
#correlation plot.
ggplot(data = melted_FA_cormat, aes(Var2, Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme_minimal()+ 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1))+
  coord_fixed()



