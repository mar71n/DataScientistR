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

