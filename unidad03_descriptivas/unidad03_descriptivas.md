## Unidad 3

### Analisis exploratorio
``` R
> # Unidad 3

> # Analisis exploratorio

> library(datasets)
> data(iris)
> str(iris)
'data.frame':	150 obs. of  5 variables:
 $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
 $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
 $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
 $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
 $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
> ls(all.names=TRUE)
[1] ".Random.seed" "iris"         "x"            "x01"          "xm"
> names(iris)
[1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
> str(iris[["Species"]])
 Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
> attributes(iris[["Species"]])
$levels
[1] "setosa"     "versicolor" "virginica" 

$class
[1] "factor"

> str(attributes(iris[["Species"]])$levels)
 chr [1:3] "setosa" "versicolor" "virginica"
> class(attributes(iris[["Species"]])$levels)
[1] "character"
> attributes(iris[["Species"]])$levels
[1] "setosa"     "versicolor" "virginica" 
> class(iris)
[1] "data.frame"
> nrow(iris)
[1] 150
> ncol(iris)
[1] 5
> names(iris)
[1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
> class(iris[["Sepal.Length"]])
[1] "numeric"
> range(iris[["Sepal.Length"]])
[1] 4.3 7.9
> table(iris[["Species"]])

    setosa versicolor  virginica 
        50         50         50 
> table(iris[["Sepal.Length"]])

4.3 4.4 4.5 4.6 4.7 4.8 4.9   5 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9   6 6.1 6.2 
  1   3   1   4   2   5   6  10   9   4   1   6   7   6   8   7   3   6   6   4 
6.3 6.4 6.5 6.6 6.7 6.8 6.9   7 7.1 7.2 7.3 7.4 7.6 7.7 7.9 
  9   7   5   2   8   3   4   1   1   3   1   1   1   4   1 
> head(iris)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
> attach(iris)
The following objects are masked from iris (pos = 3):

    Petal.Length, Petal.Width, Sepal.Length, Sepal.Width, Species
```

### Analissi estadistico
``` R
> # Analissi estadistico
> median(iris[["Sepal.Length"]])
[1] 5.8
> median(1:4)
[1] 2.5
> median(c(1:4,100,1000))
[1] 3.5
> # mean(x, trim = 0, na.rm = FALSE, ...)
> mean(iris[["Sepal.Length"]])
[1] 5.843333
> x <- c(0:10, 50)
> xm <- mean(x)
> c(xm, mean(x, trim = 0.10))
[1] 8.75 5.50
> # trim va de 0 a 0.5 indica que porcentage se recorta tanto de head como de tail
> # trim 0.01 en 100 observaciones quita la primera y la última
> x <- seq(0.1,10,0.1)
> str(x)
 num [1:100] 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 ...
> mean(log(x))
[1] 1.334809
> x01 <- x[2:99]
> x01
 [1] 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0
[20] 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9
[39] 4.0 4.1 4.2 4.3 4.4 4.5 4.6 4.7 4.8 4.9 5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8
[58] 5.9 6.0 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9 7.0 7.1 7.2 7.3 7.4 7.5 7.6 7.7
[77] 7.8 7.9 8.0 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9.0 9.1 9.2 9.3 9.4 9.5 9.6
[96] 9.7 9.8 9.9
> mean(log(x01))
[1] 1.36205
> mean(log(x), trim = 0.01)
[1] 1.36205
> # trim 0.1 en 100 observaciones quita las 10 primeras y las 10 últimas
> x10 <- x[11:90]
> x10
 [1] 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9
[20] 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3 4.4 4.5 4.6 4.7 4.8
[39] 4.9 5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 6.0 6.1 6.2 6.3 6.4 6.5 6.6 6.7
[58] 6.8 6.9 7.0 7.1 7.2 7.3 7.4 7.5 7.6 7.7 7.8 7.9 8.0 8.1 8.2 8.3 8.4 8.5 8.6
[77] 8.7 8.8 8.9 9.0
> mean(log(x10))
[1] 1.485518
> mean(log(x), trim = 0.1)
[1] 1.485518
> # sd
> sd(iris[["Sepal.Length"]])
[1] 0.8280661
> sd(1:2) ^ 2
[1] 0.5
> summary(iris)
  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
 Median :5.800   Median :3.000   Median :4.350   Median :1.300  
 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
       Species  
 setosa    :50  
 versicolor:50  
 virginica :50  
                
                
```
                
``` R
> hist(iris$Sepal.Length,breaks=20)
```
 
<img src="./graficos/graph5.png" width="30%" />

``` R
> qqnorm(iris$Sepal.Length)
```

<img src="./graficos/graph6.png" width="30%" />

``` R
> boxplot(Petal.Length ~ Species , data = iris, ylab="Petal.Length", varwith=TRUE)
```

<img src="./graficos/graph7.png" width="30%" />

``` R
> plot(Petal.Length ~ Sepal.Length, data = iris, col = "red")
```

<img src="./graficos/graph8.png" width="30%" />

``` R
> pairs(iris)
```

<img src="./graficos/graph9.png" width="30%" />

### Distribuciones
``` R
> # Distribuciones
> pnorm(27.4, mean=50, sd=20)
[1] 0.1292381

> plot(function(x) pnorm(x, log.p = TRUE), -50, 10, main = "log { Normal Cumulative }")
```
<img src="./graficos/graph10.png" width="30%" />

```
> plot(function(x) dnorm(x, mean=50, sd=30), -50, 150, main = "dnorm")
```
<img src="./graficos/graph11.png" width="30%" />

```
> plot(function(x) pnorm(x, mean=50, sd=30), -50, 150, main = "pnorm")
```
<img src="./graficos/graph12.png" width="30%" />

```
plot(function(x) dnorm(x, mean=50, sd=30), -50, 150, main = "dnorm")
lines(c(27.4, 0))
```
<img src="./graficos/graph0.png" width="30%" />

### Introduccion a la regresion lineal
``` R
> # Introduccion a la regresion lineal
> # install.packages("UsingR")
> library(UsingR)
Loading required package: MASS
Loading required package: HistData
Loading required package: Hmisc
Loading required package: lattice
Loading required package: survival
Loading required package: Formula
Loading required package: ggplot2

Attaching package: 'Hmisc'

The following objects are masked from 'package:base':

    format.pval, round.POSIXt, trunc.POSIXt, units


Attaching package: 'UsingR'

The following object is masked from 'package:survival':

    cancer

Warning messages:
1: package 'UsingR' was built under R version 3.2.5 
2: package 'HistData' was built under R version 3.2.5 
3: package 'Hmisc' was built under R version 3.2.5 
4: package 'survival' was built under R version 3.2.5 
5: package 'Formula' was built under R version 3.2.5 
6: package 'ggplot2' was built under R version 3.2.5 
> data(diamond)
> head(diamond)
  carat price
1  0.17   355
2  0.16   328
3  0.17   350
4  0.18   325
5  0.25   642
6  0.16   342
> summary(diamond)
     carat            price       
 Min.   :0.1200   Min.   : 223.0  
 1st Qu.:0.1600   1st Qu.: 337.5  
 Median :0.1800   Median : 428.5  
 Mean   :0.2042   Mean   : 500.1  
 3rd Qu.:0.2500   3rd Qu.: 657.0  
 Max.   :0.3500   Max.   :1086.0  
> plot(diamond$carat, diamond$price, xlab = "carats", ylab = "price", 
+                                    bg = "lightblue", col = "black",
+                                    cex = 1.1, pch = 21, frame = FALSE)
```
<img src="./graficos/graph13.png" width="30%" />

``` R
> lm(price ~ carat, data = diamond)

Call:
lm(formula = price ~ carat, data = diamond)

Coefficients:
(Intercept)        carat  
     -259.6       3721.0  

> plot(diamond$carat, diamond$price, xlab = "carats", ylab = "price", 
+                                    bg = "lightblue", col = "black",
+                                    cex = 1.1, pch = 21, frame = FALSE)
> abline(lm(price ~ carat, data = diamond),lwd=2)
```
<img src="./graficos/graph14.png" width="30%" />

El operador I
``` R
> # el operador I 
> ?I
> class(diamond$carat)
[1] "numeric"
> class(I(diamond$carat - mean(diamond$carat)))
[1] "AsIs"
> class(diamond$carat - mean(diamond$carat))
[1] "numeric"
```

``` R
> fit2 <- lm(price ~ I(carat - mean(carat)), data = diamond)
> coef(fit2)
           (Intercept) I(carat - mean(carat)) 
              500.0833              3721.0249 
```

``` R
> x <- diamond$carat - mean(diamond$carat)
> fit2 <- lm(price ~ x, data = diamond)
> coef(fit2)
(Intercept)           x 
   500.0833   3721.0249 
```

``` R
> fit <- lm(price ~ carat, data = diamond)
> coef(fit)
(Intercept)       carat 
  -259.6259   3721.0249 
```

``` R
> newx <- c(0.16, 0.27, 0.34)
> coef(fit)[1] + coef(fit)[2] * newx
[1]  335.7381  745.0508 1005.5225
> predict(fit, newdata = data.frame(carat=newx))
        1         2         3 
 335.7381  745.0508 1005.5225 
```
``` R
> str(fit)
List of 12
 $ coefficients : Named num [1:2] -260 3721
  ..- attr(*, "names")= chr [1:2] "(Intercept)" "carat"
 $ residuals    : Named num [1:48] -17.95 -7.74 -22.95 -85.16 -28.63 ...
  ..- attr(*, "names")= chr [1:48] "1" "2" "3" "4" ...
 $ effects      : Named num [1:48] -3464.7 1448.7 -20.3 -82.6 -27 ...
  ..- attr(*, "names")= chr [1:48] "(Intercept)" "carat" "" "" ...
 $ rank         : int 2
 $ fitted.values: Named num [1:48] 373 336 373 410 671 ...
  ..- attr(*, "names")= chr [1:48] "1" "2" "3" "4" ...
 $ assign       : int [1:2] 0 1
 $ qr           :List of 5
  ..$ qr   : num [1:48, 1:2] -6.928 0.144 0.144 0.144 0.144 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:48] "1" "2" "3" "4" ...
  .. .. ..$ : chr [1:2] "(Intercept)" "carat"
  .. ..- attr(*, "assign")= int [1:2] 0 1
  ..$ qraux: num [1:2] 1.14 1.1
  ..$ pivot: int [1:2] 1 2
  ..$ tol  : num 1e-07
  ..$ rank : int 2
  ..- attr(*, "class")= chr "qr"
 $ df.residual  : int 46
 $ xlevels      : Named list()
 $ call         : language lm(formula = price ~ carat, data = diamond)
 $ terms        :Classes 'terms', 'formula' length 3 price ~ carat
  .. ..- attr(*, "variables")= language list(price, carat)
  .. ..- attr(*, "factors")= int [1:2, 1] 0 1
  .. .. ..- attr(*, "dimnames")=List of 2
  .. .. .. ..$ : chr [1:2] "price" "carat"
  .. .. .. ..$ : chr "carat"
  .. ..- attr(*, "term.labels")= chr "carat"
  .. ..- attr(*, "order")= int 1
  .. ..- attr(*, "intercept")= int 1
  .. ..- attr(*, "response")= int 1
  .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
  .. ..- attr(*, "predvars")= language list(price, carat)
  .. ..- attr(*, "dataClasses")= Named chr [1:2] "numeric" "numeric"
  .. .. ..- attr(*, "names")= chr [1:2] "price" "carat"
 $ model        :'data.frame':	48 obs. of  2 variables:
  ..$ price: int [1:48] 355 328 350 325 642 342 322 485 483 323 ...
  ..$ carat: num [1:48] 0.17 0.16 0.17 0.18 0.25 0.16 0.15 0.19 0.21 0.15 ...
  ..- attr(*, "terms")=Classes 'terms', 'formula' length 3 price ~ carat
  .. .. ..- attr(*, "variables")= language list(price, carat)
  .. .. ..- attr(*, "factors")= int [1:2, 1] 0 1
  .. .. .. ..- attr(*, "dimnames")=List of 2
  .. .. .. .. ..$ : chr [1:2] "price" "carat"
  .. .. .. .. ..$ : chr "carat"
  .. .. ..- attr(*, "term.labels")= chr "carat"
  .. .. ..- attr(*, "order")= int 1
  .. .. ..- attr(*, "intercept")= int 1
  .. .. ..- attr(*, "response")= int 1
  .. .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
  .. .. ..- attr(*, "predvars")= language list(price, carat)
  .. .. ..- attr(*, "dataClasses")= Named chr [1:2] "numeric" "numeric"
  .. .. .. ..- attr(*, "names")= chr [1:2] "price" "carat"
 - attr(*, "class")= chr "lm"
> 
```

### Introduccion a clustering
``` R
> # Introduccion a clustering
> newiris <- iris
> newiris$Species <- NULL
> head(newiris)
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1          5.1         3.5          1.4         0.2
2          4.9         3.0          1.4         0.2
3          4.7         3.2          1.3         0.2
4          4.6         3.1          1.5         0.2
5          5.0         3.6          1.4         0.2
6          5.4         3.9          1.7         0.4
> kc <- kmeans(newiris, 3)
> class(kc)
[1] "kmeans"
> plot(newiris[c("Sepal.Length", "Sepal.Width")], col=kc$cluster)
> points(kc$centers[,c("Sepal.Length", "Sepal.Width")], col=1:3, pch=8, cex=2)
> 
```
<img src="./graficos/graph15.png" width="50%" />

# Clase Interactiva
## Analisi exploratorio

``` R
> ## Clase interactiva
> # Analisis exploratorio
str(h), head(h), nrow(h), ncol(h), names(h), class(h$iddueño), 
range(h$iddueño), length(h$iddueño), tail(h), etc.
```
## Analisis estadistico descriptivo
``` R
> # Analisis estadistico
> h <- read.csv2("../descargas/unidad03/Mascotas_2a/Mascotas_csv.txt")
> head(h)
  IdMascota IdDueno IdEspecie IdRaza  Peso  Edad Sexo
1         1    5627         1     89 11.81  0.01    M
2         2     398         1     40  7.78 12.64    M
3         3    1962         1     35  6.75  0.56    F
4         4    6113         2    170  6.40  7.07    F
5         5    1802         2    166  5.42  0.14    M
6         6    4092         1     36 18.82  0.29    M
> median(h$Peso)
[1] 7.98
> mean(h$Peso)
[1] 15.48057
> summary(h$Peso)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.52    4.64    7.98   15.48   25.50   63.40 
> # Histogramas y cuantiles
> hist(h$Peso,30)
```

<img src="./graficos/graph23.png" width="30%" />

Regla de la raiz cuadrada
``` R
> tama <- length(h$Peso)
> # regla raiz cuadrada
> ndiv <- sqrt(tama)
> hist(h$Peso,ndiv)
```

<img src="./graficos/graph24.png" width="30%" />

Regla de Sturges
``` R
> # regla de Sturges
> ndivS <- 1 + log2(tama)
> hist(h$Peso,ndivS)
```

<img src="./graficos/graph25.png" width="30%" />

``` R
> qqnorm(h$Peso)
```
<img src="./graficos/graph26.png" width="30%" />

``` R
> qqnorm(h$IdDueno)
```

<img src="./graficos/graph27.png" width="30%" />

## Spigot plot
``` R
> # Spigot plot
> boxplot(h$Peso ~ h$IdEspecie)
```

<img src="./graficos/graph28.png" width="30%" />

## Scatter plots
``` R
> # Scatter plots
> # importe ~ ingreso
> h2 <- read.csv2("../descargas/unidad03/Mascotas_2a/Duenos_csv.txt")
> h3 <- read.csv2("../descargas/unidad03/Mascotas_2a/Navegacion_csv.txt")
> names(h)
[1] "IdMascota" "IdDueno"   "IdEspecie" "IdRaza"    "Peso"      "Edad"
[7] "Sexo"
+ names(h2)
[1] "Id"      "IdDueno" "Perros"  "Gatos"   "Total"   "Edad"    "Sexo"
[8] "Ingreso"
> names(h3)
[1] "Id"        "IdDueno"   "IdPagina"  "DT"        "Secuencia" "Venta"
[7] "Importe"
> ?merge
> h3_con_venta <- h3[h3$Importe >0, ]
> nrow(h3_con_venta)
[1] 43093
> datosdw <- merge(h3_con_venta, h2, by.x = "IdDueno", by.y = "IdDueno")
> nrow(datosdw)
[1] 43093
> head(datosdw)
  IdDueno   Id.x IdPagina    DT Secuencia Venta Importe Id.y Perros Gatos Total
1       1  79675       20 12.96        20     1  900.71    5      1     2     3
2       1 133286        8 12.27    8-6-15     1  485.57    5      1     2     3
3       1 904153        8  8.74     8-1-1     1  241.52    5      1     2     3
4       1 372630        9  9.68   9-13-13     1  180.48    5      1     2     3
5       1 239727        3 10.34         3     1    0.89    5      1     2     3
6       1 345588        2 13.35    2-19-8     1  196.57    5      1     2     3
  Edad Sexo Ingreso
1   60    M  116816
2   60    M  116816
3   60    M  116816
4   60    M  116816
5   60    M  116816
6   60    M  116816
> plot(datosdw$Importe ~ datosdw$Ingreso)
> 
```

<img src="./graficos/graph29.png" width="30%" />

## Pairs
``` R
 # Pairs
> ?pairs
> pairs(h[,c("Peso", "IdRaza", "IdEspecie")])
```
<img src="./graficos/graph30.png" width="30%" />

## Distribuciones
``` R
> # Distribuciones
> hist(rnorm(1000),30)
```
<img src="./graficos/graph31.png" width="30%" />

``` R
> hist(rnorm(10000),breaks=30)
```
<img src="./graficos/graph32.png" width="30%" />

## Regresion lineal
``` R
> # Regresion lineal
> lm(formula= "Importe ~ Ingreso", data=datosdw)

Call:
lm(formula = "Importe ~ Ingreso", data = datosdw)

Coefficients:
(Intercept)      Ingreso
  1.591e+03   -7.983e-04

> plot(datosdw$Ingreso, datosdw$Importe, xlab="ingreso", ylab="importe", col="yellow")
> abline(lm(formula= "Importe ~ Ingreso", data=datosdw), lwd=2, col="black")
> 
```
<img src="./graficos/graph33.png" width="30%" />

## Clustering
``` R
> # Clustering
> kc <- kmeans(h[,c("Peso", "IdRaza", "IdEspecie")],2)
> plot(h$Peso, h$IdRaza, col=kc$cluster)
```
<img src="./graficos/graph34.png" width="30%" />

``` R
> str(kc)
List of 9
 $ cluster     : int [1:10000] 1 1 1 2 2 1 1 1 2 1 ...
 $ centers     : num [1:2, 1:3] 20 4.2 50.8 150.9 1 ...
  ..- attr(*, "dimnames")=List of 2
  .. ..$ : chr [1:2] "1" "2"
  .. ..$ : chr [1:3] "Peso" "IdRaza" "IdEspecie"
 $ totss       : num 3.1e+07
 $ withinss    : num [1:2] 7543563 2444587
 $ tot.withinss: num 9988150
 $ betweenss   : num 21055276
 $ size        : int [1:2] 7124 2876
 $ iter        : int 1
 $ ifault      : int 0
 - attr(*, "class")= chr "kmeans"
> kc$centers
       Peso    IdRaza IdEspecie
1 20.034642  50.75632         1
2  4.199896 150.88039         2
> summary(h)
   IdMascota        IdDueno       IdEspecie         IdRaza
 Min.   :    1   Min.   :   0   Min.   :1.000   Min.   :  1.00
 1st Qu.: 2501   1st Qu.:2039   1st Qu.:1.000   1st Qu.: 36.00
 Median : 5000   Median :4043   Median :1.000   Median : 71.00
 Mean   : 5000   Mean   :4019   Mean   :1.288   Mean   : 79.55
 3rd Qu.: 7500   3rd Qu.:6009   3rd Qu.:2.000   3rd Qu.:114.00
 Max.   :10000   Max.   :7999   Max.   :2.000   Max.   :200.00
      Peso            Edad       Sexo
 Min.   : 0.52   Min.   : 0.00   F:5009
 1st Qu.: 4.64   1st Qu.: 0.99   M:4991
 Median : 7.98   Median : 3.90
 Mean   :15.48   Mean   : 5.35
 3rd Qu.:25.50   3rd Qu.: 8.82
 Max.   :63.40   Max.   :19.26
> 
```

