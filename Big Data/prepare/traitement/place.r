TreatPlace <- function(dataInput, finalData) {
    sousDF <- subset(dataInput, dataInput$place == "NULL")
    #en lisant la documentation sur le site data.gouv, on apprend que les piétons sont a l'emplacement 10 (donc il faut remplacer les 'NULL' par 10)
    sousDF$place <- 10
    finalData[finalData$place == "NULL", ] <- sousDF
    #on a donc remplacé les différentes valeurs NULL dans place, par 10, en estimant que chaque valeur NULL correspondait en général au piéton dans l'accident -> "balades"
    return(finalData)
}
