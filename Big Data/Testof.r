
# Charger la base de données
data <- read.csv("Big Data\\csvSource.csv", sep = ";")

# Créer une nouvelle colonne avec des valeurs spécifiques
new_colonne <- data$id_code_insee

# Ajouter la nouvelle colonne avec un nom spécifique à la base de données
data <- cbind(data, nouvelle_colonne = new_colonne)

# Écrire la base de données modifiée dans un nouveau fichier CSV
write.csv(data, "Big Data\\departement_2022.csv", row.names = FALSE)