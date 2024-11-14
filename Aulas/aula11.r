acoes = read.csv("CSVs/acoes_close2019.csv", header = TRUE)

acoes = t(as.matrix(acoes))

# head(acoes)

acoes.cor <- as.dist(1 - cor(t(acoes)))

HC_acoes.cor <- hclust(acoes.cor, method = "complete", members = NULL)

plot(HC_acoes.cor, ylab = "Altura", xlab = "Grupo de Ações",
     main = "Dendrograma de Ações")