x = sample(40)
plot(x, ylim = c(0, 60), ylab="valores")
text(2, 56, paste('minimo: ', summary(x)[1]))
text(8, 56, paste('1 quartil: ', summary(x)[2]))
text(14, 56, paste('mediana: ', summary(x)[3]))
text(22, 56, paste('media: ', summary(x)[4]))
text(32, 56, paste('3 quartil: ', summary(x)[5]))
text(36, 56, paste('max: ', summary(x)[6]))
summary(x)


data(mtcars) 
carros = mtcars[,c(2, 4, 6)]
boxplot(hp~cyl, data = carros, xlab = "Cilindros", ylab = "Cavalos de potencia")


y = sample(30)
x = seq(as.Date("2020-07-01"), as.Date("2020-07-30"), by = "days")
plot(x, y, type = "l", xlab = "Data", ylab = "Valores", main = "Valores ao longo do tempo")


library(ggplot2)
df = data.frame(x = x, y = y)
ggplot(df, aes(x = x, y = y)) + geom_line() + xlab("Data") + ylab("Valores") + ggtitle("Valores ao longo do tempo")


setwd("C:/Users/naoca/Documents/github/mineracao-de-dados")
getwd()
file.exists("aula3.R")
file.create("teste.r")


arqUrl <- "http://www-usr.inf.ufsm.br/~joaquim/UFSM/DM/ds/usr_data.csv"
download.file(arqUrl, destfile="./test.csv")
data = read.csv("test.csv")
head(data)


