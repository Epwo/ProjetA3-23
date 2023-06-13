Agglo2Num <- function(dataInput, finalData) {
    #on obtient 2 valeurs uniques on va les convertir et leur donner une valeur num
    # tq  -> ("En agglomération" : 1 ,"En agglomération" :0)
    aggloDict <- list("En agglomération" = 1, "Hors agglomération" = 0)

    for (i in seq_along(dataInput$descr_agglo)) {
        current_value <- dataInput$descr_agglo[i]
        dataInput$descr_agglo[i] <- aggloDict[[current_value]]
    }
   return(dataInput)
}
