data <- read.csv("Big Data\\csvSource.csv",sep=";")
#On cherche a retrouver les lignes = 'rows' qui sont vides is.na()
missing_rows <- apply(data, 1, function(row) any(row = 'null'))


sousDF <- subset(data,descr_athmo == "Neige – grêle")
sousDF

#dh <- data[data$descr_athmo == "Neige – grêle",]
#dh