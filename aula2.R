nomes = c("steve", "bill", "martin")
literatura = c(8.5, 9, 10)
matematica = c(9, 9.5, 7)

DF1 = data.frame(cbind(nomes, literatura, matematica))
DF1


disciplinas = c("literatura", "matematica")
steve = c(8.5, 9)
bill = c(9, 9.5)
martin = c(10, 7)

DF2 = data.frame(cbind(disciplinas, steve, bill, martin))
DF2


nomes_ = c("steve", "steve", "bill", "bill", "martin", "martin")
disciplinas_ = c("literatura", "matematica", "literatura", "matematica", "literatura", "matematica")
notas = c(8.5, 9, 9, 9.5, 10, 7)

DF3 = data.frame(cbind(nomes_, disciplinas_, notas))
DF3

#install.packages("tidyr")
library(tidyr)

DF3_ = gather(DF1, disciplinas, nota, -nomes)
DF3_
