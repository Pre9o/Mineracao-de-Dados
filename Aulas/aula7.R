a <- c(1,1,0,0,1,1,0,1)
b <- c(0,1,0,1,1,0,0,0)
c <- c(0,1,1,0,1,1,1,0)
goal <- c(1,0,1,0,1,1,1,1)

(library(arules))

data <- data.frame(a,b,c,goal)

for (i in 1:ncol(data)) {
  data[,i] <- as.factor(data[,i])
}

rules <- apriori(data)

subrules <- subset(rules, rhs %in% "goal=1")
inspect(subrules)

# calcular a conviccao e a influencia entre a e goal
AintersectionGoal <- subset(data, a==1 & goal==1)
suportAeGoal <- nrow(AintersectionGoal)/nrow(data)

suportA = sum(data$a==1)/nrow(data)

suportGoal = sum(data$goal==1)/nrow(data)
suportNotGoal = sum(data$goal==0)/nrow(data)

suportAeNotGoal <- sum(data$a==1 & data$goal==0)/nrow(data)

conviction <- suportA * suportNotGoal / suportAeNotGoal

leverage = suportAeGoal - suportA * suportGoal

confidence = suportAeGoal / suportA

m = interestMeasure(rules, c("conviction", "leverage", "confidence"))
m

# como posso percorrer toda o conjunto de regras e calcular a conviccao e a influencia entre cada uma das variaveis e a variavel goal?














