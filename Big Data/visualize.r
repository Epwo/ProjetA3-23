library(ggplot2)

#Nombre d’accidents en fonction des conditions atmosphériques
#Nombre d’accidents en fonction de la description de la surface
#Nombre d’accidents selon la gravite

graphique_bar <- function(var1, var2) {
    barplot(var2, col = "#668FB7", xlab="Titre de l'axe des x",
        ylab="Titre de l'axe des y")
    title(main =" Nombre d’accidents en fonction de/des", 
        sub = "Sous-titre",
        xlab = "Axe des x", ylab = "Axe des y",
      cex.main = 2,   font.main= 4, col.main= "red",
      cex.sub = 0.75, font.sub = 3, col.sub = "green",
      col.lab ="darkblue"
      )

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


categorie <- c("A", "B", "C", "D", "C")
valeur1 <- c(10, 20, 15, 5, 3)
valeur2 <- c(5, 15, 10, 20)



dataframe1 <- data.frame(categorie = categorie, taille = valeur1)

graphique_bar(dataframe1["categorie"], dataframe1$taille)