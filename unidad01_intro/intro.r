# unidad 1 Elementos de sintaxis de R
getwd()
setwd("~/Desa/DataScientistR/")
ls()

a <- 2
b <- 5

ls()

available.packages()
setwd("~/Desa/DataScientistR/unidad01_intro/")
# redirecciono la salida a file
cat(available.packages(), file="packages.txt")

args(rnorm)
args(available.packages)

library(datasets)

ls(package:datasets)

data(iris)
head(iris)
