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

