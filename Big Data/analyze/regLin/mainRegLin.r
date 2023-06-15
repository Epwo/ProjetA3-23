source("Big Data/analyze/regLin/RegLinMois.r")
finalData <- read.csv("Big Data/csvOutputNum.csv")
m1 <- printRegLin(finalData,name='regLinMonth',by='month')
m2 <- printRegLin(finalData,name='regLinWeek',by='week')

# calcul le R² en utilisant la fonction summary()
print(paste("modele 1 au mois : R² = ",summary(m1)$r.squared," |résidus = ",1 - summary(m1)$r.squared,"| variabilité = ",1 - (1 - summary(m1)$r.squared)))
print(paste("modele 2 a la sem : R² = ",summary(m2)$r.squared," |résidus = ",1 - summary(m2)$r.squared,"| variabilité = ",1 - (1 - summary(m2)$r.squared)))

# la proportion de la variabilité due aux résidus
# la proportion de la variabilité due aux variables explicatives
print("--")

print(paste("erreurs type m1 = ",paste(summary(m1)$coefficients[, "Std. Error"], collapse = ',')))
print(paste("erreurs type m2 = ",paste(summary(m2)$coefficients[, "Std. Error"], collapse = ',')))

print("--")
print(paste("m1 >IC a 95% :",paste(confint(m1, level = 0.95),collapse = ', ')))
print(paste("m2 >IC a 95% :",paste(confint(m2, level = 0.95),collapse = ', ')))