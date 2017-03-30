## Matrices
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

## Valores perdidos y no procesables
``` R
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
> 1/0
[1] Inf
> class(Inf)
[1] "numeric"
> 0*NA
[1] NA
> 1/NA
[1] NA
> 1+NA
[1] NA

> vperdidos <- c(NA,NaN,Inf,0,0/0,1/0)
> vperdidos
[1]  NA NaN Inf   0 NaN Inf
> is.na(vperdidos)
[1]  TRUE  TRUE FALSE FALSE  TRUE FALSE
> is.nan(vperdidos)
[1] FALSE  TRUE FALSE FALSE  TRUE FALSE
> tablaVPerdidos <- cbind(is.na(vperdidos),is.nan(vperdidos))
> class(tablaVPerdidos)
[1] "matrix"
> colnames(tablaVPerdidos) <- c("is.na", "is.nan")
> rownames(tablaVPerdidos) <- c("NA","NaN", "Inf", "0", "0/0","1/0")
> tablaVPerdidos
    is.na is.nan
NA   TRUE  FALSE
NaN  TRUE   TRUE
Inf FALSE  FALSE
0   FALSE  FALSE
0/0  TRUE   TRUE
1/0 FALSE  FALSE
> 
```

## Data Frames
``` R
> # Data Frames
> x <- data.frame(metrica = 1:4, tipo = c(T, T, F, F))
> x
  metrica  tipo
1       1  TRUE
2       2  TRUE
3       3 FALSE
4       4 FALSE
> nrow(x)
[1] 4
> ncol(x)
[1] 2
>
```

## Nombres
``` R
> # Nombres
> x <- 1:3
> names(x)
NULL
> class(names)
[1] "function"
> names
function (x)  .Primitive("names")
> names(x) <- c("Elemento 1", "Elemento 2", "Elemento 3")
> x
Elemento 1 Elemento 2 Elemento 3
         1          2          3
>
```

## Coerción explícita
``` R
> # Coerción explícita
> x <- 0:6
> x
[1] 0 1 2 3 4 5 6
> class(x)
[1] "integer"
> as.numeric(x)
[1] 0 1 2 3 4 5 6
> class(as.numeric(x))
[1] "numeric"
> as.logical(x)
[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
> class(as.logical(x))
[1] "logical"
> as.character(x)
[1] "0" "1" "2" "3" "4" "5" "6"
> class(as.character(x))
[1] "character"
> x <- c("a","b","c")
> as.logical(x)
[1] NA NA NA
> as.complex(x)
[1] NA NA NA
Warning message:
NAs introduced by coercion 
> 
```

## Funciones
``` R
> # Funciones
> f <- function(a, b=1, c=2, d=NULL){
+   a^2 + b*c
+ }
> f()
Error in f() : argument "a" is missing, with no default
> f(2)
[1] 6
> formals(f)
$a

$b
[1] 1
$c
[1] 2
$d
NULL

> args(f)
function (a, b = 1, c = 2, d = NULL) 
NULL
> formals(f)$a = 2
> args(f)
function (a = 2, b = 1, c = 2, d = NULL) 
NULL
> f()
[1] 6

> # Only closures have formals, not primitive functions.
> args(names)
function (x) 
NULL
> formals(names)
NULL

> # An anonymous function:
> (function(x, y){ z <- x^2 + y^2; x+y+z })(0:7, 1)
[1]  2  4  8 14 22 32 44 58
> 
```