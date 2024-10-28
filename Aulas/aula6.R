a <- c(1,1,0,0,1)
b <- c(0,1,0,1,1)
c <- c(0,1,1,0,1)
goal <- c(1,0,1,0,1)

myDF

myDF = cbind(a,b,c,goal)

library(arules)
library(arulesViz)
rules <- apriori(myDF)
inspect(rules)


getwd()


myDF = read.csv("GitHub/Mineracao-de-Dados/_ASSOC00.csv", header = TRUE)
myDF = myDF[,-1]

for(i in 1:ncol(myDF)){
  myDF[,i] = as.factor(myDF[,i])
}

rules <- apriori(myDF, parameter = list(support = 0.3, confidence = 0.6))
inspect(rules)

subset1 = subset(rules, (lhs %in% "Carvao=1") & (rhs %in% "Carne=1"))
inspect(subset1)

plot(rules, method = "grouped")
