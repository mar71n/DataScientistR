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
