data(faithful)
head(faithful)

trainIndices = sample(nrow(faithful), as.integer(nrow(faithful) * 0.7))

trainFaith = faithful[trainIndices,]
testFaith = faithful[-trainIndices,]

modelLinear = lm(eruptions ~ waiting, data = trainFaith)

summary(modelLinear)

predict(modelLinear, data.frame(waiting = c(23, 32, 55, 66)))

plot(trainFaith$waiting, trainFaith$eruptions)
lines(trainFaith$waiting, predict(modelLinear), col = "red")