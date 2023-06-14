library(dplyr)
library(ggplot2)
printRegLinMonth <- function(data, name, by) {
  # Convertir la colonne 'date' en format de date
  data$date <- as.Date(data$date)

  # Créer une nouvelle colonne pour le regroupement
  if (by == 'month') {
    data$group <- format(data$date, "%m")
  } else if (by == 'week') {
    data$group <- format(data$date, "%W")
  } else {
    stop("Valeur invalide pour le paramètre 'by'. Attendu : 'month' ou 'week'.")
  }

  # Regrouper les données et compter le nombre d'accidents
  accidents_data <- data %>%
    group_by(group) %>%
    summarise(number_of_accidents = n())

  # Ajuster un modèle de régression linéaire
  model <- lm(number_of_accidents ~ as.numeric(group), data = accidents_data)

  # Créer le graphique
  plot <- ggplot(accidents_data, aes(x = group, y = number_of_accidents)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE) +
    geom_text(aes(label = paste("y =", round(coef(model)[1], 2), "+", round(coef(model)[2], 2), "x")), x = Inf, y = -Inf, hjust = 1, vjust = 0, size = 4) +
    geom_abline(intercept = coef(model)[1], slope = coef(model)[2], color = "red") +
    labs(x = ifelse(by == 'month', "Mois", "Semaine"),
         y = "Nombre d'accidents",
         title = paste("Régression linéaire du nombre d'accidents par", by))

  # Sauvegarder le graphique en fichier PDF
  ggsave(paste("Big Data/plots/", name, ".pdf", sep = ""), plot, width = 8, height = 6)
}
