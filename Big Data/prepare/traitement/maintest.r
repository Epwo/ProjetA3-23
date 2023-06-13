source("Big Data\\prepare\\traitement\\lat-long.r")
data <- read.csv("Big Data\\csvSource.csv",sep=";")
#init finaldata
finalData <- data
#on affecte les val corrigées de place
finalData <- TreatLongLat(data,finalData)

write.csv(finalData,"Big Data\\tempcsv.csv",row.names=FALSE)