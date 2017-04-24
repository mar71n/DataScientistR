## Unidad 05
## Data Mining

data(iris)
plot(iris$Petal.Length, iris$Sepal.Width)

pairs(iris)

# install.packages("scatterplot3d")
library(scatterplot3d)
scatterplot3d(iris$Petal.Width, iris$Sepal.Length, iris$Sepal.Width)
scatterplot3d(iris$Petal.Width, iris$Sepal.Length, iris$Sepal.Width, type="h")

# dist(x) calcula por defecto la distacia euclidiana entre las filas de x
mm <- matrix(c(0,1,0,1), nrow=2, ncol=2)
mm
#     [,1] [,2]
#[1,]    0    0
#[2,]    1    1
dist(mm)
#         1
#2 1.414214

mm <- as.matrix(rbind(c(0,0),c(1,1),c(0,1)))
mm
#     [,1] [,2]
#[1,]    0    0
#[2,]    1    1
#[3,]    0    1
dist(mm)
#         1        2
#2 1.414214         
#3 1.000000 1.000000

distMatrix <- as.matrix(dist(iris[,1:4]))

