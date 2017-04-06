## Test Basico

# Ejercicio 1.2.1

?sample
sample(1:6,20,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))

x <- sample(1:6,40,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
x
tx <- table(x)
tx
plot(table(x),type="h")

p <- function(x){x/tx[x]}
p(5)

p1 <- function(k){
  x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
  tx <- table(x)
  tx[1]/k
}

?lapply
p1(30)
res <- vapply(list(10,20,30,40,80,160,1000,2000,10000),p1,c(1))
names(res) <- c(10,20,30,40,80,160,1000,2000,10000)
plot(res,type="h")


# Ejercicio 1.2.2

sample(c(0,1),20,replace=TRUE,prob=c(0.5,0.5))
k <- 100
p1 <- function(k){
  x <- sample(c(0,1),k,replace=TRUE,prob=c(0.5,0.5))
  tx <- table(x)
  tx[1]/k
}

p1(30)
res <- vapply(list(10,20,30,40,80,160,1000,2000,10000),p1,c(1))
names(res) <- c(10,20,30,40,80,160,1000,2000,10000)
plot(res,type="h")

## Promedio
