TreatLongLat <- function(dataInput, finalData) {
    source("Big Data\\prepare\\traitement\\quartierData.r")
    source("Big Data\\prepare\\traitement\\isInside.r")
  # Create a new data frame where dataInput$ville starts with "PARIS"
    sousDF <- dataInput


    # Replace latitude and longitude values in sousDF
    #on se balade dans tt les valeurs du tableau
    for (i in seq_along(sousDF$ville)) {
         #on definit ville comme nom de la ville
        ville <- sousDF$ville[i]
        if(startsWith(ville,"PARIS")){
            #on recupere le num de quartier, en enlevant "PARIS" du nom de la ville -> 'PARIS 13' -> '13'
            quartier_num <- as.numeric(sub("PARIS ", "", ville))
            #on remplace les valeurs correspondantes grace au dict, quartier_paris
            sousDF$latitude[i] <- arrondissements_paris[[quartier_num]]["lat"] # nolint
            sousDF$longitude[i] <- arrondissements_paris[[quartier_num]]["long"]# nolint
        }
        else if(startsWith(ville,"MARSEILLE")){
            #on recupere le num de quartier, en enlevant "PARIS" du nom de la ville -> 'PARIS 13' -> '13'
            quartier_num <- as.numeric(sub("MARSEILLE ", "", ville))
            #on remplace les valeurs correspondantes grace au dict, quartier_paris
            sousDF$latitude[i] <- arrondissements_marseille[[quartier_num]]["lat"]# nolint
            sousDF$longitude[i] <- arrondissements_marseille[[quartier_num]]["long"]# nolint
        }
        else if(startsWith(ville,"LYON")){
            #on recupere le num de quartier, en enlevant "PARIS" du nom de la ville -> 'PARIS 13' -> '13'
            quartier_num <- as.numeric(sub("LYON ", "", ville))
            #on remplace les valeurs correspondantes grace au dict, quartier_paris
            sousDF$latitude[i] <- arrondissements_lyon[[quartier_num]]["lat"]# nolint
            sousDF$longitude[i] <- arrondissements_lyon[[quartier_num]]["long"]# nolint
        }
    }
    

    return(sousDF)
}
