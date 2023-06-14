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


#Moyenne mensuelle des accidents
#Nombre d’accidents par tranches d’heure

histogramme <- function(dataframe, var1) {
    hist <- ggplot(dataframe, aes(x = .data[[var1]])) +
    geom_histogram(binwidth = 2, fill = "#11a311e3", color = "black") +
    labs(title = paste("Nombre d'accidents par tranche", var1), x = var1, y = "Nombre")+
    theme_minimal() +
    theme(
            axis.title.x = element_text(size = 25, face = "bold"),
            axis.title.y = element_text(size = 25, face = "bold"),
            panel.grid.major = element_line(colour = "dodgerblue", size = 0.5, linetype = "dotdash"), # nolint: line_length_linter.
            axis.text = element_text(size = 25, face = "bold"),
            axis.text.x = element_text(angle = 90),
            plot.title = element_text(colour = "red", face = "bold", size = 25, hjust = 0.5), # nolint: line_length_linter.
    )
    print(hist)
}


data <- read.csv("Big Data/csvOutTrait.csv", sep = ",")

#Nombre d’accidents en fonction des conditions atmosphériques
#graphique_bar(data, "descr_athmo")

#Nombre d’accidents en fonction de la description de la surface
#graphique_bar(data, "descr_etat_surf")

#Nombre d’accidents selon la gravite
print(data$descr_grav)
graphique_bar(data, "descr_grav")

#Nombre d’accidents par ville en France top 10
#on créer un dataframe qui regroupe les villes par noms et repertorie le nombre d'accidents par ville
villes <- data %>%
  group_by(ville) %>%
  summarise(nombre_accidents = n())

#On trie par ordre décroissant
villes <- villes %>%
  arrange(desc(nombre_accidents))

villes$nombre_accidents <- str(villes$nombre_accidents)
#on regroupe paris en une ville

#villes  <- villes %>% 
#   subset(villes, grepl("PARIS", villes["ville"]))

top_15_villes <- head(villes, 15)

print(top_15_villes)
graphique_bar(top_15_villes, "ville")

#Quantité d’accidents en fonction des tranches d’âges
#histogramme(data, "age")