# Hacer una funcion que lea un archivo csv, cree un dataframe, le asigne nombres a las
# columnas del data frame y luego cree otra columna que sea la suma de sus dos primeras
# columnas.

setwd ("~/Desa/DataScientistR/unidad02_estructuras")

ejercicio02 <- function(nombre){
  if(file.exists(nombre)){
    misdatos <- read.csv2(nombre)
    if(is.numeric(misdatos[,4]) & is.numeric(misdatos[,5])){
      df_respuesta <- as.data.frame( cbind(misdatos[,4], misdatos[,5]) )
      names(df_respuesta) <- c("C1","C2")
      df_respuesta$Tot <- c(df_respuesta$C1 + df_respuesta$C2)
      df_respuesta
    }else{
      "Las columnas 4 y 5 tienen que ser numeric"
    }
  } else{
    "No existe el archivo"
  }
}

resultado <- ejercicio02("../descargas/data/cronograma-invierno.csv")

head(resultado)
tail(resultado)
names(resultado)

resultado <- ejercicio02("../descargas/data/cronograma-invierno.csvNOEXISTE")

head(resultado)
tail(resultado)
names(resultado)

rm("resultado","ejercicio02")
ls()


test <- read.table(header=TRUE, text='
   colA  colB
      4    10
      7     4 
      7    22 
      8    16
      9    10
     10    18
')

test1 <- test
test2 <- test
test3 <- test
test4 <- test

class(test1[["colA"]])
class(test1["colA"])

test1 <- data.frame(test1, colC = cbind(test1[["colA"]]+ test1[["colB"]]))
test1

test2 <- data.frame(test2, colC = cbind(test2["colA"] + test2["colB"]))
test2

test3 <- data.frame(test3, colC = test3["colA"] + test3["colB"])
test3

test4 <- data.frame(test4, colC = test4[["colA"]]+ test4[["colB"]])
test4

colC = test1[["colA"]] + test1[["colB"]]
class(colC)

colC = test1["colA"] + test1["colB"]
class(colC)

str(test)
test[["colA"]]
test$colA