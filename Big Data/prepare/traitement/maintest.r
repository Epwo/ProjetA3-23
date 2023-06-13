source("Big Data\\prepare\\traitement\\age-Naiss.r")
data <- read.csv("Big Data\\csvSource.csv",sep=";")
#init finaldata
finalData <- data
#on affecte les val corrigées de place
finalData <- TreatAgeAnnNaiss(data,finalData)

write.csv(finalData,"Big Data\\tempcsv.csv",row.names=FALSE)