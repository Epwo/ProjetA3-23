library(plotly)
library(dplyr)

#Nombre d’accidents par ville en France
#Sys.setenv('MAPBOX_TOKEN' = 'pk.eyJ1IjoicGhpbGlwcGluZWFuZ2JkIiwiYSI6ImNsaXV1cG9hdjFzOWwzZG54YmcyaTMwYXEifQ.GNGi4FnQmOPefaMgaGoGxQ')

data <- read.csv("Big Data/csvOutTrait.csv", sep = ",")

#transformation du dataframe
villes <- data %>%
  group_by(ville, latitude, longitude) %>%
  summarise(nombre_accidents = n())


# Carte
villes_mapbox <- villes %>%
  plot_mapbox(
    lat = ~latitude, lon = ~longitude,
    # Taille et couleur selon le nombre d'accidents
    size = ~nombre_accidents, color = ~nombre_accidents,
    # choix de la palette de couleur
    colors = RColorBrewer::brewer.pal(n = 9, name = "Blues"),
    # mode d'affichage
    mode = "markers",
    #ajout de texte sur chaque points pour voir les informations 
    text = ~paste("Ville :", ville, "<br>Nombre d'accidents :", nombre_accidents)
  ) %>%
  # Options d'affichage
  layout(
    title = "Accidents par villes en France en 2009",
    # Style du fond de carte 
    mapbox = list(
      style = "dark",
      zoom = 4,
      center = list(lat = ~ median(latitude), lon = ~ median(longitude))
    ),
    # légende
    legend = list(
      orientation = "h",
      font = list(size = 8)
    )
  )
#afficher la carte
#print(villes_mapbox)

histogramme <- function(dataframe, var1) {
    hist <- ggplot(dataframe, aes(x = .data[[var1]])) +
    geom_histogram(stat = "count", binwidth = 2, fill = "#11a311e3", color = "black") +
    labs(title = paste("Nombre d'accidents par tranche", var1), x = var1, y = "Nombre")+
    theme_minimal() +
    theme(
            axis.title.x = element_text(size = 25, face = "bold"),
            axis.title.y = element_text(size = 25, face = "bold"),
            panel.grid.major = element_line(colour = "dodgerblue", size = 0.5, linetype = "dotdash"), # nolint: line_length_linter.
            axis.text = element_text(size = 25, face = "bold"),
            axis.text.x = element_text(angle = 90),
            plot.title = element_text(colour = "red", face = "bold", size = 25, hjust = 0.5), # nolint: line_length_linter.
    )
    print(hist)
}
data <- read.csv("Big Data/csvOutput.csv", sep = ",")
sequence_age <- seq(0, 130, by = 10)
data$tranche_age <- cut(data$age, breaks = sequence_age)
histogramme(data, "tranche_age")