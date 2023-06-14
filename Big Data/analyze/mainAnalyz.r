source("Big Data/analyze/TabCrois.r")


data <- read.csv("Big Data/csvOutput.csv", sep = ",", stringsAsFactors = FALSE)

resultat <- tableau_croise(data, "descr_dispo_secu", "descr_grav")
print(resultat)