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
 
binom.test(12,30,p=1/6)

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


## ejemplo dados ejercicio 1.2.8

binom.test(105,1000,p=1/6)

respuestas <- c(170, 235, 163, 105, 168, 159)
probabilidad <- c(1/6,1/6,1/6,1/6,1/6,1/6)
test <- chisq.test(respuestas, p=probabilidad)
print(test)


