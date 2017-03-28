x <- c(1, 0.6, 12)
x
str(x)
class(x)
class(x[2])

x <- c(T, F,F,T)
x
str(x)
class(x)
class(x[2])

x <- c("a", "b", "hola")
x
str(x)
class(x)
class(x[2])

x <- 1:4
x
str(x)
class(x)
class(x[2])

?vector

class(1)
class(1L)
class(Inf)
1/Inf
class(1/Inf)
1*Inf
0*Inf
class(0*Inf)
class(NA)
class(NaN)

x <- rep(seq(1,10),seq(10,1))
x
which(x>5)
x[which(x>5)]
c(which(x>6),which(x==1))
x[c(which(x>6),which(x==1))]

str(x)
attributes(x)
?attributes
attributes()

attributes(randu)
attributes(randu)$names

m <- matrix(nrow = 2, ncol = 3)
m
attributes(m)
attributes(m)$dim
dim(m)

colnames(m)
colnames(m) <- c("col1","col2","col3")
m
