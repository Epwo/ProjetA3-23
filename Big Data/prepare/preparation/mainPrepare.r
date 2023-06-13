source("Big Data\\prepare\\preparation\\agglo.r")
source("Big Data\\prepare\\preparation\\athmo.r")
data <- read.csv("Big Data\\csvOutTrait.csv", sep = ",")
finalData <- data
finalData <- Agglo2Num(finalData)
print(nrow(finalData))
finalData <- athmo2num(finalData)
print(nrow(finalData))
write.csv(finalData,"Big Data\\csvOutput.csv",row.names=FALSE)