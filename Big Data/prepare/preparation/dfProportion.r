listall <- list(
  list(region = "Auvergne-Rhône-Alpes", nbHab = 8153712),
  list(region = "Bourgogne-Franche-Comté", nbHab = 2787615),
  list(region = "Bretagne", nbHab = 3399434),
  list(region = "Centre-Val de Loire", nbHab = 2596149),
  list(region = "Corse", nbHab = 342080),
  list(region = "Grand Est", nbHab = 5591970),
  list(region = "Hauts-de-France", nbHab = 6066835),
  list(region = "Île-de-France", nbHab = 12278257),
  list(region = "Normandie", nbHab = 3378957),
  list(region = "Nouvelle-Aquitaine", nbHab = 6081818),
  list(region = "Occitanie", nbHab = 6016287),
  list(region = "Pays de la Loire", nbHab = 3930665),
  list(region = "Provence-Alpes-Côte d'Azur", nbHab = 5129282),
  list(region = "Guadeloupe", nbHab = 400170),
  list(region = "Martinique", nbHab = 371246),
  list(region = "Guyane", nbHab = 294071),
  list(region = "La Réunion", nbHab = 865826)
)

data <- read.csv("Big Data/csvOutput.csv", sep = ",")

counts <- aggregate(descr_grav ~ region, data, FUN = sum)

# Rename the columns
colnames(counts) <- c("region", "PonderationVal")
counts_dict <- setNames(counts$PonderationVal, counts$region)

print(nrow(counts_dict))
print(length(listall))

print(counts_dict)

df <- data.frame(
  region = character(),
  nb_accidents = integer(),
  nb_habitants = integer(),
  nb_accidents_ratio100k = numeric()
)

for(elt in listall){
    nbAcc <- as.numeric(counts_dict[elt$region])
    df <- rbind(df, data.frame(
        region = elt$region,
        #on va ponderer le nb d'accidents par la gravite
        nb_accidents_pondere = nbAcc,
        nb_habitants = elt$nbHab,
        nb_accidents_ratio100k = round((nbAcc/elt$nbHab)*100000,3)
    ))
    
}

print(df)

write.csv(df, "Big Data/gravite100k.csv", sep = ";")


