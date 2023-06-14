require(sf)
library(rmapshaper)
library(ggplot2)

# Préparer les données USArrests
arrests <- data.frame(
  Murder = c(13.2, 10.0, 8.1, 8.8, 9.0, 7.9),
  Assault = c(236, 263, 294, 190, 276, 204),
  UrbanPop = c(58, 48, 80, 50, 91, 78),
  Rape = c(21.2, 44.5, 31.0, 19.5, 40.6, 38.7),
  region = c("alabama", "alaska", "arizona", "arkansas", "california", "colorado"),
  row.names = c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado")
)

library(dplyr)

# Récupérer les données cartographiques des états et les fusionner avec les données sur la criminalité
states_map <- map_data("france")
arrests_map <- left_join(states_map, arrests, by = "region")

# Créer la carte
map <- ggplot(arrests_map, aes(long, lat, group = group))+
  geom_polygon(aes(fill = Assault), color = "white")+
  scale_fill_viridis_c(option = "C")
ggsave(
        "Big Data/plots/carte.png",
        plot = map
    )
     Sys.setenv(OPENSSL_CONF="/dev/null")
  mapshot(villes_mapbox, file = "Big Data/plots/carte_villes.png", selfcontained = TRUE)