#install.packages("plotly")
library(plotly)
library(dplyr)
#install.packages("rnaturalearth")
library(rnaturalearth)

#Nombre d’accidents par ville en France

#transformation du dataframe
carte_accidents_par_ville <- function(){
  Sys.setenv('MAPBOX_TOKEN' = 'pk.eyJ1IjoicGhpbGlwcGluZWFuZ2JkIiwiYSI6ImNsaXV1cG9hdjFzOWwzZG54YmcyaTMwYXEifQ.GNGi4FnQmOPefaMgaGoGxQ')
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
  print(villes_mapbox)
}

carte_accidents_par_dep <- function(){
  france <- ne_states(country = "France", returnclass = "sf")
  }

data <- read.csv("Big Data/csvOutTrait.csv", sep = ",")
carte_accidents_par_dep()