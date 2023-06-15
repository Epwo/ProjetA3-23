MethChi2 <- function(dataInput){
    #création du tableau de contingence
    TableauContingence <-table(dataInput$latitude, dataInput$age)
    # on effectue le test du chi2 sur ce tableau
    result <- chisq.test(TableauContingence)
    return(result)
}
finalData <- read.csv("Big Data\\csvOutput.csv", sep = ",", stringsAsFactors = FALSE)
finalData <- MethChi2(finalData)
print(finalData)


