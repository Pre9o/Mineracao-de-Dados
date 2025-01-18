#Crie um dataframe com as operações lógicas com quatro variáveis binárias (v1, v2, v3) 
#contendo todas as combinações possíveis, exceto (1,0,1), 
#adicione como classe a operação lógica: v1 e v2 ou v3. 
#Crie uma rede neural Adaline para testar sua operação lógica. 
#Teste a entrada faltante.

library(neuralnet)


var1 <- c(1,1,1,0,0,0,0)
var2 <- c(1,1,0,1,1,0,0)
var3 <- c(1,0,0,1,0,1,0)
class <-c(1,1,0,1,0,1,0)  #(v1 e v2) ou v3


dados <- data.frame(var1,var2,var3,class)


NN = neuralnet(class ~ ., data=dados, hidden=c(3, 4))
plot(NN)

dadosDeEntrada <- data.frame(var1 = 1, var2 = 0, var3 = 1)

previsao <- compute(NN, dadosDeEntrada)
previsao$net.result