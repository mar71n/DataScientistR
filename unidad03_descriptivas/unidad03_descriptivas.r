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
length(iris[["Sepal.Length"]])

nlevels(iris[,"Species"])
nlevels(iris$Species)
levels(iris$Species)

# los levels se muestran aunque no existan casos?
# puede haber levels para los que existan casos
# Create a factor with an extra level (gamma)
x <- factor(c("alpha","beta","alpha"), levels=c("alpha","beta","gamma"))
x
#> [1] alpha beta  alpha
#> Levels: alpha beta gamma
table(x)
# alpha  beta gamma
#     2     1     0
nlevels(x)
# [1] 3
# Remove the extra level
x <- factor(x)
x
#> [1] alpha beta  alpha
#> Levels: alpha beta

table(iris[["Species"]])
table(iris[["Sepal.Length"]])

head(iris)
attach(iris)

# Analissi estadistico

median(iris[["Sepal.Length"]])
?median
median(1:4)
median(c(1:4,100,1000))

# mean(x, trim = 0, na.rm = FALSE, ...)
mean(iris[["Sepal.Length"]])
?mean
x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))

# trim va de 0 a 0.5 indica que porcentage se recorta tanto de head como de tail
# trim 0.01 en 100 observaciones quita la primera y la última
x <- seq(0.1,10,0.1)
str(x)
mean(log(x))
x01 <- x[2:99]
x01
mean(log(x01))
mean(log(x), trim = 0.01)
# trim 0.1 en 100 observaciones quita las 10 primeras y las 10 últimas
x10 <- x[11:90]
x10
mean(log(x10))
mean(log(x), trim = 0.1)

# sd
sd(iris[["Sepal.Length"]])
?sd
sd(1:2) ^ 2

summary(iris)

hist(iris$Sepal.Length,breaks=20)
hist(iris$Sepal.Length,breaks=10)
hist(iris$Sepal.Length,breaks=30)

qqnorm(iris$Sepal.Length)

boxplot(Petal.Length ~ Species , data = iris, ylab="Petal.Length", varwith=TRUE)

plot(Petal.Length ~ Sepal.Length, data = iris, col = "red")

pairs(iris)

# Distribuciones

pnorm(27.4, mean=50, sd=20)
pnorm(50, mean=50, sd=20)
# [1] 0.5

?pnorm

plot(function(x) pnorm(x, log.p = TRUE), -50, 10, main = "log { Normal Cumulative }")
plot(function(x) dnorm(x, mean=50, sd=30), -50, 150, main = "dnorm")
plot(function(x) pnorm(x, mean=50, sd=30), -50, 150, main = "pnorm")

plot(function(x) dnorm(x, mean=50, sd=30), -50, 150, main = "dnorm")
lines(c(27.4, 0))

# Introduccion a la regresion lineal

# install.packages("UsingR")
library(UsingR)

data(diamond)
head(diamond)
summary(diamond)
plot(diamond$carat, diamond$price, xlab = "carats", ylab = "price", 
                                   bg = "lightblue", col = "black",
                                   cex = 1.1, pch = 21, frame = FALSE)

lm(price ~ carat, data = diamond)
plot(diamond$carat, diamond$price, xlab = "carats", ylab = "price", 
                                   bg = "lightblue", col = "black",
                                   cex = 1.1, pch = 21, frame = FALSE)
abline(lm(price ~ carat, data = diamond),lwd=2)

# el operador I 
?I
class(diamond$carat)
class(I(diamond$carat - mean(diamond$carat)))
class(diamond$carat - mean(diamond$carat))

fit2 <- lm(price ~ I(carat - mean(carat)), data = diamond)
coef(fit2)

x <- diamond$carat - mean(diamond$carat)
fit2 <- lm(price ~ x, data = diamond)
coef(fit2)

fit <- lm(price ~ carat, data = diamond)
coef(fit)

newx <- c(0.16, 0.27, 0.34)
coef(fit)[1] + coef(fit)[2] * newx

predict(fit, newdata = data.frame(carat=newx))

str(fit)

# Introduccion a clustering

newiris <- iris
newiris$Species <- NULL
head(newiris)

kc <- kmeans(newiris, 3)
class(kc)
plot(newiris[c("Sepal.Length", "Sepal.Width")], col=kc$cluster)
points(kc$centers[,c("Sepal.Length", "Sepal.Width")], col=1:3, pch=8, cex=2)