source("Big Data/prepare/traitement/isInside.r")
data <- read.csv("Big Data/csvOutTrait.csv",sep=",")
#init finaldata
finalData <- data
yes = list()
print(nrow(finalData))
#on affecte les val corrigées de place
yes <- CheckInFrance(finalData)
print(unique(yes))
#write.csv(finalData,"Big Data/tempcsv.csv",row.names=FALSE)