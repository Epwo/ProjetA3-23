TreatAgeAnnNaiss <- function(dataInput, finalData) {
    #grace au fichier getAllNull.r, on sait qu'il ne manque que des valeurs pour 3 itérations.
    #on pourrait remplacer ces valeur par la médiane
    #mais pour uniquement 3 valeurs, on décide de simplement les supprimer
    sousDF <- subset(dataInput, dataInput$age != "NULL")
    #le df étant de 2009, et l'age étant calculé a partir de la date actuelle -> - 14
    sousDF$age <- (as.numeric(sousDF$age) - 14)
    #on enleve également les données des enfants de moins de 5 ans conducteur que je considere comme abbérante
    underDF <- subset(sousDF,!(sousDF$age < 5 & sousDF$place == 1))
    finalData <- underDF
    #les val NULL obtenues pour 'age' sont pour la meme ligne que 'an_nais', donc ces deux val NULL sont suppr
    return(finalData)
}

