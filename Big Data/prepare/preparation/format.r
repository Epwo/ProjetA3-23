PrepFormat <- function(dataInput) {
  #on utilise la fonction as.POSIXct au lieu de as.numeric pour garder l'heure
  dataInput$date <- as.POSIXct(dataInput$date, format = "%Y-%m-%d %H:%M:%S", na.rm = TRUE)
  #dataInput$id_code_insee <- as.integer(dataInput$id_code_insee, na.rm = TRUE)
  dataInput <- dataInput[complete.cases(dataInput), ]
  return(dataInput)
}

