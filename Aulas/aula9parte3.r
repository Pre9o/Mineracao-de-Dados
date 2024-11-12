library(ggplot2)

data(mtcars)
head(mtcars)

mtcars$kpl = mtcars$mpg * 0.425144
mtcars$peso = mtcars$wt * 0.453592

cambio = factor(mtcars$am, levels = c(0, 1), labels = c("manual", "automatico"))

trainIndex = sample(nrow(mtcars), as.integer(nrow(mtcars) * 0.7))

trainCars = mtcars[trainIndex,]
testCars <- mtcars[-trainIndex,]

modelLinear <- lm(peso ~ kpl, data = mtcars)

summary(modelLinear)

qplot(peso, kpl,
    data = modelLinear,
    color = cambio, 
    shape = cambio,
    geom = c("point", "smooth"),
    xlab = "Peso",
    ylab = "Quilometros por litro",
    main = "Modelo de regressao")