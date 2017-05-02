## Data mining
## Clustering: k-medoids

# repaso kmean
iris2 <- iris
iris2$Species <- NULL
kmeans.result <- kmeans(iris2, 3)

table(iris$Species, kmeans.result$cluster)

plot(iris2[c("Sepal.Length", "Sepal.Width")], col = kmeans.result$cluster)
# plot cluster centers
points(kmeans.result$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:3,pch = 8, cex=2)

# k-medoids
install.packages("fpc")
library(fpc)
pamk.result <- pamk(iris2)
pamk.result$nc

table(pamk.result$pamobject$clustering, iris$Species)

str(pamk.result)
pamk.result$crit
pamk.result$pamobject$silinfo$clus.avg.widths
pamk.result$pamobject$call
pamk.result$pamobject$silinfo$clus.avg.width

layout(matrix(c(1,2),1,2)) # 2 graficos por pagina
plot(pamk.result$pamobject)

library(cluster)
pam.result <- pam(iris2, 3)
table(pam.result$clustering, iris$Species)
layout(matrix(c(1,2),1,2)) # 2 graficos por pagina
plot(pam.result)

