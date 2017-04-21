## Graficos y Sistemas de Graficos

?graphics
library(help="graphics")
library(help="grDevices")

library(datasets)
data(cars)
head(cars)
names(cars)

with(cars, plot(speed, dist, 
                xlab="Velocidad", ylab="Distancia", main="D vs V", 
                col.main="red", col="blue"  ))

library(help="lattice")

# https://www.datanalytics.com/2013/11/29/oscar-perpinan-sobre-graficos-base-vs-lattice-vs-ggplot2/

library(help="ggplot2")

library(datasets)
plot(airquality$Temp, ylim=c(50,100), type = "l")

with(airquality, plot(Wind, Ozone))
title(main="Ozone and Wind inNew York City")

with(airquality, plot(Wind, Ozone, main="Ozone and Wind inNew York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col="blue"))

with(airquality, plot(Wind, Ozone, main="Ozone and Wind inNew York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col="blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col="red"))
legend("topright", pch = 1, col = c("blue","red"), legend = c("May","Other Months"))

with(airquality, plot(Wind, Ozone, main="Ozone and Wind inNew York City", pch=20)) # caracter que se muestra
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd=2) # line width

par(mfrow = c(1, 2))
with(airquality, {
  plot(Wind, Ozone, main="Ozone and Wind")
  plot(Solar.R, Ozone, main="Ozone and Solar Radiation")  
})
par(mfrow = c(1, 1))

## Grafico para visualizar correlaciones
pairs(data.frame(airquality$Ozone, airquality$Solar.R, airquality$Wind, airquality$Temp))

## Histograma
hist(airquality$Ozone)

## Diagrama de cajas o box plot
airquality2 <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month , airquality2, xlab = "Month", ylab = "Ozone (ppb)")
boxplot(Ozone ~ Month , airquality, xlab = "Month", ylab = "Ozone (ppb)")

## Graficos de barras o bar chars
# si es un factor, plot por defecto hace un grafico de barras
plot(airquality$Month)
plot(airquality2$Month)

## grafico de torta o pie
# aca tambien influye si es faactor

# sale mal x q no es factor
pie(summary(airquality$Month))
# sale bien
pie(summary(airquality2$Month))

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
heatmap(dataMatrix)

# ejemplo
# tenemos en 12 filas (meses), las ventas de 15 sucursales 
meses <- seq(1,12)
suc <- seq(1,15)
# matris 12 x 15 con los numeros de ventas
A <- matrix(sample(1:30, 12*15, replace = TRUE), nrow = 12, ncol = 15)
heatmap(A, Rowv = NA, Colv = NA)
colnames(A) <- suc
rownames(A) <- meses
A
heatmap(A, Rowv = NA, Colv = NA)

## Grafico QQ de probabilidad normal
qqnorm(airquality$Wind)
qqline(airquality$Wind)

## Exportando graficos
# setear el directorio de trabajo al del script
# despues lo paso a una carpeta no versionada
setwd ("../descargas/unidad04/")
pdf(file = "ejemplo_heatmap.pdf") # creamos el archivo y abrimos el deviceIsInteractive
heatmap(A, Rowv = NA, Colv = NA)
dev.off()  # cerramos device
