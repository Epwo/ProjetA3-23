#il faut créer un dictionnaire qui transforme le code département ( insee ), en sa valeur
#fort heuresement pour moi, j'ai trouvé sur internet un dict déja fait

obtenirRegionEtDepartement <- function(codeINSEE) {
  source("Big Data/prepare/preparation/dataDep.r")
  dictionnaireDepartements <- creerDictionnaireDepartements()  # Utilisez le dictionnaire des départements précédemment défini
  if (codeINSEE %in% names(dictionnaireDepartements)) {
    departement <- dictionnaireDepartements[[codeINSEE]][1]
    region <- dictionnaireDepartements[[codeINSEE]][2]
    return(list(region = region, departement = departement))
  } else {
    return(NULL)  # Retourne NULL si le code INSEE n'est pas trouvé dans le dictionnaire
  }
}

returnDfRegDep <- function(df){
  library(dplyr)
  
  #on crée la colonne vide
  df$region <- NA
  df$departement <- NA
  #on se deplace dans la df
  for (i in seq_len(nrow(df))) {
    print(i)
    #on essaie avec le code insee (a 2 premiers chiffres) tq XXYYY
    code_insee <- substr(df$id_code_insee[i], 0, 2)
    resultat <- obtenirRegionEtDepartement(as.character(code_insee))
    if(length(resultat$region) == 0){
      #si on rencontre une erreur == pas de correspondance dans le tab
      #on recommence avec 3 premiers chiffres -> domtom      
      code_insee <- substr(df$id_code_insee[i], 0, 3)
      resultat <- obtenirRegionEtDepartement(as.character(code_insee))
    }
    #on écrit les valeurs dans les nouvelles olonnes
    df$region[i] <- resultat$region
    df$departement[i] <- resultat$departement
  }
  return(df)
}