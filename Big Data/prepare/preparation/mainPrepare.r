#import des fichiers sources
source("Big Data\\prepare\\preparation\\catVehic.R")
source("Big Data\\prepare\\preparation\\gravite.r")
source("Big Data\\prepare\\preparation\\format.r")
source("Big Data\\prepare\\preparation\\agglo.r")
source("Big Data\\prepare\\preparation\\athmo.r")
source("Big Data\\prepare\\preparation\\lumi.r")

ReplaceStrByNum <- function(dfInput){
    dfInput <- luminosite2num(dfInput)
    dfInput <- athmo2num(dfInput)
    dfInput <- Agglo2Num(dfInput) 
    #surface
    #intersection
    return(dfInput)
}


#modification des colomnes du csv, fonction par fonction
data <- read.csv("Big Data\\csvOutTrait.csv", sep = ",")
finalData <- PrepCatVeh(data,data)
print(nrow(finalData))
finalData <- gravite2num(finalData)
print(nrow(finalData))
finalData <- PrepFormat((finalData))
print(nrow(finalData))

#finalData <- ReplaceStrByNum(finalData)
#afin d'être certain de ne pas perdre de valeurs, je print la taille des lignes
#on écrit dans csvOutput la nouvelle base de données
write.csv(finalData,"Big Data\\csvOutput.csv",row.names=FALSE,quote = FALSE)