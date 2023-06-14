PrepFormat <- function(dataInput){
    for (i in seq_along(dataInput$date)){
        allDate <- dataInput$date[i]
        dataInput$date[i] <- as.Date(allDate,format = "%d/%m/%Y")
    }
    print(typeof(dataInput$date))
    return(dataInput)
    
}
#print(typeof(data$date))
finalData <- read.csv("Big Data\\csvOutTrait.csv", sep = ",")
PrepFormat(finalData)