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

# seleccion de muestras
data("bodyfat", package = "TH.data")
dim(bodyfat)
head(bodyfat)
names(bodyfat)

ind <- sample(2, nrow(bodyfat), replace = TRUE, prob= c(0.7, 0.3))

bodyfat.train <- bodyfat[ind==1,]
bodyfat.test <- bodyfat[ind==2,]

# construir el arbol
library(rpart)

myFormula <- DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth

bodyfat_rpart <- rpart(myFormula, data = bodyfat.train, control = rpart.control(minsplit = 10))

attributes(bodyfat_rpart)

print(bodyfat_rpart$cptable)

# el minimo xerror
opt <- which.min(bodyfat_rpart$cptable[,"xerror"])
# el CP correspondiente
cp <- bodyfat_rpart$cptable[opt, "CP"]

# podamos aplicando prune() al arbol del modelo original (bodyfat_rpart) con CP = cp
bodyfat_prune <- prune(bodyfat_rpart, cp = cp)
print(bodyfat_prune)

# las prediciones con predict()
DEXfat_pred <- predict(bodyfat_prune, newdata=bodyfat.test)
xlim <- range(bodyfat$DEXfat)
plot(DEXfat_pred ~ DEXfat, data=bodyfat.test, xlab="Observed", ylab="Predicted", ylim=xlim, xlim=xlim)
abline(a=0, b=1)

## Random Forest
# seleccion de muestras
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

# install.packages("randomForest")
library(randomForest)

# creamos el randomfores
rf <- randomForest(Species ~ ., data=trainData, ntree=100, proximity=TRUE)
table(predict(rf), trainData$Species)

# ver error de clasificacion
print(rf)

# graficar el error del modelo
plot(rf)

# el plot muestra la matrix rf$err.rate
# lo mejoro
matplot(rf$err.rate, type="l", ylab="Error", xlab="trees", main="rf")
legend("topright", col=palette(), legend=c("00B","setosa","versicolor","virginia"), pch=1)

# importancia de las variables predictoras
importance(rf)

varImpPlot(rf)

# prediccion y comparacion contra testData
irisPred <- predict(rf, newdata=testData)
table(irisPred, testData$Species)

## Clase interactiva
## Árboles de decisión
# Reducción de la cantidad de atributos

Navegacion <- read.csv2("../descargas/unidad03/Mascotas_2a/Navegacion_csv.txt")
head(Navegacion)
nrow(Navegacion)  # [1] 1.048.573
range(Navegacion[["IdDueno"]])  # [1]    0 7999
Duenos <- read.csv2("../descargas/unidad03/Mascotas_2a/Duenos_csv.txt")
head(Duenos)
nrow(Duenos)  # [1] 5.665
range(Duenos[["IdDueno"]])  # [1] NA NA
Duenos[is.na(Duenos$IdDueno),]  # hay un registro con IdDueño en NA

datos_cor_v_d <- merge(Navegacion, Duenos, by.x="IdDueno", by.y="IdDueno")
head(datos_cor_v_d)
nrow(datos_cor_v_d)  # [1] 741.887
datos_cor_v_d[is.na(datos_cor_v_d$IdDueno),]

Mascotas <- read.csv2("../descargas/unidad03/Mascotas_2a/Mascotas_csv.txt")
head(Mascotas)
datos_cor_v_d_m <- merge(datos_cor_v_d, Mascotas, by.x="IdDueno", by.y="IdDueno")
head(datos_cor_v_d_m)
nrow(datos_cor_v_d_m)  # [1] 924.214

# reduccio de cantidad de atributos
names(datos_cor_v_d_m)
datos_cor_v_d_m$Id.x <- NULL
datos_cor_v_d_m$Id.y <- NULL
datos_cor_v_d_m$IdDueno <- NULL
datos_cor_v_d_m$IdPagina <- NULL
datos_cor_v_d_m$Sexo.x <- NULL
datos_cor_v_d_m$Sexo.y <- NULL
datos_cor_v_d_m$Secuencia <- NULL

cor_datos <- cor(datos_cor_v_d_m)
print(cor_datos)
# la idea es que si hay atributos coorelacionados, me quedo con uno solo de esos

# sigo limpiando
datos_cor_v_d_m$Perros <- NULL
datos_cor_v_d_m$Gatos <- NULL
datos_cor_v_d_m$IdMascota <- NULL
datos_cor_v_d_m$IdEspecie <- NULL
datos_cor_v_d_m$IdRaza <- NULL
# datos_cor_v_d_m$Edad.y <- NULL
names(datos_cor_v_d_m)
head(datos_cor_v_d_m)

cor_datos <- cor(datos_cor_v_d_m)
print(cor_datos)

# estos dos estan correlacionados con venta
datos_cor_v_d_m$DT <- NULL
datos_cor_v_d_m$Importe <- NULL
datos_cor_v_d_m$Total <- NULL

## generacion de muestras
# Creo los vectores de selección para si y no:
xsi <- which(datos_cor_v_d_m$Venta==1)
xno <- which(datos_cor_v_d_m$Venta==0)
length(xsi)
# [1] 54144
length(xno)
# [1] 870070

# Selecciono separando ventas si y ventas no
hsi<-datos_cor_v_d_m[xsi,]
nrow(hsi)
# [1] 54144
hno<-datos_cor_v_d_m[xno,]
nrow(hno)
# [1] 870070

# Me quedo con el 70% del si y el 7% del no
# porque esta muy desbalanceado 50.000 vs 870.000
xsi <- runif(nrow(hsi))
xno <- runif(nrow(hno))
xsi_train <- which(xsi<.7)
xno_train <- which(xno<.07)
hsi_train <- hsi[xsi_train,]
hno_train <- hno[xno_train,]
nrow(hsi_train)
# aprox [1] 38000
nrow(hno_train)
# aprox [1] 60800

# Junto los dos trozos de h_train y h_test
h_train <- rbind(hsi_train,hno_train)
nrow(h_train)
# aprox [1] 98545
# armo el test
xsi_test <- which(xsi>=.7)
xno_test <- which(abs(xno-.1)<.03)
hsi_test <- hsi[xsi_test,]
hno_test <- hno[xno_test,]
h_test <- rbind(hsi_test,hno_test)
nrow(h_test)
# aprox [1] 68910

## Paquete party
library(party)
names(h_train)
formula <- Venta ~ Edad.y + Edad.x + Ingreso + Peso
train_tree <- ctree(formula, data = h_train)
plot(train_tree, type="simple")

# corrijo controls
train_tree <- ctree(formula, data = h_train, controls = ctree_control(mincriterion = .42))
plot(train_tree,type="simple")

