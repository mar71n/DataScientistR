# Unidad 3

file.exists("../descargas/unidad03/Mascotas_2a/ClasificacionProductos_csv.txt")
ClasificacionProductos <- read.csv2("../descargas/unidad03/Mascotas_2a/ClasificacionProductos_csv.txt")
head(ClasificacionProductos)
tail(ClasificacionProductos)
names(ClasificacionProductos)

ProductosxPagina <- read.csv2("../descargas/unidad03/Mascotas_2a/ProductosxPagina_csv.txt")
head(ProductosxPagina)
tail(ProductosxPagina)
names(ProductosxPagina)

Navegacion <- read.csv2("../descargas/unidad03/Mascotas_2a/Navegacion_csv.txt")
head(Navegacion)
tail(Navegacion)
names(Navegacion)

Duenos <- read.csv2("../descargas/unidad03/Mascotas_2a/Duenos_csv.txt")
head(Duenos)
tail(Duenos)
names(Duenos)

Mascotas <- read.csv2("../descargas/unidad03/Mascotas_2a/Mascotas_csv.txt")
head(Mascotas)
tail(Mascotas)
names(Mascotas)
