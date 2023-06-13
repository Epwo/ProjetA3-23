source("Big Data\\prepare\\preparation\\format.r")
source("Big Data\\prepare\\preparation\\catVehic.R")
source("Big Data\\prepare\\preparation\\agglo.r")

data <- read.csv("Big Data\\csvOutTrait.csv", sep = ";")
finalData <- data
finalData <- functionQUELCONQUE(data,finalData)

write.csv(finalData,"Big Data\\csvOutput.csv",row.names=FALSE)