#import des fichiers sources
source("Big Data\\prepare\\preparation\\agglo.r")
source("Big Data\\prepare\\preparation\\athmo.r")
source("Big Data\\prepare\\preparation\\lumi.r")
source("Big Data\\prepare\\preparation\\catVehic.R")
source("Big Data\\prepare\\preparation\\gravite.r")
#modification des colomnes du csv, fonction par fonction
data <- read.csv("Big Data\\csvOutTrait.csv", sep = ",")
finalData <- PrepCatVeh(data,data)
print(nrow(finalData))
finalData <- gravite2num(finalData)
print(nrow(finalData))
#afin d'être certain de ne pas perdre de valeurs, je print la taille des lignes
#on écrit dans csvOutput la nouvelle base de données
write.csv(finalData,"Big Data\\csvOutput.csv",row.names=FALSE)