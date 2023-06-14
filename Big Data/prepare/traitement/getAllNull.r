data <- read.csv("Big Data\\csvOutput.csv",sep=";")
#isnumeric()
printNull <- function() {
    for (col_name in colnames(data)) {
        sousDF <- subset(data, is.nu(data[[col_name]]))
        if(nrow(sousDF) > 0){
            print(col_name)
            print(nrow(sousDF))
            print('--')
        }
    }
}
printMinors <- function() {
    sousDF <- subset(data, as.numeric(data$age) < 16 & data$descr_grav == "Tué")
    sousDF$age <- (as.numeric(sousDF$age) - 14)
    write.csv(sousDF,"Big Data\\tempcsv.csv",row.names=FALSE)
}
printQuartier <- function() {
    #on selectionne toutes les villes qui ont des arrondissements
    sousDF <- subset(data, grepl("\\d+$", data$ville))
    write.csv(sousDF,"Big Data\\tempcsv.csv",row.names=FALSE)
}

AnormalValuesGeo <- function(){
     #check if point is outside france métropolitaine
     #j'ai choisi un carré de coords arbitraire
    squareFR <- matrix(c(39.732580, -10.058320,
                    40.295298, 10.602378,
                    51.944631, 10.337874,
                    50.900084, -7.060609),
                    ncol = 2,
                    byrow = TRUE)

    # Print the matrix
    print(squareFR)
}

#for (i in seq_along(sousDF$ville)) {
        #on definit ville comme nom de la ville
 #   ville <- sousDF$ville[i]
    #if(!(isInsideFRsquare(sousDF$latitude[i],sousDF$longitude[i]))){
     #   print(ville)
    #}
#}

printNull()
