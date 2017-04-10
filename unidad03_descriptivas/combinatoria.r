## Combinatoria

# Veamos algunas f�rmulas simples que se utilizan en combinatoria y que nos pueden ayudar a calcular el n�mero de casos posibles o el n�mero de casos favorables.
## Permutaciones
# Sea un conjunto de n elementos. A las ordenaciones que se pueden hacer con estos n elementos sin repetir ning�n elemento y utiliz�ndolos todos se las denomina permutaciones. 
# El n�mero de permutaciones que se pueden realizar coincide con el factorial de n, y su c�lculo es: n! = n . (n-1) . (n-2) . ... 2 . 1
#Ejemplo:
#�De cu�ntas maneras distintas podemos alinear a seis personas en una fila?
#Respuesta:
#De 6! = 6 * 5 * 4 * 3 * 2 * 1 = 720 maneras (permutaciones de 6 elementos).
factorial(6)

## Variaciones
# Sea un conjunto de n elementos. Supongamos que deseamos ordenar r elementos de entre los n. A cada una de estas ordenaciones la denominamos variaci�n. 
# El n�mero de variaciones que se pueden hacer de los n elementos tomados de r en r es: Vrn = n . (n-1) .... (n-r+1)
# Ejemplo:
# En una carrera de velocidad compiten diez atletas. �De cu�ntas maneras distintas podr�a estar formado el podio? 
# (el podio lo forman el primer, el segundo y el tercer clasificado)
# Respuesta:
# Cada podio posible es una variaci�n de diez elementos tomado de tres en tres.
# Por tanto, el n�mero posible de podios es: V 3 10 = 10 . 9 . 8 = 720
prod(seq(10,(10-3+1)))

## Variaciones con repetici�n
# Sea un conjunto de n elementos. Supongamos que se trata de ordenar r elementos que pueden estar repetidos. Cada ordenaci�n es una variaci�n con repetici�n. 
# El n�mero de variaciones con repetici�n para un conjunto de n tomados de r en r es : RVrn = n ^ r
# Ejemplo:
# En una urna tenemos cinco bolas numeradas del 1 al 5. Se extraen tres bolas sucesivamente con reposici�n (devolviendo cada vez la bola a la urna). 
# �Cu�ntos resultados distintos es posible obtener?
# Respuesta:
# Se trata de variaciones con repetici�n de un conjunto de cinco bolas tomadas de tres en tres.
# En total tendremos: RV 3 5 = 5 ^ 3 = 125
5 ^ 3

## Combinaciones
# Cuando se trata de contar el n�mero de subconjuntos de x elementos en un conjunto de n elementos 
# tenemos lo que se denomina combinaciones de x elementos en un conjunto de n. 
# El c�lculo del contaje se hace mediante el n�mero combinatorio, de la manera siguiente:
#         (n)
# C x n = (x) = n! / x! . (n-x)!
# Ejemplo:
# �De cu�ntas maneras podemos elegir, en la urna anterior (recordemos que hab�a cinco bolas), tres bolas en una �nica extracci�n?
# Respuesta:
# Ser�n combinaciones de cinco elementos tomados de tres en tres, por tanto, tendremos:
#         (5)
# C 3 5 = (3) = 5! / 3! . (5-3)! = 10
factorial(5) / (factorial(3) * factorial(5-3))

## Permutaciones con repetici�n
# Sea un conjunto de n elementos, de entre los cuales tenemos a elementos indistinguibles entre s�, b elementos indistinguibles entre s�, c elementos indistinguibles entre s�, etc. 
# Cada ordenaci�n de estos elementos se denominar� permutaci�n con repetici�n. El n�mero de permutaciones con repetici�n es: RP a,b,c,... n = n! / (a! . b! . c! ...)
# Ejemplo:
# �Cuantas palabras con sentido o sin �l pueden formarse con las letras PATATA?
# Respuesta:
# Tenemos tres veces la letra A, dos veces la T y una vez la P.
# Por tanto, ser�n: RP 3,2,1 6 = 6! / 3!.2!.1! = 60
factorial(6) / (factorial(3) * factorial(2) * factorial(1))

factorial(170)
prod(seq(170,1))
