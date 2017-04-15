# Unidad 3
## Ejercicios base mascotas
``` R
> # Unidad 3

> file.exists("../descargas/unidad03/Mascotas_2a/ClasificacionProductos_csv.txt")
[1] TRUE
> ClasificacionProductos <- read.csv2("../descargas/unidad03/Mascotas_2a/ClasificacionProductos_csv.txt")
> head(ClasificacionProductos)
  Id IdProducto   Tipo
1  1          1   Vets
2  2          2   Vets
3  3          3   Vets
4  4          4   Vets
5  5          5   Vets
6  6          6 Jardín
> tail(ClasificacionProductos)
   Id IdProducto   Tipo
5   5          5   Vets
6   6          6 Jardín
7   7          7 Jardín
8   8          8 Jardín
9   9          9 Pileta
10 10         10 Pileta
> names(ClasificacionProductos)
[1] "Id"         "IdProducto" "Tipo"      
```
``` R
> ProductosxPagina <- read.csv2("../descargas/unidad03/Mascotas_2a/ProductosxPagina_csv.txt")
> head(ProductosxPagina)
  IdPágina IdProducto Tipo
1        1          9    3
2        2          8    2
3        3          2    1
4        4          9    3
5        5          7    2
6        6          7    2
> tail(ProductosxPagina)
   IdPágina IdProducto Tipo
15       15          9    3
16       16          6    2
17       17          9    3
18       18          1    1
19       19          7    2
20       20          4    1
> names(ProductosxPagina)
[1] "IdPágina"   "IdProducto" "Tipo"      

```
``` R
> Navegacion <- read.csv2("../descargas/unidad03/Mascotas_2a/Navegacion_csv.txt")
> head(Navegacion)
  Id IdDueño IdPágina          DT Secuencia Venta Importe
1  1       1        4 0.230000000         1     0       0
2  2       2       19 2.810000000        19     0       0
3  3       2        1 1.030000000      1-19     0       0
4  4       1        1 5.030000000         1     0       0
5  5       2        6 5.640000000         6     0       0
6  6       2       12 0.004689429      12-6     0       0
> tail(Navegacion)
             Id IdDueño IdPágina    DT Secuencia Venta Importe
1048568 1048568    3026       13  7.93   13-14-2     0       0
1048569 1048569    3026        5  1.85   5-13-14     0       0
1048570 1048570    3026       18  0.85   18-5-13     0       0
1048571 1048571    3026       11  0.32   11-18-5     0       0
1048572 1048572    3026       16 13.73  16-11-18     0       0
1048573 1048573    3027        2  7.96         2     0       0
> names(Navegacion)
[1] "Id"        "IdDueño"   "IdPágina"  "DT"        "Secuencia" "Venta"    
[7] "Importe"  
``` 
``` R
> Duenos <- read.csv2("../descargas/unidad03/Mascotas_2a/Duenos_csv.txt")
> head(Duenos)
  Id IdDueño Perros Gatos Total Edad Sexo Ingreso
1  5       1      1     2     3   60    M  116816
2  6       3      2    NA     2   76    M   16334
3  7       4      2    NA     2   43    F   34890
4  8       5     NA     1     1   36    M   38786
5  9       6      1    NA     1   63    F   22966
6 10       7      1    NA     1   74    F    8894
> tail(Duenos)
       Id IdDueño Perros Gatos Total Edad Sexo Ingreso
5660 5664    7994      1    NA     1   61    F   17830
5661 5665    7996      1     1     2   33    M   29813
5662 5666    7997     NA     2     2   65    M   12383
5663 5667    7998      3    NA     3   44    F   58143
5664 5668    7999     NA     2     2   40    F   38167
5665 5669      NA   7133  2867 10000   NA           NA
> names(Duenos)
[1] "Id"      "IdDueño" "Perros"  "Gatos"   "Total"   "Edad"    "Sexo"   
[8] "Ingreso"
```
``` R
> Mascotas <- read.csv2("../descargas/unidad03/Mascotas_2a/Mascotas_csv.txt")
> head(Mascotas)
  IdMascota IdDueño IdEspecie IdRaza  Peso  Edad Sexo
1         1    5627         1     89 11.81  0.01    M
2         2     398         1     40  7.78 12.64    M
3         3    1962         1     35  6.75  0.56    F
4         4    6113         2    170  6.40  7.07    F
5         5    1802         2    166  5.42  0.14    M
6         6    4092         1     36 18.82  0.29    M
> tail(Mascotas)
      IdMascota IdDueño IdEspecie IdRaza  Peso  Edad Sexo
9995       9995    4900         1     97 45.68  7.00    F
9996       9996    3424         1     94 30.22  6.81    F
9997       9997    6964         2    110  2.64 15.00    F
9998       9998    3092         1     31  7.59  6.22    M
9999       9999    4332         1     65 36.65 12.24    M
10000     10000    1460         2    127  2.13 14.20    M
> names(Mascotas)
[1] "IdMascota" "IdDueño"   "IdEspecie" "IdRaza"    "Peso"      "Edad"     
[7] "Sexo"     
> 
```

``` R
> paste(c("ClasificacionProductos : ", names(ClasificacionProductos)), collapse=" - ")
[1] "ClasificacionProductos :  - Id - IdProducto - Tipo"
> paste(c("ProductosxPagina : ", names(ProductosxPagina)), collapse=" - ")
[1] "ProductosxPagina :  - IdPagina - IdProducto - Tipo"
> paste(c("Navegacion : ", names(Navegacion)), collapse=" - ")
[1] "Navegacion :  - Id - IdDueno - IdPagina - DT - Secuencia - Venta - Importe"
> paste(c("Duenos : ", names(Duenos)), collapse=" - ")
[1] "Duenos :  - Id - IdDueno - Perros - Gatos - Total - Edad - Sexo - Ingreso"
> paste(c("Mascotas : ",names(Mascotas)), collapse=" - ")
[1] "Mascotas :  - IdMascota - IdDueno - IdEspecie - IdRaza - Peso - Edad - Sexo"
> 
```



