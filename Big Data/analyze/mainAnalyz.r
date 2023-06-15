source("Big Data/analyze/TabCrois.r")
library(png)
library(ggplot2)

data <- read.csv("Big Data/csvOutput.csv", sep = ",", stringsAsFactors = FALSE)

resultat <- tableau_croise(data, "descr_dispo_secu", "descr_grav")
png("Big Data/plots/mosaic.png")
mosaicplot(resultat,shade=TRUE)
print(resultat)