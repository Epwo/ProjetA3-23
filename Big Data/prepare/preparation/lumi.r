luminosite2num <- function(dataInput) {
    lumDict = list(
        "Crépuscule ou aube" = 1,
        "Plein jour" = 2,
        "Nuit sans éclairage public" = 3,
        "Nuit avec éclairage public allumé" = 4,
        "Nuit avec éclairage public non allumé" = 5 )
    for (i in seq_along(dataInput$descr_lum)) {
        current_value <- dataInput$descr_lum[i]
        dataInput$descr_lum[i] <- lumDict[[current_value]]
    }

    return(dataInput)
    }
