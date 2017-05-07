## Data mining
## Clustering: k-medoids

# repaso kmean

# trabajo en una copia
iris2 <- iris
# vacio la variable objetivo
iris2$Species <- NULL
# armo el cluster y lo guardo en kmeans.result
kmeans.result <- kmeans(iris2, 3)

# comparo el resultado con el set original
table(iris$Species, kmeans.result$cluster)

# graficamente
plot(iris2[c("Sepal.Length", "Sepal.Width")], col = kmeans.result$cluster)
# plot cluster centers
points(kmeans.result$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:3,pch = 8, cex=2)

## k-medoids
# ejemplo con pamk() (deduce el numero optimo de clusters)
# install.packages("fpc")
library(fpc)
pamk.result <- pamk(iris2)
pamk.result$nc  # deduce 2 cluster mmmm

# vemos como asigno. Mezclo dos categorias
table(pamk.result$pamobject$clustering, iris$Species)

str(pamk.result)
pamk.result$crit
pamk.result$pamobject$silinfo$clus.avg.widths
pamk.result$pamobject$call
pamk.result$pamobject$silinfo$clus.avg.width

# graficamente
layout(matrix(c(1,2),1,2)) # 2 graficos por pagina
plot(pamk.result$pamobject)

# ahora usemos pam() indicando 3 clusters
library(cluster)
pam.result <- pam(iris2, 3)
table(pam.result$clustering, iris$Species)
layout(matrix(c(1,2),1,2)) # 2 graficos por pagina
plot(pam.result)

