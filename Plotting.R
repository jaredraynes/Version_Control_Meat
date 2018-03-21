#Plotting
ggplot(Meat, aes(x = Fatty_Acid, y = Concentration, colour = Year)) +
  geom_point() +
  scale_y_log10()
facet_wrap(~Fatty_Acid)

