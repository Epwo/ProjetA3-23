MethChi2 <- function(dataInput){
    TableauContingence <-table(dataInput$descr_cat_veh, dataInput$descr_grav)
    result <- chisq.test(TableauContingence)
    return(result)


}
finalData <- read.csv("Big Data\\csvOutput.csv", sep = ",", stringsAsFactors = FALSE)
finalData <- MethChi2(finalData)
print(finalData)
