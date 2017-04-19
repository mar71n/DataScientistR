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

## Generar el histograma de la distribución de las ventas.
## Identificar las páginas que más ventas produjeron.

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
# en total de Importe
hist(Navegacion[Navegacion$Importe > 0, c(7)],breaks=150, main="Venta = 1 o Impote > 0 \n incluye 16940 Venta = 1 e Importe = 0",col=Navegacion$IdPagina)
sort(unique(Navegacion$IdPagina))
ventasi_x_pg <- aggregate(Navegacion$Importe, by = list(IdPagina = Navegacion$IdPagina), FUN="sum")
names(ventasi_x_pg) <- c("IdPagina", "TotalImporte")
ventasi_x_pg <- ventasi_x_pg[order(ventasi_x_pg$TotalImporte, decreasing=TRUE),]
# ventasi_x_pg

# en cantidad de ventas de importe > 0
length(Navegacion$Importe[which(Navegacion$Importe > 0)])
ventasn_x_pg <- aggregate(Navegacion$Importe[which(Navegacion$Importe > 0)], by = list(IdPagina = Navegacion$IdPagina[which(Navegacion$Importe > 0)]), FUN="length")
names(ventasn_x_pg) <- c("IdPagina", "CantVentas")
ventasn_x_pg <- ventasn_x_pg[order(ventasn_x_pg$CantVentas, decreasing=TRUE),]
# ventasn_x_pg

# en cantidad de ventas = 1
length(Navegacion$Importe[which(Navegacion$Venta == 1)])
ventasn1_x_pg <- aggregate(Navegacion$Importe[which(Navegacion$Venta == 1)], by = list(IdPagina = Navegacion$IdPagina[which(Navegacion$Venta == 1)]), FUN="length")
names(ventasn1_x_pg) <- c("IdPagina", "CantVentas1")
ventasn1_x_pg <- ventasn1_x_pg[order(ventasn1_x_pg$CantVentas, decreasing=TRUE),]
# ventasn1_x_pg

ventas_x_pg <- as.data.frame( cbind(ventasi_x_pg$IdPagina[order(ventasi_x_pg$IdPagina)], 
                ventasi_x_pg$TotalImporte[order(ventasi_x_pg$IdPagina)],
                ventasn_x_pg$CantVentas[order(ventasn_x_pg$IdPagina)],
                ventasn1_x_pg$CantVentas1[order(ventasn1_x_pg$IdPagina)]) )
names(ventas_x_pg) <- c("IdPagina","SumImportes","TotImportes","TotVenas")
ventas_x_pg[order(ventas_x_pg$SumImportes, decreasing=TRUE),]


## Correlaciones

# a. Identificar los atributos de los dueños más correlacionados con las ventas
# b. Identificar los atributos de las mascotas más correlacionados con las ventas
# c. Identificar los atributos de la navegación más correlacionados con las ventas

## c.
str(Navegacion)
nrow(Navegacion)
head(subset(Navegacion,select=c(IdPagina,IdDueno,DT,Venta, Importe)))
datos_cor <- subset(Navegacion,select=c(IdPagina,IdDueno,DT,Venta, Importe))
cor(datos_cor, use="pairwise.complete.obs")
# el atributo de Navegacion mas correlacionado con las ventas es DT

# Secuencia solo se correlaciona levemente con IdPagina
head(as.numeric(Navegacion$Secuencia))
head(subset(Navegacion,select=c(IdPagina,IdDueno, DT,Venta, Importe)))
datos_cor <- subset(Navegacion,select=c(IdPagina,IdDueno,DT,Venta, Importe))
head(datos_cor)
datos_cor$Secuencia <- as.numeric(Navegacion$Secuencia)
cor(datos_cor, use="pairwise.complete.obs")

## a.
nrow(Navegacion)
length(unique(Navegacion$IdDueno))
summary(Navegacion$IdDueno)
nrow(Navegacion[Navegacion$IdDueno == 0,])
nrow(Duenos)
summary(Duenos$IdDueno)
length(unique(Duenos$IdDueno))
datos_cor_v_d <- merge(Navegacion, Duenos, by.x="IdDueno", by.y="IdDueno")
class(datos_cor_v_d)
head(datos_cor_v_d)
tail(datos_cor_v_d)
nrow(datos_cor_v_d)
datos_cor_v_d$SexoN <- as.numeric(datos_cor_v_d$Sexo)
datos_cor_v_d <- subset(datos_cor_v_d, select=c(IdDueno, Id.x, IdPagina, DT, Venta, Importe, Id.y, Perros, Gatos, Total, Ingreso, SexoN))
datos_cor_v_d <- subset(datos_cor_v_d, select=c(IdDueno,  DT, Venta, Importe,  Perros, Gatos, Total, Ingreso, SexoN))
head(datos_cor_v_d)
cor(datos_cor_v_d, use="pairwise.complete.obs")

