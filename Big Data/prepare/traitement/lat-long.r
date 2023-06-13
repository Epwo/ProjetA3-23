TreatLongLat <- function(dataInput, finalData) {
  # Create a new data frame where dataInput$ville starts with "PARIS"
    sousDF <- subset(dataInput, startsWith(dataInput$ville, "PARIS"))

    # Coordonnées de latitude et longitude pour chaque quartier
    latitudes <- c(48.8626, 48.8691, 48.8637, 48.8566, 48.8448, 48.8493, 48.8567, 48.8722, 48.8760, 48.8761,
                    48.8584, 48.8352, 48.8283, 48.8296, 48.8412, 48.8600, 48.8872, 48.8925, 48.8817, 48.8632)
    longitudes <- c(2.3364, 2.3473, 2.3590, 2.3522, 2.3551, 2.3324, 2.3208, 2.3124, 2.3375, 2.3602,
                    2.3795, 2.4458, 2.3627, 2.3267, 2.3002, 2.2620, 2.3075, 2.3444, 2.3834, 2.4001)

    # Création du dictionnaire des quartiers de Paris
    quartiers_paris <- setNames(Map(function(lat, long) c(lat = lat, long = long), latitudes, longitudes),
                                paste0(1:20))


    # Replace latitude and longitude values in sousDF
    #on se balade dans tt les valeurs du tableau
    for (i in seq_along(sousDF$ville)) {
        #on definit ville comme nom de la ville
        ville <- sousDF$ville[i]
        #on recupere le num de quartier, en enlevant "PARIS" du nom de la ville -> 'PARIS 13' -> '13'
        quartier_num <- as.numeric(sub("PARIS ", "", ville))
        #on remplace les valeurs correspondantes grace au dict, quartier_paris
        sousDF$latitude[i] <- quartiers_paris[[quartier_num]]["lat"]
        sousDF$longitude[i] <- quartiers_paris[[quartier_num]]["long"]
    }

    return(sousDF)
}
