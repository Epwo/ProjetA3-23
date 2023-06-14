source("Big Data/analyze/regLin/RegLinMois.r")
finalData <- read.csv("Big Data/csvOutputNum.csv")
printRegLinMonth(finalData,name='regLinMonth',by='month')
printRegLinMonth(finalData,name='regLinWeek',by='week')