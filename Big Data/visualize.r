#Nombre d’accidents en fonction des conditions atmosphériques
#Nombre d’accidents en fonction de la description de la surface 
#Nombre d’accidents selon la gravité	
graphique_bar <- function(var1, var2) { 
    barplot()

}

graphique_camenbert <- function(var1, var2) { 
    pie()
}

#Nombre d’accidents par ville
graphique_bar_empilees <- function(var1, var2) { 
    ggplot(data = votre_data_frame, aes(x = variable_x, y = variable_y)) +
  geom_point()
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