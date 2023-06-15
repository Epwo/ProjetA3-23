library(ggplot2)
library(magrittr)
library(dplyr)

graphique_bar_count <- function(dataframe, varX) {
    bar_plot <- ggplot(dataframe, aes(x = .data[[varX]])) + # nolint: line_length_linter.
        geom_bar(stat = "count", fill = "#2e6694") +
        labs(x = varX, y = "Nombre accidents", title = paste("Nombre d'accidents en fonction de", varX)) + # nolint: line_length_linter.
        theme_minimal() +
        theme(
            plot.background = element_rect(colour = "white"),
            panel.grid.major = element_line(colour = "dodgerblue", linewidth = 0.5, linetype = "dotdash"), # nolint: line_length_linter.
            axis.text = element_text(size = 15, face = "bold"),
            axis.text.x = element_text(angle = 90),
            plot.title = element_text(colour = "red", face = "bold", size = 15, hjust = 0.5), # nolint: line_length_linter.
    )
    nom_fichier <- paste("Big Data/plots/bar_count_", varX, ".png")
    ggsave(
        nom_fichier,
        plot = bar_plot
    )
}

graphique_bar_sort <- function(df,varX,varY){
    
    plot<-ggplot(data=head(df, 15), aes(x=.data[[varX]], y=.data[[varY]])) +
  geom_bar(stat="identity",  fill = "#2e6694")+
  labs( title = "Nombre d'accidents en fonction des villes")+
  theme(
            plot.background = element_rect(colour = "white"),
            panel.grid.major = element_line(colour = "dodgerblue", linewidth = 0.5, linetype = "dotdash"), # nolint: line_length_linter.
            axis.text.x = element_text(angle = 90),
            plot.title = element_text(colour = "red", face = "bold", size = 15, hjust = 0.5), # nolint: line_length_linter.
    )

    ggsave(
        "Big Data/plots/bar_sort.png",
        plot = plot
    )
}

graphique_camenbert <- function(dataframe, var1, var2) {
    deux_colonnes <- dataframe[, c(var1, var2)]
    pie <- ggplot(deux_colonnes, aes(x = "", y = dataframe[[var2]]), fill = dataframe[[var1]]) + # nolint: line_length_linter.
        geom_bar(width = 1, stat = "identity") + scale_fill_brewer()
    ggsave(
        "Big Data/plots/pie_chart.png",
        plot = pie
    )
}

histogramme <- function(dataframe, var1) {
    hist <- ggplot(dataframe, aes(x = .data[[var1]])) +
    geom_histogram(stat = "count", binwidth = 2, fill = "#11a311e3", color = "black") +
    labs(title = paste("Nombre d'accidents par", var1), x = var1, y = "Nombre")+
    theme_minimal() +
    theme(
            plot.background = element_rect(colour = "white"),
            axis.title.x = element_text(size = 15, face = "bold"),
            axis.title.y = element_text(size = 15, face = "bold"),
            panel.grid.major = element_line(colour = "dodgerblue", linewidth = 0.5, linetype = "dotdash"), # nolint: line_length_linter.
            axis.text = element_text(size = 15, face = "bold"),
            axis.text.x = element_text(angle = 90),
            plot.title = element_text(colour = "red", face = "bold", size = 15, hjust = 0.5), # nolint: line_length_linter.
    )
    nom_fichier <- paste("Big Data/plots/histogramme_", var1, ".png")
    ggsave(
        nom_fichier,
        plot = hist
    )
}

#lire le fichier csv
data <- read.csv("Big Data/csvOutput.csv", sep = ",")

#Nombre d’accidents en fonction des conditions atmosphériques
graphique_bar_count(data, "descr_athmo")

#Nombre d’accidents en fonction de la description de la surface
graphique_bar_count(data, "descr_etat_surf")

#Nombre d’accidents selon la gravite
graphique_bar_count(data, "descr_grav")


#Nombre d’accidents par ville en France top 15
#on créer un dataframe qui regroupe les villes par noms et repertorie le nombre d'accidents par ville
DFvilles <- data %>%
  group_by(ville) %>%
  summarise(nombre_accidents = n())
#On trie par ordre décroissant
DFvilles <- DFvilles %>%
  arrange(desc(nombre_accidents))
DFvilles$nombre_accidents <- as.character(DFvilles$nombre_accidents)  # Convert nombre_accidents to character
#tracer le barplot
graphique_bar_sort(DFvilles,"ville","nombre_accidents")



#Quantité d’accidents en fonction des tranches d’âges
sequence_age <- seq(0, 120, by = 10) #création de séquence d'age de 10 en 10
data$tranche_age <- cut(data$age, breaks = sequence_age, include.lowest = TRUE) #ajout d'une colonne au dataframe contenant la tranche d'age de chaque accident
histogramme(data, "tranche_age") #tracer l'histogramme


#Moyenne mensuelle des accidents
data$moyenne_mois <- substr(data$date, 6, 7) #extraction des caractères à la position 12 et la positon 13

histogramme(data, "moyenne_mois")


#Nombre d’accidents par tranches d’heure
tranche_heure <- substr(data$date, 12, 13) #extraction des caractères à la position 12 et la positon 13
tranche_heure <- as.integer(tranche_heure)
sequence_heure <- seq(0, 24, by = 2)
data$tranche_heure <- cut(tranche_heure, breaks = sequence_heure,  include.lowest = TRUE)
histogramme(data, "tranche_heure")


tranche_heure <- substr(data$date, 12, 13) #extraction des caractères à la position 12 et la positon 13
tranche_heure <- as.integer(tranche_heure)
sequence_heure <- seq(0, 24, by = 2)
data$tranche_heure <- cut(tranche_heure, breaks = sequence_heure,  include.lowest = TRUE)
histogramme(data, "tranche_heure")
