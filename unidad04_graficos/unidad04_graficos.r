## Graficos y Sistemas de Graficos

?graphics
library(help="graphics")
library(help="grDevices")

library(datasets)
data(cars)
head(cars)
names(cars)

png(file = "./graficos/velocidad_vs_distancia.png") # Creamos archivo y abrimos device
with(cars, plot(speed, dist, 
                xlab="Velocidad", ylab="Distancia", main="D vs V", 
                col.main="red", col="blue"  ))
dev.off()  # cerramos device

library(help="lattice")

# https://www.datanalytics.com/2013/11/29/oscar-perpinan-sobre-graficos-base-vs-lattice-vs-ggplot2/

library(help="ggplot2")

## grafico de lineas o line plot
library(datasets)
png(file = "./graficos/temperatura.png") # Creamos archivo y abrimos device
plot(airquality$Temp, ylim=c(50,100), type = "l")
dev.off()  # cerramos device

## diagrama de dispersion o scaterplot con titulo
png(file = "./graficos/ozone_wind.png") # Creamos archivo y abrimos device
with(airquality, plot(Wind, Ozone))
title(main="Ozone and Wind inNew York City")
dev.off()  # cerramos device

## diagrama de dispersion o scaterplot con titulo y colores en una seleccion
png(file = "./graficos/ozone_wind_tit_col.png") # Creamos archivo y abrimos device
with(airquality, plot(Wind, Ozone, main="Ozone and Wind inNew York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col="blue"))
dev.off()  # cerramos device

## diagrama de dispersion o scaterplot con titulo y colores y legend
png(file = "./graficos/ozone_wind_tit_col_legend.png") # Creamos archivo y abrimos device
with(airquality, plot(Wind, Ozone, main="Ozone and Wind inNew York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col="blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col="red"))
legend("topright", pch = 1, col = c("blue","red"), legend = c("May","Other Months"))
dev.off()  # cerramos device

## incluimos una linea de regresion
png(file = "./graficos/ozone_wind_regresion.png") # Creamos archivo y abrimos device
with(airquality, plot(Wind, Ozone, main="Ozone and Wind inNew York City", pch=20)) # caracter que se muestra
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd=2) # line width
dev.off()  # cerramos device

## graficos multiples
png(file = "./graficos/ozone_wind_y_solar.png") # Creamos archivo y abrimos device
par(mfrow = c(1, 2))
with(airquality, {
  plot(Wind, Ozone, main="Ozone and Wind")
  plot(Solar.R, Ozone, main="Ozone and Solar Radiation")  
})
par(mfrow = c(1, 1))
dev.off()  # cerramos device

## Grafico para visualizar correlaciones
png(file = "./graficos/airquality_correlasiones.png") # Creamos archivo y abrimos device
pairs(data.frame(airquality$Ozone, airquality$Solar.R, airquality$Wind, airquality$Temp))
dev.off()  # cerramos device

## Histograma
png(file = "./graficos/ozone_hist.png") # Creamos archivo y abrimos device
hist(airquality$Ozone)
dev.off()  # cerramos device

## Diagrama de cajas o box plot
airquality2 <- transform(airquality, Month = factor(Month))
png(file = "./graficos/ozone_x_month.png") # Creamos archivo y abrimos device
boxplot(Ozone ~ Month , airquality2, xlab = "Month", ylab = "Ozone (ppb)")
dev.off()  # cerramos device
boxplot(Ozone ~ Month , airquality, xlab = "Month", ylab = "Ozone (ppb)")

## Graficos de barras o bar chars
# si es un factor, plot por defecto hace un grafico de barras
plot(airquality$Month)
png(file = "./graficos/month_barras.png") # Creamos archivo y abrimos device
plot(airquality2$Month)
dev.off()  # cerramos device

## grafico de torta o pie
# aca tambien influye si es faactor

# sale mal x q no es factor
pie(summary(airquality$Month))
# sale bien
png(file = "./graficos/month_pie.png") # Creamos archivo y abrimos device
pie(summary(airquality2$Month))
dev.off()  # cerramos device

summary(airquality$Month)
summary(airquality2$Month)
# asi se hace si no es factor
pie(table(airquality$Month))

## mapa de calor o heatmap
set.seed(1234)
par(mar = c(0,0,0,0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
dataFrame <- data.frame(x = x, y = y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
png(file = "./graficos/heatmap_random.png") # Creamos archivo y abrimos device
heatmap(dataMatrix)
dev.off()  # cerramos device

## ejemplo
# tenemos en 12 filas (meses), las ventas de 15 sucursales 
meses <- seq(1,12)
suc <- seq(1,15)
# matris 12 x 15 con los numeros de ventas
A <- matrix(sample(1:30, 12*15, replace = TRUE), nrow = 12, ncol = 15)
heatmap(A, Rowv = NA, Colv = NA)
colnames(A) <- suc
rownames(A) <- meses
A
png(file = "./graficos/heatmap_ventas_x_sucursal_x_mes.png") # Creamos archivo y abrimos device
heatmap(A, Rowv = NA, Colv = NA)
dev.off()  # cerramos device

## Grafico QQ de probabilidad normal
png(file = "./graficos/qqnorm_wind.png") # Creamos archivo y abrimos device
qqnorm(airquality$Wind)
qqline(airquality$Wind)
dev.off()  # cerramos device

## Exportando graficos
# setear el directorio de trabajo al del script
# despues lo paso a una carpeta no versionada
setwd ("../descargas/unidad04/")
pdf(file = "ejemplo_heatmap.pdf") # Creamos archivo y abrimos device
heatmap(A, Rowv = NA, Colv = NA)
dev.off()  # cerramos device

setwd ("../descargas/unidad04/")
png(file = "ejemplo_heatmap.png") # Creamos archivo y abrimos device
heatmap(A, Rowv = NA, Colv = NA)
dev.off()  # cerramos device
