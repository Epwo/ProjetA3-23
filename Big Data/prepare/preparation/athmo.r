athmo2num <- function(dataInput) {
    athmoDict = list(
        "Brouillard – fumée" = 1,"Neige – grêle" = 2,"Pluie forte" = 3,       
        "Normale" = 4, "Autre" = 5,"Temps éblouissant" = 6, "Pluie légère" = 7,
         "Temps couvert" = 8 , "Vent fort – tempête"= 9 )

    for (i in seq_along(dataInput$descr_athmo)) {
        current_value <- dataInput$descr_athmo[i]
        dataInput$descr_athmo[i] <- athmoDict[[current_value]]
    }

    return(dataInput)
    }
