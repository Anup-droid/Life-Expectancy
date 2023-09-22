# Required packages
library(ggplot2)
library(gganimate)
library(hrbrthemes)
library(tidyverse)
library(viridisLite)
library(viridis)
library(ggdark)

#Data Import
Life <- read_excel("C:/Users/Anup Kumar/Desktop/R-Code/Data_Visualization/Data/Life Expectancy/Life.xlsx")

# Plot
life_anim=Life %>%
  ggplot( aes(x=Year, y=Life, group=Country, color=Country)) +
  geom_line() +
  geom_point() +
  scale_color_viridis(discrete = TRUE) +
  labs(title = "Life Expectancy, 1950-2021 ",
       subtitle = "Top five most populated countries",
       caption = "Source: UN WPP (2022)") +
  theme_classic()+
  dark_theme_classic()+
  theme(panel.grid = element_blank())+
  ylab("Life Expectancy") +
  transition_reveal(Year)

animate(life_anim, fps=8)

anim_save("C:/Users/Anup Kumar/Desktop/R-Code/Data_Visualization/life.gif",life_anim)
