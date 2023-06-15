PrepSerieChrono <- function(dataInput,name,by){
    #convertit la colonne date en type date
    dataInput$date <- as.Date(dataInput$date)
     # Créer une nouvelle colonne pour le regroupement
    if (by == 'month') {
        dataInput$group <- format(dataInput$date, "%m")
    } else if (by == 'week') {
        dataInput$group <- format(dataInput$date, "%W")
    } else {
        stop("Valeur invalide pour le paramètre 'by'. Attendu : 'month' ou 'week'.")
    }

  # Regrouper les données et compter le nombre d'accidents
    accidents_data <- dataInput %>%
        group_by(group) %>%
        summarise(number_of_accidents = n())


    #crée la série chronologique
    serie_chronologique <- ts(accidents_data$number_of_accidents, start = c(2009, 01), frequency = 12)
    #affiche la série chronologique
    plot(serie_chronologique, main = "Évolution du nombre d'accidents par mois", xlab = "Mois", ylab = "Nombre d'accidents")

}
dataInput <- read.csv("Big Data/csvOutputNum.csv") 
print(PrepSerieChrono(dataInput,name='regLinMonth',by='month'))
