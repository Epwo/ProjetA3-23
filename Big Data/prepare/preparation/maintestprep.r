source("Big Data\\prepare\\preparation\\gravite.r")
source("Big Data\\prepare\\preparation\\regionDepart.r")
source("Big Data/prepare/preparation/format.r")
data <- read.csv("Big Data\\csvOutTrait.csv", sep = ",")
#init finaldata
finalData <- data
#on affecte les val corrigées de place
#finalData <- gravite2num(finalData)
finalData <- PrepFormat((finalData))
finalData <- regiondepartement2(finalData)

write.csv(finalData,"Big Data\\temp.csv",row.names=FALSE)