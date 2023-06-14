library(ggplot2)

tableau_croise <- function(df, var1, var2, outputName) {
  # Calcul du tableau croisé
  table <- table(df[[var1]], df[[var2]])

  # Conversion du tableau croisé en un dataframe
  df_table <- as.data.frame(table)

  # Renommer les colonnes du dataframe
  colnames(df_table) <- c(var1, var2, "count")

  # Création du graphique à barres
  plot <- ggplot(df_table, aes_string(x = var1, y = "count", fill = var2)) +
    geom_bar(stat = "identity", position = "stack")

  # Sauvegarde du graphique dans un fichier PDF
  path <- paste("Big Data/plots/", outputName, ".pdf", sep = '')
  ggsave(path, plot)

  return(table)
}
