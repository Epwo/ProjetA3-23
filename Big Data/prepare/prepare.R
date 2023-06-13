data <- read.csv("Big Data\\csvSource.csv", sep = ";")
#affiche le type de chaque donnée
str(data)
#print(data["ville"])
print(typeof(data["descr_cat_veh"]))
categorie_veh <- data["descr_cat_veh"]
#affiche tout les éléments uniques de la liste categorie_veh
(unique(categorie_veh))
new_database <- read.csv("Big Data\\csvSource.csv", sep = ";")
replace(new_database$descr_cat_veh,new_database$descr_cat_veh == "Autocar",1)
#print(new_database["descr_cat_veh"])
#regroupe les vehicules par catégorie

#my_dico <- c("PL seul > 7,5T" = 5 , "VU seul 1,5T <= PTAC <= 3,5T avec ou sans remorque" = 1,"VL seul" = 2,"PL > 3,5T + remorque" = 5, )
new_database["descr_cat_veh"][new_database["descr_cat_veh"] == "Autocar"]=1
print(unique(new_database["descr_cat_veh"]))


