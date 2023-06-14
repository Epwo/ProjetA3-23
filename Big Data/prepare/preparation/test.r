
data <- read.csv("Big Data\\tempcsv.csv", sep = ",")

for (i in seq_along(data$descr_cat_veh)) {
        #on definit ville comme nom de la ville
    element <- data$descr_cat_veh[i]
    if(element == "NULL"){
        print(element)
    }
}
print(unique(data()))