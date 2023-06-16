source("Big Data/analyze/TabCrois.r")
library(png)
library(ggplot2)

data <- read.csv("Big Data/csvOutput.csv", sep = ",", stringsAsFactors = FALSE)

resultat <- tableau_croise(data, "descr_dispo_secu", "descr_grav")
png("Big Data/plots/mosaic_descrSecu-grav.png")
mosaicplot(resultat,shade=TRUE,main = "My Mosaic - Securité vs gravité")

resultat <- tableau_croise(data, "descr_lum", "descr_grav")
png("Big Data/plots/mosaic_lumi-grav.png")
mosaicplot(resultat,shade=TRUE,main = "My Mosaic - Luminosité vs gravité")

resultat <- tableau_croise(data, "descr_cat_veh", "descr_grav")
png("Big Data/plots/mosaic_vehic-grav.png")
mosaicplot(resultat,shade=TRUE,main = "My Mosaic - Catégorie de Vehic. vs gravité")

print(resultat)