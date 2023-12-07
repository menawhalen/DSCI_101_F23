## final review notes

library(tidyverse)
library(taylor)

data("taylor_all_songs")

ggplot(taylor_all_songs, aes(album_name, danceability)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
  
data("taylor_albums")

p <- taylor_albums %>% 
  mutate(user_score = user_score*10) %>% 
  pivot_longer(cols = metacritic_score:user_score, names_to = "type", values_to = "score") %>% 
  ggplot(aes(album_release, score, color = type, text = album_name)) +
  geom_line() +
  geom_point()
plotly::ggplotly(p)


taylor_albums %>% 
  mutate(user_score = user_score*10) %>% 
  pivot_longer(cols = metacritic_score:user_score, names_to = "type", values_to = "score") %>% 
  ggplot(aes(type, score)) +
  geom_boxplot()
