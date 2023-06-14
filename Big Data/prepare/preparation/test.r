

printNull <- function(data) {
    for (col_name in list("date","id_code_insee","place")) {
    sousDF <- subset(data, (is.na(data[[col_name]])) )
    if (nrow(sousDF) > 0) {
        print(col_name)
        print(typeof(data[[col_name]]))
        print(nrow(sousDF))
        print('--')
    }
    }
}

data <- read.csv("Big Data\\csvOutput.csv", sep = ",", stringsAsFactors = FALSE)
printNull(data)