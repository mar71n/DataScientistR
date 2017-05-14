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

## Clustering jerárquico

# trabajo en una copia
iris2 <- iris
# vacio la variable objetivo
iris2$Species <- NULL

# armo el cluster y lo guardo en hc
hc <- hclust(dist(iris2), method="complete")
plot(hc, hang = -2, labels = FALSE)
rect.hclust(hc, k=3)

groups <- cutree(hc, k=3)
table(iris$Species, groups)

## Clustering basado en densidad

# install.packages("fpc")
library(fpc)
# requiere que la clase objetivo no este presente
iris2 <- iris[-5]

# genero los cluster y los comparo
ds <- dbscan(iris2, eps=0.42, MinPts=5)
table(ds$cluster, iris$Species)

# grafico
plot(ds, iris2)

# algunos subgraficos
plot(ds, iris2[c(1,4)])

# se pueden mostra los cluster con:
plotcluster(iris2, ds$cluster)


## ejemplo etiquetar datos nuevos

library(fpc)
# requiere que la clase objetivo no este presente
iris2 <- iris[-5]

# genero los cluster y los comparo
ds <- dbscan(iris2, eps=0.42, MinPts=5)

set.seed(877)
idx <- sample(1:nrow(iris), 10)
newData <- iris[idx,-5]
# ruidos aleatorios generados con una distribución uniforme mediante la función runif().
newData <- newData + matrix(runif(10*4, min=0, max=0.2), nrow=10, ncol=4)
# etiquetamos los datos nuevos
myPred <- predict(ds, iris2, newData)
# plot result
plot(iris2[c(1,4)], col=1+ds$cluster)
points(newData[c(1,4)], pch="*", col=1+myPred, cex=3)

# chequamos los clusters
table(myPred, iris$Species[idx])

## Support Vector Machines

# install.packages("e1071")
# install.packages("mlbench")
library(e1071)
library(rpart)
# separo los datos en trainset y testset
data(Glass, package="mlbench")
index <- 1:nrow(Glass)
testindex <- sample(index, trunc(length(index)/3))
testset <- Glass[testindex,]
trainset <- Glass[-testindex,]

# comparar modelo basado en SVM con otro basado en árboles de decision.

# svm
svm.model <- svm(Type ~ ., data = trainset, cost = 100, gamma= 1)
svm.pred <- predict(svm.model, testset[,-10])  # La variable dependiente 'Type' está en la columna número 10

# rpart
rpart.model <- rpart(Type ~ ., data = trainset)
rpart.pred <- predict(rpart.model, testset[,-10], type= "class")

# SVM
table(pred = svm.pred, true = testset[,10])

# Arbol
table(pred = rpart.pred, true = testset[,10])

# analisi de una aplicacion de regresion no lineal
library(e1071)
library(rpart)
data(Ozone, package="mlbench")
# split data into a train and test set
index <- 1:nrow(Ozone)
testindex <- sample(index, trunc(length(index)/3))
testset <- na.omit(Ozone[testindex,-3])
trainset <- na.omit(Ozone[-testindex,-3])

# svm
svm.model <- svm(V4 ~ ., data = trainset, cost = 1000, gamma =0.0001)
svm.pred <- predict(svm.model, testset[,-3])
# rpart
rpart.model <- rpart(V4 ~ ., data = trainset)
rpart.pred <- predict(rpart.model, testset[,-3])

# Una manera rápida de comparar los resultados es con un gráfico de dispersión:
# SVM
plot(svm.pred,testset$V4)
abline(0,1)

# arbol
plot(rpart.pred,testset$V4)
abline(0,1)
