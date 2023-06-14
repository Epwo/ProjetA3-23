gravite2num <- function(dataInput) {
    dictGrav = list(
        "Indemne" = 0,
        "Blessé léger" = 1,
        "Blessé hospitalisé" =2,
        "Tué" = 3)
    for (i in seq_along(dataInput$descr_grav)) {
        current_value <- dataInput$descr_grav[i]
        dataInput$descr_grav[i] <- dictGrav[[current_value]]
    }
    
    return(dataInput)
    }
