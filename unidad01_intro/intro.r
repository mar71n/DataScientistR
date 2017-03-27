# unidad 1 Elementos de sintaxis de R
getwd()
setwd("~/Desa/DataScientistR/")
# setwd("../Desa/DataScientistR/")
ls()

a <- 2
b <- 5

ls()

available.packages()
setwd("~/Desa/DataScientistR/unidad01_intro/")
# setwd("./unidad01_intro/")
# redirecciono la salida a file
cat(available.packages(), file="packages.txt")

args(rnorm)
args(available.packages)

library(datasets)

ls("package:datasets")

data(iris)
head(iris)

?seq

seq(from, to)
seq(5,17)

seq(from, to, by= )
seq(22,0, by = -3)

seq(from, to, length.out= )
seq(0,10, length.out = 15)

seq(along.with= )
seq(along.with = c("uno","hola","mas","menos","por","chau"))

seq(from)
seq(-10)

seq(length.out= )
seq(length.out = 10 )

-5:3

rep(c(2,3,4),c(3,2,1))
repetidos <- rep(c(2,3,4),c(3,2,1))
unique(repetidos)

# descargo
# Subte: Cronograma de servicio
# Cronograma de servicio del Subte de Buenos Aires según período del año.
# https://recursos-data.buenosaires.gob.ar/ckan2/subte-cronograma/cronograma-invierno.csv
datos <- read.csv("../descargas/data/cronograma-invierno.csv",sep=";")

head(datos)

unique(datos$LINEA)
