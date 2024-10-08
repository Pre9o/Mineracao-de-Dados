#ler csv de uma url
url = "https://www-usr.inf.ufsm.br/~joaquim/UFSM/DM/ds/LD00c.csv"
dados = read.csv(url)
head(dados)

library(ggplot2)

precipitacao = dados$Precipitacao
tempMaxima = dados$TempMaxima
tempMinima = dados$TempMinima
insolacao = dados$Insolacao
evaporacaoPiche = dados$Evaporacao.Piche
tempCompMedia = dados$Temp.Comp.Media
umidadeRelativaMedia = dados$Umidade.Relativa.Media
velocidadedoVentoMedia = dados$Velocidade.do.Vento.Media

summary(dados);

