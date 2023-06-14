MethChi2 <- function(dataInput){
    #data$variable_ <- as.character(data$variable_int)
    #categories <- cut(dataInput$descr_cat_veh, breaks = c(0, 2, 4, 7))
    TableauContingence <-table(dataInput$latitude, dataInput$age)
    result <- chisq.test(TableauContingence)
    return(result)
}
finalData <- read.csv("Big Data\\csvOutput.csv", sep = ",", stringsAsFactors = FALSE)
finalData <- MethChi2(finalData)
print(finalData)
#TableauContingence <-table(dataInput$descr_cat_veh, dataInput$descr_grav)

