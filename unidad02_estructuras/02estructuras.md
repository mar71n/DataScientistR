``` R
> x <- c(1, 0.6, 12)
> x
[1]  1.0  0.6 12.0
> str(x)
 num [1:3] 1 0.6 12
> class(x)
[1] "numeric"
> class(x[2])
[1] "numeric"

> x <- c(T, F,F,T)
> x
[1]  TRUE FALSE FALSE  TRUE
> str(x)
 logi [1:4] TRUE FALSE FALSE TRUE
> class(x)
[1] "logical"
> class(x[2])
[1] "logical"

> x <- c("a", "b", "hola")
> x
[1] "a"    "b"    "hola"
> str(x)
 chr [1:3] "a" "b" "hola"
> class(x)
[1] "character"
> class(x[2])
[1] "character"

> x <- 1:4
> x
[1] 1 2 3 4
> str(x)
 int [1:4] 1 2 3 4
> class(x)
[1] "integer"
> class(x[2])
[1] "integer"
> ?vector

> class(1)
[1] "numeric"
> class(1L)
[1] "integer"
> class(Inf)
[1] "numeric"
> 1/Inf
[1] 0
> class(1/Inf)
[1] "numeric"
> 1*Inf
[1] Inf
> 0*Inf
[1] NaN
> class(0*Inf)
[1] "numeric"
> class(NA)
[1] "logical"
> class(NaN)
[1] "numeric"

> x <- rep(seq(1,10),seq(10,1))
> x
 [1]  1  1  1  1  1  1  1  1  1  1  2  2  2  2  2  2  2  2  2  3  3  3  3  3  3
[26]  3  3  4  4  4  4  4  4  4  5  5  5  5  5  5  6  6  6  6  6  7  7  7  7  8
[51]  8  8  9  9 10
> which(x>5)
 [1] 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55
> x[which(x>5)]
 [1]  6  6  6  6  6  7  7  7  7  8  8  8  9  9 10
> c(which(x>6),which(x==1))
 [1] 46 47 48 49 50 51 52 53 54 55  1  2  3  4  5  6  7  8  9 10
> x[c(which(x>6),which(x==1))]
 [1]  7  7  7  7  8  8  8  9  9 10  1  1  1  1  1  1  1  1  1  1
> str(x)
 int [1:55] 1 1 1 1 1 1 1 1 1 1 ...
> attributes(x)
NULL

> ?attributes
> m <- matrix(nrow = 2, ncol = 3)
> m <- matrix(randu$x, nrow = 2, ncol = 3)
Warning message:
In matrix(randu$x, nrow = 2, ncol = 3) :
  data length [400] is not a sub-multiple or multiple of the number of columns [3]
> m
         [,1]     [,2]     [,3]
[1,] 0.000031 0.822440 0.393595
[2,] 0.044495 0.322291 0.309097
> attributes(m)
$dim
[1] 2 3

> attributes(m)$dim
[1] 2 3
> dim(m)
[1] 2 3
> colnames(m)
NULL
> colnames(m) <- c("col1","col2","col3")
> m
         col1     col2     col3
[1,] 0.000031 0.822440 0.393595
[2,] 0.044495 0.322291 0.309097
```
