
Leer un archivo csv y guardar el contenido en una variable, aplicarle el comando head
para obtener las primeras lineas, elegir un vector y encontrar los valores únicos, capturar
la pantalla y enviar.

``` R
# descargo 
# Subte: Cronograma de servicio
# Cronograma de servicio del Subte de Buenos Aires según período del año.
# https://recursos-data.buenosaires.gob.ar/ckan2/subte-cronograma/cronograma-invierno.csv

> datos <- read.csv("../descargas/data/cronograma-invierno.csv",sep=";")
> head(datos)
  PERIODO LINEA     DIA ORDEN TREN            SAL_C1   SAL_C2 INT_C1 INT_C2
1    2015     A DOMINGO     1    4 SALIDA ADELANTADA 07:45:00              
2    2015     A DOMINGO     2    5          07:32:00 08:00:30              
3    2015     A DOMINGO     3    6          07:42:00 08:09:30         09:00
4    2015     A DOMINGO     4    7          07:52:00 08:20:00         10:30
5    2015     A DOMINGO     5    1          08:00:00 08:28:00  08:00  08:00
6    2015     A DOMINGO     6    2          08:08:00 08:36:00  08:00  08:00
  FORM OBSERVACIONES
1    5              
2    5              
3    5              
4    5              
5    5              
6    5              

> unique(datos$LINEA)
[1] A B C D E H P
Levels: A B C D E H P
> 
```
