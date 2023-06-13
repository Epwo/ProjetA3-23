source("Big Data\\prepare\\preparation\\agglo.r")
data <- read.csv("Big Data\\csvOutTrait.csv", sep = ",")
#init finaldata
finalData <- data
#on affecte les val corrigées de place
finalData <- Agglo2Num(data,finalData)

#write.csv(finalData,"Big Data\\tempPrepcsv.csv",row.names=FALSE)