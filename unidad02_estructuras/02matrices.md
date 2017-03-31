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

## Interfaces de conección

``` R
> # Interfaces de conección
> con <- file("../descargas/data/cronograma-invierno.csv")
> class(con)
[1] "file"       "connection"
> con
                                description 
"../descargas/data/cronograma-invierno.csv" 
                                      class 
                                     "file" 
                                       mode 
                                        "r" 
                                       text 
                                     "text" 
                                     opened 
                                   "closed" 
                                   can read 
                                      "yes" 
                                  can write 
                                      "yes" 
> data <- read.csv2(con)
> head(data)
  PERIODO LINEA     DIA ORDEN TREN            SAL_C1   SAL_C2 INT_C1 INT_C2
1    2015     A DOMINGO     1    4 SALIDA ADELANTADA 07:45:00              
2    2015     A DOMINGO     2    5          07:32:00 08:00:30              
3    2015     A DOMINGO     3    6          07:42:00 08:09:30         09:00
4    2015     A DOMINGO     4    7          07:52:00 08:20:00         10:30
5    2015     A DOMINGO     5    1          08:00:00 08:28:00  08:00  08:00
6    2015     A DOMINGO     6    2          08:08:00 08:36:00  08:00  08:00
  FORM OBSERVACIONES
1    5              
2    5              
3    5              
4    5              
5    5              
6    5              
> con
Error in summary.connection(x) : invalid connection
> close(con)
Error in close.connection(con) : invalid connection
>  
> con <- gzfile("../descargas/data/cronograma-invierno.csv.gz")
> class(con)
[1] "gzfile"     "connection"
> con
                                   description 
"../descargas/data/cronograma-invierno.csv.gz" 
                                         class 
                                      "gzfile" 
                                          mode 
                                          "rb" 
                                          text 
                                        "text" 
                                        opened 
                                      "closed" 
                                      can read 
                                         "yes" 
                                     can write 
                                         "yes" 
> x <- readLines(con, 10)
> x
 [1] "PERIODO;LINEA;DIA;ORDEN;TREN;SAL_C1;SAL_C2;INT_C1;INT_C2;FORM;OBSERVACIONES"
 [2] "2015;A;DOMINGO;1;4;SALIDA ADELANTADA;07:45:00;;;5;"                         
 [3] "2015;A;DOMINGO;2;5;07:32:00;08:00:30;;;5;"                                  
 [4] "2015;A;DOMINGO;3;6;07:42:00;08:09:30;;09:00;5;"                             
 [5] "2015;A;DOMINGO;4;7;07:52:00;08:20:00;;10:30;5;"                             
 [6] "2015;A;DOMINGO;5;1;08:00:00;08:28:00;08:00;08:00;5;"                        
 [7] "2015;A;DOMINGO;6;2;08:08:00;08:36:00;08:00;08:00;5;"                        
 [8] "2015;A;DOMINGO;7;3;08:16:00;08:44:00;08:00;08:00;5;"                        
 [9] "2015;A;DOMINGO;8;4;08:24:00;08:52:00;08:00;08:00;5;"                        
[10] "2015;A;DOMINGO;9;5;08:32:00;09:00:00;08:00;08:00;5;"                        
> con
                                   description 
"../descargas/data/cronograma-invierno.csv.gz" 
                                         class 
                                      "gzfile" 
                                          mode 
                                          "rb" 
                                          text 
                                        "text" 
                                        opened 
                                      "closed" 
                                      can read 
                                         "yes" 
                                     can write 
                                          "no" 
> close(con)
> con
Error in summary.connection(x) : invalid connection
> con <- url("http://stat.ethz.ch/R-manual/", "r")
> con
                    description                           class 
"http://stat.ethz.ch/R-manual/"                   "url-wininet" 
                           mode                            text 
                            "r"                          "text" 
                         opened                        can read 
                       "opened"                           "yes" 
                      can write 
                           "no" 
> x <- readLines(con, 10)
> x
 [1] "<HTML>"                                                              
 [2] "<!-- $Id: index.html,v 1.13 2002/08/19 08:02:07 local Exp root $ -->"
 [3] "<HEAD>"                                                              
 [4] "<TITLE>The R manual -- DEVELOPMENT Versions </TITLE>"                
 [5] "</HEAD>"                                                             
 [6] ""                                                                    
 [7] "<BODY TEXT=\"#000000\" BGCOLOR=\"#FFFFFF\" LINK=\"#0000F0\""         
 [8] "VLINK=\"#660066\" ALINK=\"#FF0000\" BACKGROUND=\"white\" >"          
 [9] ""                                                                    
[10] "<h1 align=center>"                                                   
> con
                    description                           class 
"http://stat.ethz.ch/R-manual/"                   "url-wininet" 
                           mode                            text 
                            "r"                          "text" 
                         opened                        can read 
                       "opened"                           "yes" 
                      can write 
                           "no" 
> close(con)
> con
Error in summary.connection(x) : invalid connection
> 
```