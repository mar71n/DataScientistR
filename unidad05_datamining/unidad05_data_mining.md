# Data Mining

## Decisions tree y random forest
**Arboles de decision:** mecanismo para detectar patrones y ganar conocimiento

**Reduccion de cantidad de atributos:** quedarnos con un conjunto de atributos *no correlacionados*

**Seleccion de muestras:** 2/3 *training* - 1/3 *testing*

**Algoritmos de creacion de arboles:** Cada divicion es un *nodo*, si no tiene division *hoja*.
Para cada atributo no utilizado busco el que mejor divide, asi hasta que no quedan atributos o ninguno divide bien.
Los algoritmos más difundidos son *CART*, *Ganancia de Entropía*, *C4.5* y *DKM*

**Podas:** Probando con el set de *testing*, eliminar las diviciones que no cumplan algun estandar de calidad. Estas incurren en *Sobre Ajuste*, ie. se fijan en casos particulares de la muestra pero irrelevantes en el universo.

* Prepoda: durante la construccion si ya veo que el nodo no conduce a nada.

* Postpoda: se divide hasta el final, y se elimina los que no alcanzan la calidad.

**Re-estructuracion:** A medida que se agregan casos, puede ser necesario modificar los nodos.

**Random Forest:** Generar arboles al azar, dentro de un rango, y probar cual es mejor.

## Decision tree con el paquete party

La función **ctree()** construye el arbol de decisiones, mientras que la función **predict()** hace las predicciones para nuevos datos.

``` R
> # seleccion de muestras
> setwd ("/home/tuxtin/Desa/DataScientistR/unidad05_datamining")
> set.seed(1234)
> ind <- sample(2, nrow(iris), replace = TRUE, prob=c(0.7, 0.3))
> trainData <- iris[ind==1,]
> testData <- iris[ind==2,]
> 
```

``` R
> # construir el arbol
> # install.packages("party")
> library(party)
Loading required package: grid
Loading required package: mvtnorm
Loading required package: modeltools
Loading required package: stats4
Loading required package: strucchange
Loading required package: zoo

Attaching package: ‘zoo’

The following objects are masked from ‘package:base’:

    as.Date, as.Date.numeric

Loading required package: sandwich
> myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length +  Petal.Width
> iris_ctree <- ctree(myFormula, data = trainData)
> 
```

El modelo generado a partir del comando **ctree()** lo hemos guardado en una variable llamada *'iris_ctree'*.

``` R
> # obtener las predicciones
> table(predict(iris_ctree), trainData$Species)
            
             setosa versicolor virginica
  setosa         40          0         0
  versicolor      0         37         3
  virginica       0          1        31
> 
```

``` R
> # ver las predicciones en detalle
> predict(iris_ctree)
  [1] setosa     setosa     setosa     setosa     setosa     setosa
  [7] setosa     setosa     setosa     setosa     setosa     setosa
  ...
 [91] virginica  virginica  virginica  virginica  virginica  virginica 
 [97] virginica  virginica  versicolor virginica  virginica  versicolor
[103] virginica  virginica  virginica  virginica  virginica  virginica 
[109] virginica  virginica  virginica  virginica 
Levels: setosa versicolor virginica
```

``` R
> # ver las reglas para el arbol construido
> print(iris_ctree)

	 Conditional inference tree with 4 terminal nodes

Response:  Species 
Inputs:  Sepal.Length, Sepal.Width, Petal.Length, Petal.Width 
Number of observations:  112 

1) Petal.Length <= 1.9; criterion = 1, statistic = 104.643
  2)*  weights = 40 
1) Petal.Length > 1.9
  3) Petal.Width <= 1.7; criterion = 1, statistic = 48.939
    4) Petal.Length <= 4.4; criterion = 0.974, statistic = 7.397
      5)*  weights = 21 
    4) Petal.Length > 4.4
      6)*  weights = 19 
  3) Petal.Width > 1.7
    7)*  weights = 32 
> 
```

``` R
> # graficar el arbol
> plot(iris_ctree)
```
<img src="./graficos/arbol_party.png" width="80%" />

``` R
> # graficar el arbol menos detalles
> plot(iris_ctree, type='simple')
> 
```
<img src="./graficos/arbol_party_simple.png" width="50%" />

Los y = (p1, p2, p3) indican p1: P(Setosa), p2: P(Versicolor), p3: P(Virginia)

El número 'p' que aparece debajo de cada variable indica el valor de significación estadística de la división

Verificar la bondad del modelo usando los datos del *subconjunto de validación* ('testData'), para lo cual usamos el comando **predict()** pero ahora aplicado al *conjunto de validación*.

``` R
> # predict on test data
> testPred <- predict(iris_ctree, newdata = testData)
> table(testPred, testData$Species)
            
testPred     setosa versicolor virginica
  setosa         10          0         0
  versicolor      0         12         2
  virginica       0          0        14
> 
```

Solo dos elementos fuera de la diagonal. Muy bueno.


