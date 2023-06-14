PrepFormat <- function(dataInput) {
    dataInput$date <- as.POSIXct(dataInput$date, format = "%Y-%m-%d %H:%M:%S")
    dataInput$id_code_insee <- as.integer(dataInput$id_code_insee)
  return(dataInput)
}

#print(typeof(data$date))
finalData <- read.csv("Big Data\\csvOutTrait.csv", sep = ",", stringsAsFactors = FALSE)
finalData <- PrepFormat(finalData)
print(typeof(finalData$date[4]))
print(typeof(finalData$id_code_insee[4]))
print(finalData$date[4])
write.csv(finalData,"Big Data\\temp.csv",row.names=FALSE)

