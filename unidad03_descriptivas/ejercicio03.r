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
nrow(Duenos)
head(Duenos)
tail(Duenos)
names(Duenos)

Mascotas <- read.csv2("../descargas/unidad03/Mascotas_2a/Mascotas_csv.txt")
head(Mascotas)
tail(Mascotas)
names(Mascotas)

paste(c("ClasificacionProductos : ", names(ClasificacionProductos)), collapse=" - ")
paste(c("ProductosxPagina : ", names(ProductosxPagina)), collapse=" - ")
paste(c("Navegacion : ", names(Navegacion)), collapse=" - ")
paste(c("Duenos : ", names(Duenos)), collapse=" - ")
paste(c("Mascotas : ",names(Mascotas)), collapse=" - ")


## 1 Analisi exploratorio

# Generar el histograma de la distribución de las ventas.
# Identificar las páginas que más ventas produjeron.

table(Navegacion[["IdPagina"]])
table(Navegacion[["Venta"]])
head(Navegacion[Navegacion$Venta == 1 | Navegacion$Importe > 0 ,c(3,6,7)])
head(Navegacion[Navegacion$Venta == 1 & Navegacion$Importe == 0 ,c(3,6,7)])
length(Navegacion[Navegacion$Venta == 1 & Navegacion$Importe == 0 ,c(7)])
# [1] 16940

sqrt(nrow(Navegacion))
sqrt(length(Navegacion[Navegacion$Venta == 1 | Navegacion$Importe > 0, c(7)]))
# [1] 245.0163 => breaks = 245
1 + log2(length(Navegacion[Navegacion$Venta == 1 | Navegacion$Importe > 0, c(7)]))
# [1] 16.87347 => breaks = 17
hist(Navegacion[Navegacion$Venta == 1 | Navegacion$Importe > 0, c(7)],breaks=245, main="Venta = 1 o Impote > 0 \n incluye 16940 Venta = 1 e Importe = 0")
hist(Navegacion[Navegacion$Venta == 1 | Navegacion$Importe > 0, c(7)],breaks=17, main="Venta = 1 o Impote > 0 \n incluye 16940 Venta = 1 e Importe = 0")
hist(Navegacion[Navegacion$Venta == 1 | Navegacion$Importe > 0, c(7)],breaks="Sturges", main="Venta = 1 o Impote > 0 \n incluye 16940 Venta = 1 e Importe = 0")

x <- sqrt(1:1000)
plot(1:1000,x, ylim=c(0,15), col="red",ylab="f(x)")
text(200,11, labels="sqrt(x)")
par(new=TRUE)
y <- 1 + log2(1:1000)
plot(1:1000,y, ylim=c(0,15), col="blue", ylab="")
text(600,8, labels="1 + log2(x)")

hist(Navegacion[Navegacion$Venta == 1 | Navegacion$Importe > 0, c(7)],breaks=100, main="Venta = 1 o Impote > 0 \n incluye 16940 Venta = 1 e Importe = 0")
hist(Navegacion[(Navegacion$Venta == 1 | Navegacion$Importe > 0) & Navegacion$Importe < 2500, c(7)],breaks=100, main="Venta = 1 o Impote > 0 \n incluye 16940 Venta = 1 e Importe = 0 \n Importe < 2500")
hist(Navegacion[Navegacion$Importe > 0, c(7)],breaks=100, main="Importe > 0")

range(Navegacion$Importe)
min(Navegacion[Navegacion$Importe > 0 , 7])

# vantas por pagina
hist(Navegacion[Navegacion$Importe > 0, c(7)],breaks=150, main="Venta = 1 o Impote > 0 \n incluye 16940 Venta = 1 e Importe = 0",col=Navegacion$IdPagina)
sort(unique(Navegacion$IdPagina))
ventas_x_pg <- aggregate(Navegacion$Importe, by = list(IdPagina = Navegacion$IdPagina), FUN="sum")
names(ventas_x_pg) <- c("IdPagina", "TotalImporte")
ventas_x_pg <- ventas_x_pg[order(ventas_x_pg$TotalImporte, decreasing=TRUE),]
ventas_x_pg

## Correlaciones

