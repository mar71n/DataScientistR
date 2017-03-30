# Matrices

m <- matrix(1:5, nrow=2, ncol=3)
m

x <- 1:3
y <- 10:12

a <- cbind(x, y)
a

b <- rbind(x,y)
b

dim(a)
dim(b)

m %*% t(m)

which(m==1)
which(m==1,arr.ind=T)

attributes(m)
colnames(m) <- c("A","B","C")
rownames(m) <- c("R1","R2")
m
m["R1",]
m[,"B"]

# Listas

l <- list(1, "a", 1+4i)
l
class(l)
str(l)

l[[3]]
class(l[[3]])

# Factores
?factor

x <- factor(c("yes","yes","no","yes","no"))
x

table(x)
x <- factor(c("yes","yes","no","yes","no"), levels=c("yes","no"))
x
table(x)

which(x=="yes")

# Valores perdidos y no procesables

ls()

1/Inf
class(1/Inf)
1*Inf
0*Inf
class(0*Inf)
class(NA)
class(NaN)
1/0
0/0
is.nan(0/0)
is.na(0/0)
class(Inf)
0*NA
1/NA
1+NA
is.na(NA)
is.na(NaN)
is.nan(NaN)
is.nan(NA)
?NaN
vperdidos <- c(NA,NaN,Inf,0,0/0,1/0)
vperdidos
is.na(vperdidos)
is.nan(vperdidos)

tablaVPerdidos <- cbind(is.na(vperdidos),is.nan(vperdidos))
class(tablaVPerdidos)
colnames(tablaVPerdidos) <- c("is.na", "is.nan")
rownames(tablaVPerdidos) <- c("NA","NaN", "Inf", "0", "0/0","1/0")
tablaVPerdidos

x <- c(NA,NaN)

# Data Frames

x <- data.frame(metrica = 1:4, tipo = c(T, T, F, F))
x

nrow(x)
ncol(x)

# Nombres

x <- 1:3
names(x)
class(names)
names
names(x) <- c("Elemento 1", "Elemento 2", "Elemento 3")
x

# Coerción explícita

x <- 0:6
x
class(x)

as.numeric(x)
class(as.numeric(x))
as.logical(x)
class(as.logical(x))
as.character(x)
class(as.character(x))

x <- c("a","b","c")
as.logical(x)
as.complex(x)

# Funciones
?function(){}

f <- function(a, b=1, c=2, d=NULL){
  a^2 + b*c
}
f()
f(2)

formals(f)
args(f)

formals(f)$a = 2
args(f)
f()

# Only closures have formals, not primitive functions.
args(names)
formals(names)

# An anonymous function:
(function(x, y){ z <- x^2 + y^2; x+y+z })(0:7, 1)

?apply

browser()