install.packages("dtw")

library(dtw)

acoesdtw <- read.csv("CSVs/acoes_close2019.csv")

acoesdtw <- t(as.matrix(acoesdtw))

acoesdtw.dtw <- dist(acoesdtw, method = "DTW")

acoesdtw.hc <- hclust(acoesdtw.dtw, method = "complete")

plot(acoesdtw.hc, ylab = "Altura", xlab = "Grupo de Ações",
     main = "Dendrograma de Ações (DTW)")