library(dplyr)  # Pour la manipulation des données
library(ggplot2)  # Pour la visualisation des données
library(gridExtra)

printRegLinMonth <- function(data,name){

    # Convertir la colonne 'date' en format de date
    data$date <- as.Date(data$date)

    # Créer une nouvelle colonne 'mois' à partir de la colonne 'date'
    data$mois <- format(data$date, "%m")

    # Regrouper les données par mois et compter le nombre d'accidents par mois
    accidents_par_mois <- data %>%
    group_by(mois) %>% # nolint: object_usage_linter.
    summarise(nombre_accidents = n())

    # Convert the month column to factor and reorder the levels
    accidents_par_mois$mois <- factor(accidents_par_mois$mois, levels = unique(accidents_par_mois$mois))

    # Ajuster un modèle de régression linéaire
    modele <- lm(as.numeric(nombre_accidents) ~ as.numeric(mois), data = accidents_par_mois)



    # Tracer un graphique de dispersion avec la ligne de régression
    plot <- ggplot(accidents_par_mois, aes(x = mois, y = nombre_accidents)) + # nolint: object_usage_linter.
        geom_point() +
        geom_smooth(method = "lm", se = FALSE) +
        geom_text(aes(label = paste("y =", round(coef(modele)[1], 2), "+", round(coef(modele)[2], 2), "x")), x = Inf, y = -Inf, hjust = 1, vjust = 0, size = 4) +
        geom_abline(intercept = coef(modele)[1] , slope = coef(modele)[2], color = "red") +
        labs(x = "Mois", y = "Nombre d'accidents", title = "Régression linéaire du nombre d'accidents par mois")


    # Sauvegarder le graphique en PDF
    ggsave(paste("Big Data/plots/",name,".pdf",sep=""), plot, width = 8, height = 6)
}
