TreatAgeAnnNaiss <- function(dataInput, finalData) {
    #grace au fichier getAllNull.r, on sait qu'il ne manque que des valeurs pour 3 itérations.
    #on pourrait remplacer ces valeur par la médiane
    #mais pour uniquement 3 valeurs, on décide de simplement les supprimer
    finalData <- subset(dataInput, dataInput$age != "NULL")
    #les val NULL obtenues pour 'age' sont pour la meme ligne que 'an_nais'
    return(finalData)
}

