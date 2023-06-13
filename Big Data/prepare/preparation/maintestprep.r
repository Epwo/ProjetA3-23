source("Big Data\\prepare\\traitement\\agglo.r")
data <- read.csv("Big Data\\csvOutTrait.csv", sep = ";")
#init finaldata
finalData <- data
print(nrow(finalData))
#on affecte les val corrigées de place
finalData <- TreatLongLat(data,finalData)

write.csv(finalData,"Big Data\\tempcsv.csv",row.names=FALSE)