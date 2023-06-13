library(ggplot2)

#Nombre d’accidents en fonction des conditions atmosphériques
#Nombre d’accidents en fonction de la description de la surface
#Nombre d’accidents selon la gravite

graphique_bar <- function(var1, var2) {
    deux_colonnes <- dataframe1[, c(var1, var2)]
    bar_plot <- ggplot(deux_colonnes, aes(x = dataframe1[[var1]], y = dataframe1[[var2]])) + # nolint: line_length_linter.
    geom_bar(stat = "identity", fill = "#2e6694") +
    labs(x = var1, y = var2, title = paste("Nombre d'accidents en fonction de", var2)) + # nolint: line_length_linter.
    theme_minimal() + theme(
    axis.title.x = element_text(size = 25, face = "bold"),
    axis.title.y = element_text(size = 25, face = "bold"),
    panel.grid.major = element_line(
            colour = "dodgerblue",
            size = 0.5, linetype = "dotdash"
        ),
    axis.text = element_text(
            size = 25, face = "bold"
        ),
     plot.title = element_text(colour = "red", face = "bold", size = 25, hjust = 0.5),
    )

    print(bar_plot)
}

graphique_camenbert <- function(var1, var2) {
    pie()
}

#Nombre d’accidents par ville
graphique_bar_empilees <- function(var1, var2) {
    ggplot()
}

#Nombre d’accidents par tranches d’heure
graphique_nuage_points <- function(var1, var2) {
    plot()
}

#Quantité d’accidents en fonction des tranches d’âges
#Moyenne mensuelle des accidents

histograme <- function(var1, var2) {
    hist()
}


categorie <- c("A", "B", "C", "D", "C", "A")
valeur1 <- c(10, 20, 15, 5, 3,1)
valeur2 <- c(5, 15, 10, 20)

dataframe1 <- data.frame(categorie = categorie, taille = valeur1)

graphique_bar("categorie", "taille")