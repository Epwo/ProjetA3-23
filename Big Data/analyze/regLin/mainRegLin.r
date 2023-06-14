source("Big Data/analyze/regLin/RegLinMois.r")
finalData <- read.csv("Big Data/csvOutputNum.csv")
printRegLinMonth(finalData,name='regLinMonth')