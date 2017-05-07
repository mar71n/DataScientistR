# Data Mining

## Clustering: k-medoids

Recordando k-means

``` R
> # repaso kmean
> # trabajo en una copia
> iris2 <- iris
> # vacio la variable objetivo
> iris2$Species <- NULL
> # armo el cluster y lo guardo en kmeans.result
> kmeans.result <- kmeans(iris2, 3)
> # comparo el resultado con el set original
> table(iris$Species, kmeans.result$cluster)
            
              1  2  3
  setosa     50  0  0
  versicolor  0 48  2
  virginica   0 14 36
> 
```

La especie *"setosa"* puede ser separado de los otros clusters, *"versicolor"* y *"virginica"* están bastante superpuestos.

``` R
> # graficamente
> plot(iris2[c("Sepal.Length", "Sepal.Width")], col = kmeans.result$cluster)
> # plot cluster centers
> points(kmeans.result$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:3,pch = 8, cex=2)
> 
```
<img src="./graficos/kmeans_repaso.png" width="50%" />

### k-medoids

En el algoritmo *k-means* un cluster es representado por su centro , en *k-medoids* por el objeto más cercano al centro.
*k-medoids* es más robusto cuando se tiene presencia de *outliers*.

Algoritmos para *k-medoids*: **PAM** (Partitioning Around Medoids), no es muy eficiente para grandes volúmenes. **CLARA** arma muestras y aplica PAM, mas eficiente.
Las funciones son **pam()** y **clara()** del paquete *cluster*.

**pamk()** incluida en el paquete *fpc*, no es necesario dar el número de clusters.

``` R
> # ejemplo con pamk() (deduce el numero optimo de clusters)
> library(fpc)
> pamk.result <- pamk(iris2)
> pamk.result$nc
[1] 2
```
Deduce 2 como numero de cluster. no good.

``` R
> table(pamk.result$pamobject$clustering, iris$Species)
   
    setosa versicolor virginica
  1     50          1         0
  2      0         49        50
> 
```
No puede distinguir bien entre *versicolor* y *virginica*.

``` R
> # graficamente
> layout(matrix(c(1,2),1,2)) # 2 graficos por pagina
> plot(pamk.result$pamobject)
> 
```
<img src="./graficos/cluster_silhouette.png" width="90%" />

Como el valor promedio de *'Average silhouette width'* es de 0.81 para el primer cluster, el mismo está **bien identificado**.
No pasa lo mismo con el segundo cluster, con un valor promedio de *'Average silhouette width'* de 0.62, que es relativamente bajo. El segundo cluster está mucho más **mezclado**.

ahora usemos pam() indicando 3 clusters
``` R
> # ahora usemos pam() indicando 3 clusters
> library(cluster)
> pam.result <- pam(iris2, 3)
> table(pam.result$clustering, iris$Species)
   
    setosa versicolor virginica
  1     50          0         0
  2      0         48        14
  3      0          2        36
> layout(matrix(c(1,2),1,2)) # 2 graficos por pagina
> plot(pam.result)
> 
```
<img src="./graficos/pam_silhouette.png" width="90%" />

No es sencillo determinar cual de los dos métodos presentados es el mejor (sin saber de antemano el resultado!)
Siguiendo con el ejemplo de clustering, una buena práctica sería probar varias técnicas (y distintos parámetros para cada una de ellas) y luego promediar los resultados.


