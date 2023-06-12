#On cherche a retrouver les lignes = 'rows' qui sont vides is.na()
data <- read.csv("Big Data\\csvSource.csv",sep=";")
missing_rows <- apply(data, 1, function(row) any(row = 'null'))
#on va procéder element par element, car chaque cas est différent.
print(nrow(data))
sousDF <- subset(data, data$place == "NULL")
print(nrow(sousDF))
#en lisant la documentation sur le site data.gouv, on apprend que les piétons sont a l'emplacement 10 (donc il faut remplacer les 'NULL' par 10)
sousDF$place <- 10

finalData <- data

finalData[finalData$place == "NULL", ] <- sousDF
print(nrow(finalData))