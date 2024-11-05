library(ggplot2)
library(rpart)
library(rpart.plot)

data(msleep)

df <- msleep

subset = subset(df, select = c(order, sleep_total, sleep_cycle, awake, brainwt))


model <- rpart(sleep_total ~ ., data = subset)

print(model)

rpart.plot(model)