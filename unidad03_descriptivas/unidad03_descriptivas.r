# unidad 3
# install.packages("RODBC")
# no lo instala bien
# http://r.789695.n4.nabble.com/Problem-installing-RODBC-package-under-UBUNTU-td892215.html
# lo instalo con 
# $ sudo apt-get install r-cran-rodbc

library(RODBC)

file.exists("../descargas/unidad03/Mascotas_2a/Mascotas2.accdb") 
mdbConnect <- odbcConnect("../descargas/unidad03/Mascotas_2a/Mascotas2", readOnlyOptimize=TRUE) 
mdbConnect
?odbcDriverConnect
?odbcDriverConnect

odbcDriverConnect("driver=FreeTDS;Server=hostname;database='../descargas/unidad03/Mascotas_2a/Mascotas2'")

uid=""
pwd=""
con =paste("Driver={Microsoft Access Driver};Dbq='", file.path('../descargas/unidad03/Mascotas_2a/Mascotas2'), "';Uid=", uid, ";Pwd=", pwd, ";", sep = "")
conn=odbcDriverConnect(con)

con