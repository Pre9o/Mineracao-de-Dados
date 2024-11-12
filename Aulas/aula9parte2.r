library(ggplot2)

my_file = read.csv("CSVs/GeyserUFSM.csv", header = TRUE)

trainIndices = sample(nrow(my_file), as.integer(nrow(my_file) * 0.7))

trainFaith = my_file[trainIndices,]
testFaith = my_file[-trainIndices,]

head(my_file)

modelLinear = lm(erupcao ~ espera, data = trainFaith)

summary(modelLinear)

predict(modelLinear, data.frame(espera = c(200, 230, 245, 270)))

plot(trainFaith$espera, trainFaith$erupcao)
lines(trainFaith$espera, predict(modelLinear), col = "blue")

trainFaith$espera_cat <- cut(trainFaith$espera, breaks = 4, labels = c("Baixa", "Média", "Alta", "Muito Alta"))

qplot(espera, erupcao,
    data = trainFaith,
    color = espera,
    shape = espera_cat,
    geom = c("point", "smooth"),
    xlab = "Espera",
    ylab = "Erupção",
    main = "Modelo de Regressão")