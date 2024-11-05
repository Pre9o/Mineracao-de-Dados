library(arules)

file <- read.csv("./Trabalhos/data_extra_04.csv")

last_10_columns <- file[, (ncol(file)-9):ncol(file)]

last_10_columns[] <- lapply(last_10_columns, as.factor)

trans <- as(last_10_columns, "transactions")

rules <- apriori(trans, parameter = list(supp = 0.8, conf = 0.8))

subset <- subset(rules, subset(rules, size(lhs(rules)) > 0))

inspect(rules)

inspect(subset)