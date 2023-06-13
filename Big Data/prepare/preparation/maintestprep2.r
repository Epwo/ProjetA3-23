source("Big Data\\prepare\\preparation\\catVehic.R")
data <- read.csv("Big Data\\csvSource.csv", sep = ";")
finalData <- data
final_data <- PrepCatVeh(data,final_data)
print(nrow(final_data))
write.csv(final_data,"Big Data\\tempcsv.csv",row.names=FALSE)