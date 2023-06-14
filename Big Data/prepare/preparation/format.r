PrepFormat <- function(dataInput){
    for (i in seq_along(dataInput$date)){
        allDate <- dataInput$date[i]
        dataInput$date[i] <- as.Date(allDate,format = "%Y-%m-%d %H:%M:%S")
        eachCodInsee <- dataInput$id_code_insee[i]
        dataInput$id_code_insee[i] <- as.integer(eachCodInsee)

    }
    return(dataInput)
    
}
#print(typeof(data$date))
finalData <- read.csv("Big Data\\csvOutTrait.csv", sep = ",")
finalData <- PrepFormat(finalData)
print(typeof(finalData$date))
print(typeof(finalData$id_code_insee))
write.csv(finalData,"Big Data\\temp.csv",row.names=FALSE)

