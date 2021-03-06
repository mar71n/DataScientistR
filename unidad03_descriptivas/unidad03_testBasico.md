## Unidad 3
# Apunte sobre test Basico

``` R
> ## Test Basico
> # Ejercicio 1.2.1
> sample(1:6,20,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
 [1] 6 3 2 3 4 4 1 3 1 4 4 2 6 2 5 1 4 4 6 1
> x <- sample(1:6,40,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
> x
 [1] 5 2 3 5 3 2 6 3 3 6 1 2 6 6 3 2 5 6 5 3 4 4 1 2 6 2 1 6 1 2 2 1 2 1 4 1 4 2
[39] 4 1
> tx <- table(x)
> tx
x
 1  2  3  4  5  6 
 8 10  6  5  4  7 
> plot(table(x),type="h")
> barplot(tx, main="40 tiradas")
```
<img src="./graficos/graph17.png" width="40%" />

``` R
> p <- function(x){x/tx[x]}
> p(5)
   5 
1.25 
> p1 <- function(k){
+   x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
+   tx <- table(x)
+   tx[1]/k
+ }
> p1(30)
        1 
0.1333333 
> res <- vapply(list(10,20,30,40,80,160,1000,2000,10000),p1,c(1))
> names(res) <- c(10,20,30,40,80,160,1000,2000,10000)
> plot(res,type="h")
> barplot(res, main="P(1) para x tiradas")  
```
<img src="./graficos/graph18.png" width="40%" />

``` R
> # Ejercicio 1.2.2
> sample(c(0,1),20,replace=TRUE,prob=c(0.5,0.5))
 [1] 0 0 0 1 0 1 1 1 1 0 1 0 1 1 1 0 0 1 1 1
> k <- 100
> moneda_p1 <- function(k){
+   x <- sample(c(0,1),k,replace=TRUE,prob=c(0.5,0.5))
+   tx <- table(x)
+   tx[1]/k
+ }
> moneda_p1(30)
        0 
0.5333333 
> res <- vapply(list(10,20,30,40,80,160,1000,2000,10000),moneda_p1,c(1))
> names(res) <- c(10,20,30,40,80,160,1000,2000,10000)
> plot(res,type="h")
> barplot(res, main="P(cara) en x tiradas")
```
<img src="./graficos/graph19.png" width="40%" />

## Ejercicio 1.2.3
Calcule el promedio de la tirada de los dados del ejercicio anterior 
para las primeras 10,20,30,40,80,160,1000,2000,10000 tiradas
Graficar
``` R
> ## Promedio
> # Ejercicio 1.2.3
> k <- 100
> x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
> x
  [1] 3 3 1 2 4 5 2 6 4 2 5 5 1 1 6 4 3 4 2 5 4 1 1 5 6 2 4 1 4 5 5 6 6 3 4 1 4
 [38] 4 2 1 5 4 1 3 3 1 2 2 6 4 5 5 4 5 6 6 3 1 5 2 6 6 2 1 5 6 1 5 6 5 3 1 4 2
 [75] 4 1 3 2 4 1 2 4 4 5 1 4 3 4 1 4 3 2 3 2 4 1 4 5 2 3
> sum(x)
[1] 339
> length(x)
[1] 100
> mean(x)
[1] 3.39
> promedio <- function(k){
+   x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
+   mean(x)
+ }
> promedio (10)
[1] 3.5
> promedios <- vapply(list(10,20,30,40,80,160,1000,2000,10000),promedio,c(1))
> names(promedios) <- c(10,20,30,40,80,160,1000,2000,10000)
> promedios
      10       20       30       40       80      160     1000     2000 
2.800000 3.650000 3.466667 3.200000 3.750000 3.518750 3.488000 3.483000 
   10000 
3.527000 
> barplot(promedios, col=c("lightblue1","lightblue2"), main="Promedio resultado dados\n en x tiradas")
```
<img src="./graficos/graph20.png" width="40%" />

## Ejercicio 1.2.6
Calcule los desvíos estándar para las primeras
10,20,30,40,80,160,1000,2000,10000 tiradas
Graficar
``` R
> # Ejercicio 1.2.6
> ?sd
> k <- 100
> x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
> x
  [1] 6 6 6 4 6 2 1 4 1 1 6 3 3 1 6 6 3 6 6 2 1 5 1 6 5 1 3 4 3 2 3 4 1 5 6 6 3
 [38] 2 1 6 6 5 5 2 3 2 3 5 4 4 5 1 4 5 4 2 3 6 6 5 2 1 1 1 6 5 1 3 6 2 4 5 2 5
 [75] 3 1 3 2 3 6 2 2 6 3 6 4 3 5 6 3 5 5 4 2 1 4 1 2 3 5
> sum(x)
[1] 361
> length(x)
[1] 100
> mean(x)
[1] 3.61
> sd(x)
[1] 1.797276
> desviostd <- function(k){
+   x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
+   sd(x)
+ }
> desvios <- vapply(list(10,20,30,40,80,160,1000,2000,10000),desviostd,c(1))
> names(desvios) <- c(10,20,30,40,80,160,1000,2000,10000)
> desvios
      10       20       30       40       80      160     1000     2000 
1.763834 1.803505 1.586219 1.552294 1.935307 1.706398 1.690797 1.701453 
   10000 
1.709289 
> barplot(desvios, ylim=c(0,2), main="desvio estandar\n para x tiradas")
```
<img src="./graficos/graph21.png" width="40%" />

## Ejercicio 1.2.7
``` R
> # Ejercicio 1.2.7
> k <- 10
> x <- sample(1:6,k,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
> tx <- table(x)
> barplot(tx)
> enetiradas <- function(n){
+   x <- sample(1:6,n,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
+   table(x)
+ }
> par(mfrow=c(2,3))
> barplot(enetiradas(10), main="10")
> barplot(enetiradas(20), main="20")
> barplot(enetiradas(40), main="40")
> barplot(enetiradas(80), main="80")
> barplot(enetiradas(2000), main="2000")
> barplot(enetiradas(10000), main="10000")
> par(mfrow=c(1,1))
> 
```
<img src="./graficos/graph22.png" width="50%" />

## Otro ejemplo
En lugar del ejemplo del transito tomo datos de iris
``` R
> # ajusto Petal.Length para la Specie Setosa con dnorm
> # le paso a dnorm los parametros mean y sd de los datos
> mean(iris[iris$Species=="setosa","Petal.Length"])
[1] 1.462
> sd(iris[iris$Species=="setosa","Petal.Length"])
[1] 0.173664
> # dnorm(x, mean=1.462, sd=0.173664)
> par(mfrow=c(2,1))
> hist(iris[iris$Species=="setosa",]$Petal.Length,breaks=seq(0.5,2.5,0.05), main="setosa Petal.Length\n mean=1.462 sd=0.173664")
> plot(function(x) dnorm(x, mean=1.462, sd=0.173664), 0.5, 2.5, main = "dnorm(x, mean=1.462, sd=0.173664)",ylab="")
> par(mfrow=c(1,1))
>
```
<img src="./graficos/graph1.png" width="60%" />

---
# Inferencia estadistica
``` R
 ## Inferencia estadistica
> sample(c(0,1),10,replace=TRUE,prob=c(0.75,0.25))
 [1] 0 0 0 0 1 0 0 0 0 0
> # [1] 1 1 0 1 1 1 1 0 0 0
> # que probabilidad hay de este resultado si la moneda esta equilibrada
> dbinom(6,10,0.5)
[1] 0.2050781
> dbinom(4,10,0.5)
[1] 0.2050781
> #  [1] 1 0 1 1 0 0 0 0 0 0
> dbinom(3,10,0.5)
[1] 0.1171875
> # [1] 0 0 0 0 0 0 0 0 1 0
> dbinom(1,10,0.5)
[1] 0.009765625
> x <- sample(c(0,1),20,replace=TRUE,prob=c(0.75,0.25))
> tx <- table(x)
> dbinom(tx[1],20,0.5)
         0 
0.07392883 
> x <- sample(c(0,1),100,replace=TRUE,prob=c(0.75,0.25))
> tx <- table(x)
> dbinom(tx[1],100,0.5)
           0 
5.518672e-07 
> # probabilidad de x si H0 en n tiradas
> moneda <- function(n){
+   x <- sample(c(0,1),n,replace=TRUE,prob=c(0.75,0.25))
+   tx <- table(x)
+   dbinom(tx[1],n,0.5) * 100
+ }
> # veces que acepto H0 (siendo H1 por def de la funcion) con 95% de nivel de confianza
> # en 20 rondas de 10 tiradas
> res <- vapply(rep(10,20),moneda,c(1))
> length(res[which(res > 5)])
[1] 8
> # en 20 rondas de 20 tiradas
> res <- vapply(rep(20,20),moneda,c(1))
> length(res[which(res > 5)])
[1] 5
> # en 20 rondas de 100 tiradas
> res <- vapply(rep(100,20),moneda,c(1))
> length(res[which(res > 5)])
[1] 0
> 
> dbinom(1,1,0.5)
[1] 0.5
> dbinom(2,2,0.5)
[1] 0.25
> dbinom(3,3,0.5)
[1] 0.125
> dbinom(2,3,0.5)
[1] 0.375
> dbinom(1,3,0.5)
[1] 0.375
> 
```

## Ejemplo sobrepeso
``` R
> # Nos dicen que el 15% de la poblacion mundial tiene sobrepeso.
> # queremos saber si en Bs. As es la misma tasa
> # Tomamos una muestra aleatoria de 5 habitantes y encontramos 2 con sobrepeso.
> # H0 : Bs As tiene la misma tasa mundial, 15%
> # probabilidad de q ninguno tenga sobrepeso, siendo H0
> dbinom(0,1,0.15)
[1] 0.85
> dbinom(0,2,0.15)
[1] 0.7225
> dbinom(0,3,0.15)
[1] 0.614125
> dbinom(0,4,0.15)
[1] 0.5220062
> dbinom(0,5,0.15)
[1] 0.4437053
> dbinom(0,1,0.15) ^ 5
[1] 0.4437053
> # P(2 con sobrepeos y 3 sin)
> dbinom(2,5,.15)
[1] 0.1381781
> # P(3 con sobrepeos y 2 sin)
> dbinom(3,5,.15)
[1] 0.02438438
> # P(4 con sobrepeos y 1 sin)
> dbinom(4,5,.15)
[1] 0.002151562
> # P(5 con sobrepeos y 0 sin)
> dbinom(5,5,.15)
[1] 7.59375e-05
> # Si Bs As tuviera la misma tasa q la mundial, la prob de encontrar 2 con sobre peso en 5 es
> # P(2 con sobrepeos y 3 sin)
> dbinom(2,5,.15)
[1] 0.1381781
> # no esta entre 5% sup ni el 5% if, ie. no hay motivo para rechazar H0
> 
```

Quiero ver como superponer los grafico

https://github.com/jumanbar/Curso-R/blob/master/lecciones/graficos.R

http://www.um.es/ae/FEIR/60/
``` R
> #En el siguiente código se grafica el seno y el coseno en el intervalo [-2\pi , 2\pi] 
> plot(sin,-2*pi, 2*pi, col="red" , xlab="", ylab="")
> par(new=TRUE)
> plot(cos, -2*pi, 2*pi, col="blue" , xlab="", ylab="",  axes=FALSE) 
> title(main="Gráficas del seno y coseno")
> abline(a=0, b=0)
```
<img src="./graficos/graph3.png" width="30%" />

Volviendo al tema del sobrepeso
``` R
> plot(function(x) dbinom(x,100, 0.15),0,100, col="blue",yaxt="n",ylim = c(0, 0.12),ylab="")
> axis(4)
> text(80,0.02,labels="dbinom",col="blue")
> par(new=TRUE)
> plot(function(x) pbinom(x,100, 0.15),0,100, col="red",yaxt="n",ylim = c(0, 1.2),ylab="")
> axis(2)
> text(40,1.1,labels="pbinom",col="red")
> 
```
<img src="./graficos/graph2.png" width="60%" />

## Ejercicio 1.2.8
Un apostador empedernido lo contrata para saber si le están haciendo trampa con los
dados.
Para eso le pasa una serie de 1.000 tiradas del dado en cuestión:
``` R
> # Ejercicio 1.2.8
> # serie que se nos entrega
> serie <- c(rep(1,170),rep(2,235), rep(3,163),rep(4,105),rep(5,168),rep(6,159))
> tserie <- table(serie)
> tserie
serie
  1   2   3   4   5   6
170 235 163 105 168 159
```
En 1.2.3 vimos que promedio para 10000 tiradas = 3.527000

En 1.2.6 vimos que sd para 10000 tiradas = 1.709289

``` R
> pnorm(3.343, mean=3.527000, sd=1.709289)
[1] 0.4571378
> # [1] 0.4571378
> qnorm(0.4571378, mean=3.527000, sd=1.709289)  # matematicamente, qnorm es la inversa a pnorm
[1] 3.343
> # [1] 3.343
> qnorm(0.95, mean=3.527000, sd=1.709289)
[1] 6.33853
> # [1] 6.33853
> qnorm(0.05, mean=3.527000, sd=1.709289)
[1] 0.7154698
> # [1] 0.7154698
> plot(function(x) dnorm(x, mean=3.527000, sd=1.709289), 0, 8, main = "pnorm serie \n x=3.343 y=0.457", ylab="", yaxt="n")
> abline(v=3.34, col="blue")
> abline(h=0.457, col="blue")
> abline(v=6.33, col="red")
> abline(v=0.71, col="red")
> axis(2)
> pnorm(3.343, mean=3.527000, sd=1.709289)
[1] 0.4571378
> # [1] 0.4571378
```
No hay elemementos para desechar H0 = el dado esta equilibrado

Es probable un promedio de 3.343 en 1000 tiradas con un dado equilibrado

<img src="./graficos/graph_promedios.png" width="50%" />

Pero bajo la alfombra del promedio se puede esconder muchas cosas

Intento otra prueba

``` R
> # defino una funcion que me devuelve las veces que salio el numero que menos salio
> min_en1000 <- function(j){  # la j no la uso, es para poder usas sapply
+   x <- sample(1:6,1000,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
+   tx <- table(x)
+   mintx <- min(tx)
+ }
> # genero una serie de 100 minimos correspondientes a registrar 100 veces 1000 tiradas
> serie_min <- sapply(1:100, min_en1000)
> serie_min
  [1] 155 156 157 157 155 149 138 160 149 157 156 134 138 145 143 153 150 160
 [19] 156 149 157 146 155 152 147 156 153 146 155 157 147 159 155 155 155 155
 [37] 157 153 146 145 158 151 148 157 149 144 161 145 151 144 143 154 145 149
 [55] 159 158 156 141 147 158 139 153 147 149 154 151 151 143 145 152 148 155
 [73] 153 153 153 151 138 158 153 146 151 139 157 149 164 158 140 158 144 153
 [91] 157 154 138 151 155 153 150 151 150 152
> min(serie_min)
[1] 134
> mean(serie_min)
[1] 151.02
> sd(serie_min)
[1] 6.144686
> pnorm(105, mean=mean(serie_min), sd=sd(serie_min))
[1] 3.459522e-14
> # ahora si, muy baja, ese 105 es muy sospechoso
> # funcion de densidad con los parametros mean y sd de la serie de minimos
> plot(function(x) dnorm(x, mean=mean(serie_min), sd=sd(serie_min)), 100, 200, main = "dnorm serie minimos",ylab="")
> abline(v=105, col = "red")
> abline(v=qnorm(0.05, mean=mean(serie_min), sd=sd(serie_min)), col= "blue")
> abline(v=qnorm(0.95, mean=mean(serie_min), sd=sd(serie_min)), col= "blue")
> 
```
<img src="./graficos/graph_dnorm_minimos.png" width="50%" />

Ahora si tengo información para rechazar H0

### Prueba con t-studen
### t.test
``` R
# la serie dada
> serie <- c(rep(1,170),rep(2,235), rep(3,163),rep(4,105),rep(5,168),rep(6,159))
# una serie teorica con que compararla
> teorica <- c(rep(1,167),rep(2,167), rep(3,167),rep(4,167),rep(5,166),rep(6,166))
> test_ttest <- t.test(serie, teorica)
> print(test_ttest[["p.value"]])
[1] 0.04698786
> # [1] 0.04698786
> # p-value < 0.05
> 
```

## Prueba con binom.test
## binom.test
``` R
test_tbinom <- binom.test(105,1000,p=1/6)
print(test_tbinom)
print(test_tbinom[["p.value"]])
# [1] 3.935285e-08
# p-value < 0.05
```

