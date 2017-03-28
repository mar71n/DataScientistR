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