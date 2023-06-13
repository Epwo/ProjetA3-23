source("Big Data\\prepare\\traitement\\lat-long.r")
source("Big Data\\prepare\\traitement\\mergeOnFinal.r")
data <- read.csv("Big Data\\csvSource.csv",sep=";")
#init finaldata
finalData <- data
print(nrow(finalData))
#on affecte les val corrigées de place
finalData <- TreatLongLat(data,finalData)
print(nrow(finalData))
write.csv(finalData,"Big Data\\tempcsv.csv",row.names=FALSE)