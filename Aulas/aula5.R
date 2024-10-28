url = "https://www-usr.inf.ufsm.br/~joaquim/UFSM/DM/ds/DimR00.csv"
dados = read.csv(url)

plot(dados$X, dados$x, col=dados$X, pch=19)

dados_2 = dados[,-1]

dados_finais = as.integer(dados_2)

length(unique(dados_finais))

lines(dados_finais, col="red")

dados_matrix = matrix(dados_finais, nrow=8, ncol=8)

dados_matrix








conta = 0 
myMat = matrix(nrow=10, ncol=10)

for(i in 1:10)
  for(j in 1:10){
    if(i == j){
      conta = conta + 1
      myMat[i, j] = conta
    } else{
      myMat[i, j] = 0
    }
  }


# transformar os valores unicos da matriz em vetor
vetor = as.vector(myMat)
vetor = unique(vetor)
vetor = order(vetor, decreasing = FALSE)





url = "https://www-usr.inf.ufsm.br/~joaquim/UFSM/DM/ds/z.csv"
z = read.csv(url)





