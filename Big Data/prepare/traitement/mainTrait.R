source("Big Data\\prepare\\traitement\\place.r")
source("Big Data\\prepare\\traitement\\lat-long.r")
source("Big Data\\prepare\\traitement\\age-Naiss.r")
#On cherche a retrouver les lignes = 'rows' qui sont vides is.na()
#on va procéder element par element, car chaque cas est différent.
data <- read.csv("Big Data\\csvSource.csv",sep=";")
#init finaldata
finalData <- data
#on affecte les val corrigées de place
finalData <- TreatPlace(data,finalData)
finalData <- TreatLongLat(data,finalData)
finalData <- TreatAgeAnnNaiss(data,finalData)

write.csv(finalData,"Big Data\\csvOutput.csv",row.names=FALSE)