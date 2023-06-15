library(plotly)
library(dplyr)
library(ggplot2)
library(mapview)
library(leaflet)
library(geojsonio)
# declaration du token

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


#lecture des fichiers geojson contenant les limites des départements et des régions
limite_dep <- geojson_read("Big Data/departements.geojson",  what = "sp")
limite_region <- geojson_read("Big Data/regions.geojson",  what = "sp")   

#lecture du df des accidents de 2009
data <- read.csv("Big Data/csvOutput.csv", sep =',')

#création d'un df contenant le nombre d'accidents par region
df_accident_region <- data %>%
  group_by(region) %>% #groupe les lignes de data par région
  summarise(nombre_accidents = n()) #somme les lignes pour obtenir le nombre d'accidents

#création d'un df contenant le nombre d'accidents par departement
df_accident_departement <- data %>%
  group_by(departement) %>% #groupe les lignes de data par département
  summarise(nombre_accidents = n()) #somme les lignes pour obtenir le nombre d'accidents

# Creation de la palette sur le nombres d'accidents
pal_region <- colorBin(
  palette = "inferno", #choix de la palette de couleur
  domain = df_accident_departement$nombre_accidents, #Couleur en fonction du nombre d'accidents
)
pal_departement <- colorBin(
  palette = "inferno",
  domain = df_accident_departement$nombre_accidents,
  reverse = TRUE
)

#creation de labels pour les cartes
labels_nb_accident_region <- sprintf(
  "<strong>%s</strong> %s </br> %g accidents",
limite_region$nom, limite_region$code, df_accident_region$nombre_accidents
)%>% lapply(htmltools :: HTML)
labels_nb_accident_departement <- sprintf(
  "<strong>%s</strong> %s </br> %g accidents",
limite_dep$nom, limite_dep$code, df_accident_departement$nombre_accidents
)%>% lapply(htmltools :: HTML)


map_dep <- leaflet() %>%
addProviderTiles("Esri.OceanBasemap") %>%
addPolygons(
  data = limite_dep, 
  label = labels_nb_accident_reg,
  popup = ~paste("Nombre d'accident par département"), 
  fill = TRUE, 
  # Application de la fonction palette
  fillColor = ~pal(df_accident_departement$nombre_accidents),
  fillOpacity = 0.8,
  highlightOptions = highlightOptions(color = "white", weight = 2)) %>%
   addLegend(
    title = "Quantité d'accident en 2009",
    pal = pal, values = df_accident_departement$nombre_accidents)



map_region <- leaflet() %>%
addProviderTiles("Esri.OceanBasemap") %>%
addPolygons(
  data = limite_region, 
  label =  labels_nb_accident_reg,
  popup = ~paste("Nombre d'accident par région"), 
  fill = TRUE, 
  # Application de la fonction palette
  fillColor = 'grey',
  fillOpacity = 0.8,
  highlightOptions = highlightOptions(color = "white", weight = 2)) %>%
   addLegend(
    title = "Density nb/km2",
    pal = pal, values = df_accident_region$nombre_accidents)

print(map_region)


