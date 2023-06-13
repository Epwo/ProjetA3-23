library(plotly) 
library(ggplot2)

data <- read.csv("Big Data/csvOutput.csv", sep = ",")

map <- plot_geo(data, lat = ~latitude, lon = ~longitude)
map <- map %>% layout(title = "Carte interactive")
print(map)