PrepFormat <- function(dataInput){
    for (i in seq_along(dataInput$date)){
        #allDate <- dataInput$date[i]
        #dataInput$date[i] <- as.Date(allDate,format = "%H %d/%m/%Y")
        eachCodInsee <- dataInput$id_code_insee[i]
        dataInput$id_code_insee[i] <- as.numeric(eachCodInsee)

    }
    print(typeof(dataInput$id_code_insee))
    return(dataInput)
    
}
#print(typeof(data$date))
finalData <- read.csv("Big Data\\csvOutTrait.csv", sep = ",")
PrepFormat(finalData)