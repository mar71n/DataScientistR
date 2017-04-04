# Unidad 3

# Analisis exploratorio

library(datasets)
data(iris)

str(iris)

ls(all.names=TRUE)
names(iris)
str(iris[["Species"]])
attributes(iris[["Species"]])
str(attributes(iris[["Species"]])$levels)
class(attributes(iris[["Species"]])$levels)
attributes(iris[["Species"]])$levels

class(iris)
nrow(iris)
ncol(iris)
names(iris)

class(iris[["Sepal.Length"]])
range(iris[["Sepal.Length"]])

table(iris[["Species"]])
table(iris[["Sepal.Length"]])

head(iris)
attach(iris)

# Analissi estadistico

median(iris[["Sepal.Length"]])

mean(iris[["Sepal.Length"]])

sd(iris[["Sepal.Length"]])

summary(iris)

hist(iris$Sepal.Length,breaks=20)

qqnorm(iris$Sepal.Length)

boxplot(Petal.Length ~ Species , data = iris, ylab="Petal.Length", varwith=TRUE)

plot(Petal.Length ~ Sepal.Length, data = iris, col = "red")

pairs(iris)

# Distribuciones

pnorm(27.4, mean=50, sd=20)

?pnorm

plot(function(x) pnorm(x, log.p = TRUE), -50, 10, main = "log { Normal Cumulative }")
plot(function(x) dnorm(x, mean=50, sd=30), -50, 150, main = "dnorm")
plot(function(x) pnorm(x, mean=50, sd=30), -50, 150, main = "pnorm")
