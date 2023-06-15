library(datasets)
regiondepartement2 <- function(dataInput){

    #regions <- read.csv("Big Data\\departement_2022.csv", sep = ";")

# Charger l'ensemble de données contenant les correspondances entre les codes INSEE et les départements français
departements <- read.csv("Big Data\\departement_2022.csv", sep=";")

# Fusionner la base de données avec l'ensemble de données des régions françaises
dataInput$departements <- merge(dataInput, departements, by.x = "id_code_insee", by.y = "id_code_insee", all.x = TRUE)

# Fusionner la base de données avec l'ensemble de données des départements français
#data <- merge(data, departements, by = "code_insee", all.x = TRUE)
return(dataInput)
}
