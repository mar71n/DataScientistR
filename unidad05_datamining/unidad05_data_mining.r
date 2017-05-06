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
heatmap(distMatrix)

## Decisions tree y random forest

## Decision tree con el paquete party

# seleccion de muestras
set.seed(1234)
ind <- sample(2, nrow(iris), replace = TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

# construir el arbol
# install.packages("party")
library(party)
myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length +  Petal.Width

iris_ctree <- ctree(myFormula, data = trainData)

# obtener las predicciones
table(predict(iris_ctree), trainData$Species)

# ver las predicciones en detalle
predict(iris_ctree)

# ver las reglas para el arbol construido
print(iris_ctree)

# graficar el arbol
plot(iris_ctree)

# graficar el arbol menos detalles
plot(iris_ctree, type='simple')

# predict on test data
testPred <- predict(iris_ctree, newdata = testData)
table(testPred, testData$Species)

## Decisions trees con el paquete rpart

data("bodyfat", package = "TH.data")
dim(bodyfat)
head(bodyfat)
names(bodyfat)

ind <- sample(2, nrow(bodyfat), replace = TRUE, prob= c(0.7, 0.3))

bodyfat.train <- bodyfat[ind==1,]
bodyfat.train <- bodyfat[ind==2,]

library(rpart)

myFormula <- DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth

bodyfat_rpart <- rpart(myFormula, data = bodyfat.train, control = rpart.control(minsplit = 10))

attributes(bodyfat_rpart)

print(bodyfat_rpart$cptable)

## Clase interactiva
## Árboles de decisión
# Reducción de la cantidad de atributos

Navegacion <- read.csv2("../descargas/unidad03/Mascotas_2a/Navegacion_csv.txt")
head(Navegacion)
nrow(Navegacion)  # [1] 1.048.573
range(Navegacion[["IdDueño"]])  # [1]    0 7999
Duenos <- read.csv2("../descargas/unidad03/Mascotas_2a/Duenos_csv.txt")
head(Duenos)
nrow(Duenos)  # [1] 5.665
range(Duenos[["IdDueño"]])  # [1] NA NA
Duenos[is.na(Duenos$IdDueño),]  # hay un registro con IdDueño en NA

datos_cor_v_d <- merge(Navegacion, Duenos, by.x="IdDueño", by.y="IdDueño")
head(datos_cor_v_d)
nrow(datos_cor_v_d)  # [1] 741.887
datos_cor_v_d[is.na(datos_cor_v_d$IdDueño),]

Mascotas <- read.csv2("../descargas/unidad03/Mascotas_2a/Mascotas_csv.txt")
head(Mascotas)
datos_cor_v_d_m <- merge(datos_cor_v_d, Mascotas, by.x="IdDueño", by.y="IdDueño")
head(datos_cor_v_d_m)
nrow(datos_cor_v_d_m)  # [1] 924.214

# reduccio de cantidad de atributos
names(datos_cor_v_d_m)
datos_cor_v_d_m$Id.x <- NULL
datos_cor_v_d_m$Id.y <- NULL
datos_cor_v_d_m$IdDueño <- NULL
datos_cor_v_d_m$IdPágina <- NULL
datos_cor_v_d_m$Sexo.x <- NULL
datos_cor_v_d_m$Sexo.y <- NULL
datos_cor_v_d_m$Secuencia <- NULL

cor_datos <- cor(datos_cor_v_d_m)
print(cor_datos)

