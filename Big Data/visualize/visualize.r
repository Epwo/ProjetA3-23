library(ggplot2)
library(magrittr)
library(dplyr)
graphique_bar_count <- function(dataframe, varX) {
    bar_plot <- ggplot(dataframe, aes(x = .data[[varX]])) + # nolint: line_length_linter.
        geom_bar(stat = "count", fill = "#2e6694") +
        labs(x = varX, y = "Nombre accidents", title = paste("Nombre d'accidents en fonction de", varX)) + # nolint: line_length_linter.
        theme_minimal() +
        theme(
            panel.grid.major = element_line(colour = "dodgerblue", linewidth = 0.5, linetype = "dotdash"), # nolint: line_length_linter.
            axis.text = element_text(size = 25, face = "bold"),
            axis.text.x = element_text(angle = 90),
            plot.title = element_text(colour = "red", face = "bold", size = 25, hjust = 0.5), # nolint: line_length_linter.
    )
    ggsave(
        "Big Data\\plots\\bar_count.pdf",
        plot = bar_plot
    )
}

graphique_bar_sort <- function(df,varX,varY){
 plot<-ggplot(data=head(DFvilles, 15), aes(x=ville, y=nombre_accidents)) +
  geom_bar(stat="identity")+
  theme(
            panel.grid.major = element_line(colour = "dodgerblue", linewidth = 0.5, linetype = "dotdash"), # nolint: line_length_linter.
            axis.text.x = element_text(angle = 90),
            plot.title = element_text(colour = "red", face = "bold", size = 25, hjust = 0.5), # nolint: line_length_linter.
    )

    ggsave(
        "Big Data\\plots\\bar_sort.pdf",
        plot = plot
    )
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
            panel.grid.major = element_line(colour = "dodgerblue", linewidth = 0.5, linetype = "dotdash"), # nolint: line_length_linter.
            axis.text = element_text(size = 25, face = "bold"),
            axis.text.x = element_text(angle = 90),
            plot.title = element_text(colour = "red", face = "bold", size = 25, hjust = 0.5), # nolint: line_length_linter.
    )
    print(hist)
}


data <- read.csv("Big Data/csvOutput.csv", sep = ",")

#Nombre d’accidents en fonction des conditions atmosphériques
#graphique_bar_count(data, "descr_athmo")

#Nombre d’accidents en fonction de la description de la surface
#graphique_bar_count(data, "descr_etat_surf")

#Nombre d’accidents selon la gravite
#print(data$descr_grav)
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

#on regroupe paris en une ville

#print(villes)

print(head(DFvilles, 15))


# Barplot horizontal

#Quantité d’accidents en fonction des tranches d’âges
#histogramme(data, "age")