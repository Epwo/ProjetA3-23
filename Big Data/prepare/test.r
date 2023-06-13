data <- read.csv("Big Data\\csvSource.csv", sep = ";")
new_database <- read.csv("Big Data\\csvSource.csv", sep = ";")

print(unique(new_database["descr_grav"]))