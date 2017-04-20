plot(function (x) x*x, 0, 10, main="tt")

plot(function(x) dnorm(x, mean=1.462, sd=0.173664), 0.5, 2.5, main = "dnorm(x, mean=1.462, sd=0.173664)",ylab="")

plot(function(x) pnorm(x, mean=1.462, sd=0.173664), 0.5, 2.5, main = "pnorm(x, mean=1.462, sd=0.173664)",ylab="")

plot(function(x) dbinom(x, 100, 0.15), 0, 100,  main = "dbinom",ylab="", type="p")

plot(function(x) pbinom(x, 100, 0.15), 0, 100,  main = "pbinom",ylab="", type="p")

plot(function(x) dunif(x, 0, 25), 0, 100,  main = "dunif",ylab="", type="p")

plot(function(x) dbinom(x, 1000, 1/6), 0, 400,  main = "dbinom",ylab="", type="l",col="blue")
abline(v=170)

plot(function(x) pbinom(x, 1000, 1/6), 0, 400,  main = "pbinom",ylab="", type="l", col="red")
abline(v=170)
abline(h=pbinom(170, 1000, 1/6))

pbinom(170, 1000, 1/6)

binom.test(300,300,p=0.5)

binom.test(105,1000,p=1/6)

binom.test(165,1000,p=1/6)

## binom.test
# https://rpro.wikispaces.com/Test+binomial+para+dos+frecuencias
# El test binomial se utiliza para ver si una variable con dos estados 
# (como la cara y cruz de una moneda) se ajusta a una probabilidad determinada.
# Al lanzar un dado 30 veces se obtienen 12 veces el 2
# ¿Se ajusta a una probabilidad de 1/6?
test_binom <- binom.test(12,30,p=1/6)
print(test_binom)
str(test_binom)
mean(test_binom$conf.int)
plot(0:15, pbinom(0:15, 30, 0.15), type="l")
abline(v=12)
abline(v=8)
abline(v=1)
# Como p-value < 0.05 el resultado obtenido no se ajusta a lo esperado en un dado.


## chisq.test
# https://rpro.wikispaces.com/Test+Chi+cuadrado+para+frecuencias+observadas+y+esperadas
# La prueba x^2 se utiliza para comprobar si unas frecuencias observadas se ajustan a unas esperadas. 
# Las frecuencias esperadas se expresan en tanto por uno (como probabilidades).
# Test de chi-cuadrado
# Al responder 30 personas una encuesta con respuestas: mucho, normal, poco; se obtienen los resultados:
# 15, 5, 10, respectivamente
# ¿Estos resultados son significativamente distintos de unas respuestas equiprobables, es decir, 10, 10, 10?
respuestas <- c(15,5,10)
probabilidad <- c(1/3,1/3,1/3)
test <- chisq.test(respuestas, p=probabilidad)
print(test)
# Como p-value > 0.05 no podemos rechazar el que las respuestas sean equiprobables.

## t.test
# La t de Student se utiliza para comprobar la igualdad de las medias de dos muestras. 
# También para comprobar si la media de una muestra es igual a una media teórica determinada. 
# Los datos tienen que tener distribución normal (véase la prueba de Shapiro-Wilk. 
# En el caso de que este requisito no se cumpla se puede utilizar en su lugar la prueba de los rangos con signo de Wilcoxon.
# Comparación de dos medias, t de student
# Prueba paramétrica
set.seed(10)
x1 <- rnorm(100,10) # Variable aleatoria de media 10
x2 <- rnorm(100,10.5) # Variable aleatoria de media 10.5
test <- t.test(x1,x2) # Prueba t de Student
print(test)
# Dado que p-value < 0.05 podemos afirmar que las muestras difieren en su media.


## ejemplo dados ejercicio 1.2.8

## binom.test
binom.test(105,1000,p=1/6)
fbinom <- function(x){
  binom.test(x,1000,p=1/6)[["p.value"]]
}
vapply(100:200, FUN=fbinom, c(1))
plot(100:200, vapply(100:200, FUN=fbinom, c(1)))
plot(function(x) pbinom(x, 1000, 1/6), 100, 200,  main = "pbinom",ylab="", type="p")
# 95 percent confidence interval: 0.08668482 0.12567685
qbinom(0.05, 1000, 1/6)  # 147
qbinom(0.95, 1000, 1/6)  # 186

## chisq.test
respuestas <- c(170, 235, 163, 105, 168, 159)
probabilidad <- c(1/6,1/6,1/6,1/6,1/6,1/6)
test <- chisq.test(respuestas, p=probabilidad)
print(test)

## t.test
serie <- c(rep(1,170),rep(2,235), rep(3,163),rep(4,105),rep(5,168),rep(6,159))
aleatoria <- sample(1:6,1000,replace=TRUE,prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
t.test(serie, aleatoria)
teorica <- c(rep(1,167),rep(2,167), rep(3,167),rep(4,167),rep(5,166),rep(6,166))
t.test(serie, teorica)
