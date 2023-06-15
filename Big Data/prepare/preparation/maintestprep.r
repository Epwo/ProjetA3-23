source("Big Data/prepare/preparation/format.r")
source("Big Data/prepare/preparation/RegDep.r")

library(dplyr)

data <- read.csv("Big Data/csvOutTrait.csv", sep = ",")
#init finaldata
finalData <- data
#on affecte les val corrigées de place
#finalData <- gravite2num(finalData)

finalData$region <- NA
finalData$departement <- NA

for (i in seq_len(nrow(finalData))) {
  code_insee <- substr(finalData$id_code_insee[i], 0, 2)
  resultat <- obtenirRegionEtDepartement(as.character(code_insee))
  if(length(resultat$region) == 0){
    code_insee <- substr(finalData$id_code_insee[i], 0, 3)
    resultat <- obtenirRegionEtDepartement(as.character(code_insee))
  }
  finalData$region[i] <- resultat$region
  finalData$departement[i] <- resultat$departement
}


write.csv(finalData,"Big Data/temp.csv",row.names=FALSE)

