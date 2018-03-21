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



