source("Big Data\\prepare\\preparation\\athmo.r")
data <- read.csv("Big Data\\csvOutTrait.csv", sep = ",")
#init finaldata
finalData <- data
#on affecte les val corrigées de place
finalData <- athmo2num(finalData)

write.csv(finalData,"Big Data\\tempPrepcsv.csv",row.names=FALSE)