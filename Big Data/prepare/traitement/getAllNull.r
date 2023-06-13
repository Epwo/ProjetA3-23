data <- read.csv("Big Data\\csvSource.csv",sep=";")
#isnumeric()
for (col_name in colnames(data)) {
    sousDF <- subset(data, data[[col_name]] == "NULL")
    if(nrow(sousDF) > 0){
        print(col_name)
        print(nrow(sousDF))
        print('--')
    }
}



