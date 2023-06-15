PrepCatVeh <- function(new_database,final_data){
    #création du dico pour attribuer une valeur aux catégories de véhicules
    dico <- c("VU seul 1,5T <= PTAC <= 3,5T avec ou sans remorque " = 1, "VL seul" = 1,'Voiturette (Quadricycle à moteur carrossé) (anciennement "voiturette ou tricycle à moteur")' = 1, "PL seul > 7,5T" = 2, "PL > 3,5T + remorque" = 2,"Tracteur routier + semi-remorque" = 2, "PL seul 3,5T <PTCA <= 7,5T" = 2, "Tracteur routier seul" = 2,"Cyclomoteur <50cm3" = 3, "Motocyclette > 125 cm3" = 3, "Scooter > 50 cm3 et <= 125 cm3" =3, "Scooter > 125 cm3" = 3, "Scooter < 50 cm3" = 3,"Motocyclette > 50 cm3 et <= 125 cm3" = 3, "Quad lourd > 50 cm3 (Quadricycle à moteur non carrossé)" = 3,"Quad léger <= 50 cm3 (Quadricycle à moteur non carrossé)" = 3, "Tracteur agricole" = 4, "Autocar" = 5, "Autobus" = 5, "Train" = 5, "Tramway" = 5,"Autre véhicule" = 6, "Engin spécial" = 6, "Bicyclette" = 7)
    #on parcourt la colonne descr_cat_veh pour remplacer ses éléments par leurs valeurs dans le dico
    for(i in seq_along(data$descr_cat_veh)){
        categorie <- data$descr_cat_veh[i] 
        data$descr_cat_veh[i] <- dico[categorie]
    }
    final_data <- data

return(final_data)
}
