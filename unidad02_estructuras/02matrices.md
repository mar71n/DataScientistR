``` R
> # Matrices
> m <- matrix(1:5, nrow=2, ncol=3)
Warning message:
In matrix(1:5, nrow = 2, ncol = 3) :
  data length [5] is not a sub-multiple or multiple of the number of rows [2]
> m
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    1
> x <- 1:3
> y <- 10:12
> a <- cbind(x, y)
> a
     x  y
[1,] 1 10
[2,] 2 11
[3,] 3 12
> b <- rbind(x,y)
> b
  [,1] [,2] [,3]
x    1    2    3
y   10   11   12
> dim(a)
[1] 3 2
> dim(b)
[1] 2 3
> m %*% t(m)
     [,1] [,2]
[1,]   35   19
[2,]   19   21
> which(m==1)
[1] 1 6
> which(m==1,arr.ind=T)
     row col
[1,]   1   1
[2,]   2   3
> attributes(m)
$dim
[1] 2 3

> colnames(m) <- c("A","B","C")
> rownames(m) <- c("R1","R2")
> m
   A B C
R1 1 3 5
R2 2 4 1
> m["R1",]
A B C 
1 3 5 
> m[,"B"]
R1 R2 
 3  4 
 ```
