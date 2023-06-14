#import des fichiers sources
source("Big Data\\prepare\\preparation\\agglo.r")
source("Big Data\\prepare\\preparation\\athmo.r")
source("Big Data\\prepare\\preparation\\lumi.r")
#modification des colomnes du csv, fonction par fonction

#afin d'être certain de ne pas perdre de valeurs, je print la taille des lignes
#on écrit dans csvOutput la nouvelle base de données
write.csv(finalData,"Big Data\\csvOutput.csv",row.names=FALSE)