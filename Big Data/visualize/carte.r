library(plotly)
library(dplyr)
library(ggplot2)
library(mapview)
library(leaflet)
library(geojsonio)
library(htmltools)
# declaration du token

#lecture du df des accidents de 2009
data <- read.csv("Big Data/csvOutput.csv", sep =',')

#Nombre d’accidents par ville en France
#création du dataframe
  villes <- data %>%
    group_by(ville, latitude, longitude) %>%
    summarise(nombre_accidents = n()) #compte le nombre de fois qu'une ville se répète pour avoir le nombre d'accident

carte_accidents_par_ville <- function(){
  Sys.setenv('MAPBOX_TOKEN' = 'pk.eyJ1IjoicGhpbGlwcGluZWFuZ2JkIiwiYSI6ImNsaXV1cG9hdjFzOWwzZG54YmcyaTMwYXEifQ.GNGi4FnQmOPefaMgaGoGxQ')
  
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

carte_accidents_par_ville()


#lecture des fichiers geojson contenant les limites des départements et des régions
limite_dep <- geojson_read("Big Data/departements.geojson",  what = "sp")
limite_region <- geojson_read("Big Data/regions.geojson",  what = "sp")   

#création d'un df contenant le nombre d'accidents par region
df_accident_region <- data %>%
  group_by(region) %>%
  summarise(nombre_accidents = n()) #somme les lignes pour obtenir le nombre d'accidents

#création d'un df contenant le nombre d'accidents par departement
df_accident_departement <- data %>%
  group_by(departement) %>%
  summarise(nombre_accidents = n()) #somme les lignes pour obtenir le nombre d'accidents

#création d'un df contenant le nombre d'accidents graves par region
df_accidents_graves_region <- data %>%
  group_by(region) %>%
   filter(descr_grav > 1) %>% #on ne prend que les gravité supérieur à 1 (blessée)
    summarise(nombre_accidents_grave = n()) #somme les lignes pour obtenir le nombre d'accidents graves

#création d'un df contenant le nombre d'accidents par departement
df_accidents_graves_departement <- data %>%
  group_by(departement) %>%
  filter(descr_grav > 1) %>% #on ne prend que les gravité supérieur à 1 (blessée)
  summarise(nombre_accidents_grave = n()) #somme les lignes pour obtenir le nombre d'accidents graves


#initialisation les valeurs à 0 pour éviter des problèmes de taille entre les dataframe
df_accident_region$taux_accident <- 0
df_accident_departement$taux_accident <- 0

#calcul du taux accident par mois et par région
df_accident_region$taux_accident <- (df_accidents_graves_region$nombre_accidents_grave)/(df_accident_region$nombre_accidents)*100
df_accident_departement$taux_accident <- (df_accidents_graves_departement$nombre_accidents_grave)/(df_accident_departement$nombre_accidents)*100

#on initialise les valeurs à 0 
limite_region$accident <- 0
limite_dep$accident <- 0
limite_region$taux_accident <- 0
limite_dep$taux_accident <- 0

#on ajoute le nombre d'accidents correspondant à chaque région/département
limite_region$accident <- df_accident_region$nombre_accidents[match(gsub("-", " ", tolower(limite_region$nom)), gsub("-", " ", tolower(df_accident_region$region)))]
limite_dep$accident <- df_accident_departement$nombre_accidents[match(gsub("-", " ", tolower(limite_dep$nom)), gsub("-", " ", tolower(df_accident_departement$departement)))]

#on ajoute le nombre d'accidents graves correspondant à chaque région/département
limite_region$taux_accident <- df_accident_region$taux_accident[match(gsub("-", " ", tolower(limite_region$nom)), gsub("-", " ", tolower(df_accident_region$region)))]
limite_dep$taux_accident <- df_accident_departement$taux_accident[match(gsub("-", " ", tolower(limite_dep$nom)), gsub("-", " ", tolower(df_accident_departement$departement)))]

# Creation de la palette sur le nombres d'accidents
pal_region <- colorNumeric(
  palette = "YlOrRd", #choix de la palette de couleur
  domain = limite_region$accident, #Couleur en fonction du nombre d'accidents
)
pal_departement <- colorNumeric(
  palette = "YlOrRd", #choix de la palette de couleur
  domain = limite_dep$accident, #Couleur en fonction du nombre d'accidents
)

# Creation de la palette sur le nombres d'accidents graves
pal_grave_region <- colorNumeric(
  palette = "YlOrRd", #choix de la palette de couleur
  domain = limite_region$taux_accident, #Couleur en fonction du taux d'accidents
)
pal_grave_departement <- colorNumeric(
  palette = "YlOrRd", #choix de la palette de couleur
  domain = limite_dep$taux_accident, #Couleur en fonction du taux d'accidents
)

#creation de labels pour les cartes
labels_nb_accident_region <- sprintf(
  "<strong>%s</strong> </br> %s accidents", 
  limite_region$nom, limite_region$accident
) %>% lapply(htmltools::HTML) #on applique html

labels_nb_accident_departement <- sprintf(
  "<strong>%s</strong> </br> %s accidents", #code html pour écrire dans le label
  limite_dep$nom, limite_dep$accident
) %>% lapply(htmltools::HTML) #on applique html

labels_nb_accidents_graves_region <- sprintf(
  "<strong>%s</strong> </br> taux d'accidents : %s", #code html pour écrire dans le label
  limite_region$nom, limite_region$taux_accident
) %>% lapply(htmltools::HTML) #on applique html

labels_nb_accidents_graves_departement <- sprintf(
  "<strong>%s</strong> </br> taux d'accidents : %s ", #code html pour écrire dans le label
  limite_dep$nom, limite_dep$taux_accident
) %>% lapply(htmltools::HTML) #on applique html

#carte du nombres d'accident par région
map_region_accidents <- leaflet(limite_region) %>%
addProviderTiles("Esri.OceanBasemap") %>% #ajoute le fond de carte
setView(lng = 2.80, lat = 46.80, zoom = 6)%>% #ajuste le zoom
addPolygons( #ajoute les polygones des régions
  label =  labels_nb_accident_region,
  color = "white",
  fillColor = ~pal_region(accident),
  fillOpacity = 0.8,
  highlightOptions = highlightOptions(color = "white", weight = 2)) %>%
   addLegend( #ajoute la légende
    title = "Quantité d'accident en 2009",
    pal = pal_region, values = ~ accident)


#carte du nombres d'accident par département
map_departement_accidents <- leaflet(limite_dep) %>%
  addProviderTiles("Esri.OceanBasemap") %>% #ajoute le fond de carte
  setView(lng = 2.80, lat = 46.80, zoom = 6)%>% #ajuste le zoom
  addPolygons( #ajoute les polygones des départements
  label =  labels_nb_accident_departement,  
  color = "white",
  fillColor = ~pal_departement(accident),
  fillOpacity = 0.8,
  highlightOptions = highlightOptions(color = "white", weight = 2)) %>%
   addLegend(
    title = "Quantité d'accident en 2009",
    pal = pal_departement, values = ~ accident)


#carte du taux d'accident par région
map_region_taux_accident <- leaflet(limite_region) %>%
addProviderTiles("Esri.OceanBasemap") %>% #ajoute le fond de carte
setView(lng = 2.80, lat = 46.80, zoom = 6)%>% #ajuste le zoom
addPolygons( #ajoute les polygones des régions
  label =  labels_nb_accidents_graves_region,  
  color = "white",
  fillColor = ~pal_grave_region(taux_accident),
  fillOpacity = 0.8,
  highlightOptions = highlightOptions(color = "white", weight = 2)) %>%
   addLegend(
    title = "taux d'accidents graves en 2009",
    pal = pal_grave_region, values = ~ taux_accident)


#carte du taux d'accident par département
map_departement_taux_accidents <- leaflet(limite_dep) %>%
  addProviderTiles("Esri.OceanBasemap") %>% #ajoute le fond de carte
  setView(lng = 2.80, lat = 46.80, zoom = 6)%>% #ajuste le zoom
  addPolygons( #ajoute les polygones des départements
  label =  labels_nb_accidents_graves_departement,  
  color = "white",
  fillColor = ~pal_grave_departement(taux_accident), 
  fillOpacity = 0.8,
  highlightOptions = highlightOptions(color = "white", weight = 2)) %>%
   addLegend(
    title = "taux d'accidents graves en 2009",
    pal = pal_grave_departement, values = ~ taux_accident)


Sys.setenv(OPENSSL_CONF="/dev/null") #configuration système pour éviter les bug

#capture des cartes et enregistrement au format png
#mapshot(map_region_accidents, file = "Big Data/plots/accident_region.png", selfcontained = TRUE)
#mapshot(map_departement_accidents, file = "Big Data/plots/accident_departement.png", selfcontained = TRUE)
#mapshot(map_region_taux_accident, file = "Big Data/plots/taux_accident_region.png", selfcontained = TRUE)
#mapshot(map_departement_taux_accidents, file = "Big Data/plots/taux_accident_departement.png", selfcontained = TRUE)