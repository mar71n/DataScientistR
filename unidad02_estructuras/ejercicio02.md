## Ejercicio 02

``` R
> # Hacer una funcion que lea un archivo csv, cree un dataframe, le asigne nombres a las
> # columnas del data frame y luego cree otra columna que sea la suma de sus dos primeras
> # columnas.
> setwd ("~/Desa/DataScientistR/unidad02_estructuras")

> ejercicio02 <- function(nombre){
+   if(file.exists(nombre)){
+     misdatos <- read.csv2(nombre)
+     if(is.numeric(misdatos[,4]) & is.numeric(misdatos[,5])){
+       df_respuesta <- as.data.frame( cbind(misdatos[,4], misdatos[,5]) )
+       names(df_respuesta) <- c("C1","C2")
+       df_respuesta$Tot <- c(df_respuesta$C1 + df_respuesta$C2)
+       df_respuesta
+     }else{
+       "Las columnas 4 y 5 tienen que ser numeric"
+     }
+   } else{
+     "No existe el archivo"
+   }
+ }

> resultado <- ejercicio02("../descargas/data/cronograma-invierno.csv")

> head(resultado)
  C1 C2 Tot
1  1  4   5
2  2  5   7
3  3  6   9
4  4  7  11
5  5  1   6
6  6  2   8
> tail(resultado)
      C1 C2 Tot
6769 101  3 104
6770 102  4 106
6771 103  5 108
6772 104  6 110
6773 105  1 106
6774 106  2 108
> names(resultado)
[1] "C1"  "C2"  "Tot"

> resultado <- ejercicio02("../descargas/data/cronograma-invierno.csvNOEXISTE")
> head(resultado)
[1] "No existe el archivo"
> tail(resultado)
[1] "No existe el archivo"
> names(resultado)
NULL
> rm("resultado","ejercicio02")
```
