library(ggplot2)

graphique_bar <- function(dataframe, var1) {
    bar_plot <- ggplot(dataframe, aes(x = .data[[var1]])) + # nolint: line_length_linter.
        geom_bar(stat = "count", fill = "#2e6694") +
        labs(x = var1, y = "Nombre accidents", title = paste("Nombre d'accidents en fonction de", var1)) + # nolint: line_length_linter.
        theme_minimal() +
        theme(
            axis.title.x = element_text(size = 25, face = "bold"),
            axis.title.y = element_text(size = 25, face = "bold"),
            panel.grid.major = element_line(colour = "dodgerblue", size = 0.5, linetype = "dotdash"), # nolint: line_length_linter.
            axis.text = element_text(size = 25, face = "bold"),
            axis.text.x = element_text(angle = 90),
            plot.title = element_text(colour = "red", face = "bold", size = 25, hjust = 0.5), # nolint: line_length_linter.
    )
    print(bar_plot)
}

graphique_camenbert <- function(dataframe, var1, var2) {
    deux_colonnes <- dataframe[, c(var1, var2)]
    pie <- ggplot(deux_colonnes, aes(x = "", y = dataframe[[var2]]), fill = dataframe[[var1]]) + # nolint: line_length_linter.
        geom_bar(width = 1, stat = "identity") + scale_fill_brewer()
    print(pie)
}

#Nombre d’accidents par ville
graphique_carte <- function(var1, var2){
}


#Quantité d’accidents en fonction des tranches d’âges
#Moyenne mensuelle des accidents
#Nombre d’accidents par tranches d’heure

histogramme <- function(var1, var2) {
     
}


data <- read.csv("Big Data/csvOutput.csv", sep = ",")

#Nombre d’accidents en fonction des conditions atmosphériques
#graphique_bar(data, "descr_athmo")

#Nombre d’accidents en fonction de la description de la surface
#graphique_bar(data, "descr_etat_surf")

#Nombre d’accidents selon la gravite
graphique_bar(data, "descr_grav")
