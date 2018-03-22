ggplot(legume, aes(x = Plant, y = weight, colour = Strain)) +
  geom_point() +
  facet_wrap(~Block)

ggplot(legume, aes(x = Strain, y = weight, colour = Plant)) +
  geom_point() +
  facet_wrap(~Block)

ggplot(legume, aes(x = Strain, y = weight, colour = Plant)) +
  geom_point()

ggplot(legume, aes(x = Strain, y = weight)) +
  geom_point() +
  #scale_y_log10() +
  facet_wrap(~Plant)

ggplot(legume, aes(x = Strain, y = weight, colour = Strain)) +
  geom_boxplot(show.legend=F) +
  #scale_y_log10() +
  facet_wrap(~Plant) +
  theme(axis.text.x = element_text(angle = 90)) +
  theme(axis.title.y = element_text(size = rel(1.6), angle = 90)) +
  theme(axis.title.x = element_text(size = rel(1.6), angle = 00)) +
  theme(strip.text = element_text(size=20))