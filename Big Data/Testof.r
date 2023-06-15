
# Charger la base de données
data <- read.csv("Big Data\\csvOutput.csv", sep = ",")


uniqVilles <- unique(data["ville"])
print(nrow(uniqVilles))

uniqCat <- unique(data["descr_cat_veh"])
print(nrow(uniqCat))

uniqCol <- unique(data["descr_type_col"])
print((uniqCol))

uniqCol <- unique(data["descr_motif_traj"])
print((uniqCol))
# Écrire la base de données modifiée dans un nouveau fichier CSV
write.csv(data, "Big Data\\departement_2022.csv", row.names = FALSE)