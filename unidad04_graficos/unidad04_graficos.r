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
