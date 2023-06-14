source("Big Data\\prepare\\preparation\\catVehic.R")
data <- read.csv("Big Data\\csvOutTrait.csv", sep = ";")
final_data <- data
final_data <- PrepCatVeh(data,final_data)
print(nrow(final_data))
write.csv(final_data,"Big Data\\tempcsv.csv",row.names=FALSE)