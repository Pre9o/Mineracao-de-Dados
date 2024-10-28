a = c(3, 5, 6, 7, 9, 14, 16, 16, NA, 27, 34, 50, 61)
b = c(10, 9, 10, 11, 8, 11, 10, 12, NA, 11, 10, 8, 10)
c = c(0, 2, 3, 0, 4, 2, 0, 6, 2, 0, 4, 5, NA, 3, 4, NA, 5)

library(ggplot2)

a1 = a

a1[!complete.cases(a1)] = mean(a1, na.rm = TRUE)
print(a1)

a1 = a

index = which(is.na(a1))
a1[index] = (a1[index - 1] + a1[index + 1]) / 2
print(a1)

a1 = a

myfit = lm(a1 ~ c(1:length(a1)))
x = 1:length(a)
qplot(x, a1) + geom_smooth(method = "lm", se = FALSE)





b1 = b

b1[!complete.cases(b1)] <- mean(b1, na.rm = TRUE)
print(b1)

b1 = b

myfit = lm(b1 ~ c(1:length(b1)))
x = 1:length(b)
qplot(x, b1) + geom_smooth(method = "lm", se = FALSE)





c1 = c

c1[!complete.cases(c1)] <- mean(c1, na.rm = TRUE)
print(c1)

c1 = c

myfit = lm(c1 ~ c(1:length(c1)))
y = 1:length(c)
qplot(y, c1) + geom_smooth(method = "lm", se = FALSE)
