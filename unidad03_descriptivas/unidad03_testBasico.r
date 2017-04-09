## Test Basico

# Ejercicio 1.2.1

?sample
sample(1:6,20,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))

x <- sample(1:6,40,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
x
tx <- table(x)
tx
plot(table(x),type="h")
barplot(tx, main="40 tiradas")

p <- function(x){x/tx[x]}
p(5)

p1 <- function(k){
  x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
  tx <- table(x)
  tx[1]/k
}

?vapply
p1(30)
res <- vapply(list(10,20,30,40,80,160,1000,2000,10000),p1,c(1))
names(res) <- c(10,20,30,40,80,160,1000,2000,10000)
plot(res,type="h")
barplot(res, main="P(1) para x tiradas")  

# Ejercicio 1.2.2

sample(c(0,1),20,replace=TRUE,prob=c(0.5,0.5))
k <- 100
moneda_p1 <- function(k){
  x <- sample(c(0,1),k,replace=TRUE,prob=c(0.5,0.5))
  tx <- table(x)
  tx[1]/k
}

moneda_p1(30)
res <- vapply(list(10,20,30,40,80,160,1000,2000,10000),moneda_p1,c(1))
names(res) <- c(10,20,30,40,80,160,1000,2000,10000)
plot(res,type="h")
barplot(res, main="P(cara) en x tiradas")

## Promedio

# Ejercicio 1.2.3
k <- 100
x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
x
sum(x)
length(x)
mean(x)

promedio <- function(k){
  x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
  mean(x)
}

promedio (10)
promedios <- vapply(list(10,20,30,40,80,160,1000,2000,10000),promedio,c(1))
names(promedios) <- c(10,20,30,40,80,160,1000,2000,10000)
promedios

plot(promedios, type="h")
barplot(promedios, col=c("lightblue1","lightblue2"), main="Promedio resultado dados\n en x tiradas")

# Ejercicio 1.2.6

?sd
k <- 100
x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
x
sum(x)
length(x)
mean(x)
sd(x)

desviostd <- function(k){
  x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
  sd(x)
}

desvios <- vapply(list(10,20,30,40,80,160,1000,2000,10000),desviostd,c(1))
names(desvios) <- c(10,20,30,40,80,160,1000,2000,10000)
desvios

barplot(desvios, ylim=c(0,2), main="desvio estandar\n para x tiradas")

## Distribuciones

# Ejercicio 1.2.7

k <- 10
x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
tx <- table(x)

barplot(tx)

enetiradas <- function(n){
  x <- sample(1:6,n,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
  table(x)
}

par(mfrow=c(2,3))
barplot(enetiradas(10), main="10")
barplot(enetiradas(20), main="20")
barplot(enetiradas(40), main="40")
barplot(enetiradas(80), main="80")
barplot(enetiradas(2000), main="2000")
barplot(enetiradas(10000), main="10000")
par(mfrow=c(1,1))

library(datasets)
data(iris)
length(iris$Petal.Length)
barplot(iris$Petal.Length)
par(mfrow=c(3,1))
barplot(iris$Petal.Length[1:50])
barplot(iris$Petal.Length[51:100])
barplot(iris$Petal.Length[101:150])
par(mfrow=c(1,1))

hist(iris$Petal.Length)
hist(iris[iris$Species=="setosa",]$Petal.Length,breaks=seq(0,3,0.05))
hist(iris$Petal.Length,breaks=seq(0,8,0.7))
hist(iris$Petal.Length,breaks=seq(0,8,0.1))

# ajusto Petal.Length para la Specie Setosa con dnorm
# le paso a dnorm los parametros mean y sd de los datos
mean(iris[iris$Species=="setosa","Petal.Length"])
sd(iris[iris$Species=="setosa","Petal.Length"])
# dnorm(x, mean=1.462, sd=0.173664)
par(mfrow=c(2,1))
hist(iris[iris$Species=="setosa",]$Petal.Length,breaks=seq(0.5,2.5,0.05), main="setosa Petal.Length\n mean=1.462 sd=0.173664")
plot(function(x) dnorm(x, mean=1.462, sd=0.173664), 0.5, 2.5, main = "dnorm(x, mean=1.462, sd=0.173664)",ylab="")
par(mfrow=c(1,1))

## Inferencia estadistica

sample(c(0,1),10,replace=TRUE,prob=c(0.75,0.25))
# [1] 1 1 0 1 1 1 1 0 0 0
# que probabilidad hay de este resultado si la moneda esta equilibrada
dbinom(6,10,0.5)
dbinom(4,10,0.5)

#  [1] 1 0 1 1 0 0 0 0 0 0
dbinom(3,10,0.5)

# [1] 0 0 0 0 0 0 0 0 1 0
dbinom(1,10,0.5)

x <- sample(c(0,1),20,replace=TRUE,prob=c(0.75,0.25))
tx <- table(x)
dbinom(tx[1],20,0.5)

x <- sample(c(0,1),100,replace=TRUE,prob=c(0.75,0.25))
tx <- table(x)
dbinom(tx[1],100,0.5)

# probabilidad de x si H0 en n tiradas
moneda <- function(n){
  x <- sample(c(0,1),n,replace=TRUE,prob=c(0.75,0.25))
  tx <- table(x)
  dbinom(tx[1],n,0.5) * 100
}

# veces que acepto H0 (sindo H1 por def de la funcion) con 95% de nivel de confianza
# en 20 rondas de 10 tiradas
res <- vapply(rep(10,20),moneda,c(1))
length(res[which(res > 5)])
# en 20 rondas de 20 tiradas
res <- vapply(rep(20,20),moneda,c(1))
length(res[which(res > 5)])
# en 20 rondas de 100 tiradas
res <- vapply(rep(100,20),moneda,c(1))
length(res[which(res > 5)])

dbinom(1,1,0.5)
dbinom(2,2,0.5)
dbinom(3,3,0.5)
dbinom(2,3,0.5)
dbinom(1,3,0.5)

# Nos dicen que el 15% de la poblacion mundial tiene sobrepeso.
# queremos saber si en Bs. As es la misma tasa
# Tomamos una muestra aleatoria de 5 habitantes y encontramos 2 con sobrepeso.

# H0 : Bs As tiene la misma tasa mundial, 15%

# probabilidad de q ninguno tenga sobrepeso, siendo H0
dbinom(0,1,0.15)
dbinom(0,2,0.15)
dbinom(0,3,0.15)
dbinom(0,4,0.15)
dbinom(0,5,0.15)
dbinom(0,1,0.15) ^ 5

# P(2 con sobrepeos y 3 sin)
dbinom(2,5,.15)
# P(3 con sobrepeos y 2 sin)
dbinom(3,5,.15)
# P(4 con sobrepeos y 1 sin)
dbinom(4,5,.15)
# P(5 con sobrepeos y 0 sin)
dbinom(5,5,.15)

# Si Bs As tuviera la misma tasa q la mundial, la prob de encontrar 2 con sobre peso en 5 es
# P(2 con sobrepeos y 3 sin)
dbinom(2,5,.15)
# no esta entre 5% sup ni el 5% if, ie. no hay motivo para rechazar H0

#En el siguiente código se grafica el seno y el coseno en el intervalo [-2\pi , 2\pi] 
plot(sin,-2*pi, 2*pi, col="red" , xlab="", ylab="")
par(new=TRUE)
plot(cos, -2*pi, 2*pi, col="blue" , xlab="", ylab="",  axes=FALSE) 
title(main="Gráficas del seno y coseno")
abline(a=0, b=0)

plot(function(x) dbinom(x,100, 0.15),0,100, col="blue",yaxt="n",ylim = c(0, 0.12),ylab="")
axis(4)
text(80,0.02,labels="dbinom",col="blue")
par(new=TRUE)
plot(function(x) pbinom(x,100, 0.15),0,100, col="red",yaxt="n",ylim = c(0, 1.2),ylab="")
axis(2)
text(40,1.1,labels="pbinom",col="red")
