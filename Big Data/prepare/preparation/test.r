

printNull <- function(data) {
    sousDF <- subset(data, (data[['region']] == "Mayotte") )
    if (nrow(sousDF) > 0) {

        print(nrow(sousDF))
        print('--')
    }
    
}

data <- read.csv("Big Data\\csvOutput.csv", sep = ",", stringsAsFactors = FALSE)
print(typeof(data$id_code_insee))
printNull(data)