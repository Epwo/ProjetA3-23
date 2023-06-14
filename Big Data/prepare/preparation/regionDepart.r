library(datasets)
regiondepartement <- function(dataInput){
    data$region <- state.name[as.numeric(substr(data$id_code_insee, 1, 2))]

# Afficher les départements correspondants au code INSEE
data$departement <- state.name[as.numeric(substr(data$id_code_insee, 1, 2)) * 100 + as.numeric(substr(data$id_code_insee, 3, 3))]
return(dataInput)
}
