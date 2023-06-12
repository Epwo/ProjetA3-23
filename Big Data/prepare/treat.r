#On cherche a retrouver les lignes = 'rows' qui sont vides is.na()
data <- read.csv("Big Data\\csvSource.csv",sep=";")
missing_rows <- apply(data, 1, function(row) any(row = 'null'))
#on va procéder element par element, car chaque cas est différent.
print(nrow(data))
sousDF <- subset(data, data$place == "NULL")
print(nrow(sousDF))


sousDF