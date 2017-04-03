# unidad 3
# install.packages("RODBC")
# no lo instala bien
# http://r.789695.n4.nabble.com/Problem-installing-RODBC-package-under-UBUNTU-td892215.html
# lo instalo con 
# $ sudo apt-get install r-cran-rodbc

library(RODBC)

con <- odbcConnectAccess2007("../descargas/unidad03/Mascotas_2a/Mascotas2.accdb")
con

odbcGetInfo(con)
sqlTables(con)

odbcCloseAll()
