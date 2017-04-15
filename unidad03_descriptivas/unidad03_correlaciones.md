# Correlaciones

> ## ejercicio 1.2.9
 buscar los 10 paises de mayor PBI y evaluar correlacion entre 

 . PBI y Pobablocion

 . PBI per capita y Pobablocion

 PBI
 datos.bancomundial.org/indicador/NY.GDP.MKTP.CD

 Poblacion
 http://data.worldbank.org/indicator/SP.POP.TOTL

 PBI per capita
 datos.bancomundial.org/indicador/NY.GDP.MKTP.CD

``` R
> data_poblacion <- read.csv("../descargas/unidad03/BancoMundial/API_SP.POP.TOTL_DS2_en_csv_v2.csv", skip=4)
> data_pbicap <- read.csv("../descargas/unidad03/BancoMundial/API_NY.GDP.PCAP.CD_DS2_es_csv_v2.csv", skip=4)
> data_pbi_top10 <- read.csv("./data_pbi_top10_esp.csv")
> nrow(data_pbi_top10)
[1] 264
> data_pbi_top10 <- data_pbi_top10[data_pbi_top10$espais == "1",]
> data_pbi_top10 <- data_pbi_top10[1:10,]
> data_pbi_pob <- merge(data_pbi_top10, data_poblacion, by.x="Country.Code", by.y="Country.Code")
```
``` R
> names(data_pbi_pob)
  [1] "Country.Code"     "X.1"              "espais"          
  [4] "Country.Name.x"   "Indicator.Name.x" "Indicator.Code.x"
  [7] "X1960.x"          "X1961.x"          "X1962.x"         
 [10] "X1963.x"          "X1964.x"          "X1965.x"         
 [13] "X1966.x"          "X1967.x"          "X1968.x"         
 [16] "X1969.x"          "X1970.x"          "X1971.x"         
 [19] "X1972.x"          "X1973.x"          "X1974.x"         
...
 [49] "X2002.x"          "X2003.x"          "X2004.x"         
 [52] "X2005.x"          "X2006.x"          "X2007.x"         
 [55] "X2008.x"          "X2009.x"          "X2010.x"         
 [58] "X2011.x"          "X2012.x"          "X2013.x"         
 [61] "X2014.x"          "X2015.x"          "X2016.x"         
 [64] "X.x"              "Country.Name.y"   "Indicator.Name.y"
 [67] "Indicator.Code.y" "X1960.y"          "X1961.y"         
 [70] "X1962.y"          "X1963.y"          "X1964.y"         
 [73] "X1965.y"          "X1966.y"          "X1967.y"         
 [76] "X1968.y"          "X1969.y"          "X1970.y"         
...
[109] "X2001.y"          "X2002.y"          "X2003.y"         
[112] "X2004.y"          "X2005.y"          "X2006.y"         
[115] "X2007.y"          "X2008.y"          "X2009.y"         
[118] "X2010.y"          "X2011.y"          "X2012.y"         
[121] "X2013.y"          "X2014.y"          "X2015.y"         
[124] "X2016.y"          "X.y"             
```
El dato está a 2015
``` R
> data_pbi_pob_dw <- subset(data_pbi_pob, select = c(Country.Code, Country.Name.x, X2015.x, X2015.y))
> names(data_pbi_pob_dw)
[1] "Country.Code"   "Country.Name.x" "X2015.x"        "X2015.y"       
> names(data_pbi_pob_dw ) <- c("Country.Code", "Country.Name", "PBI", "Poblacion")
> names(data_pbi_pob_dw)
[1] "Country.Code" "Country.Name" "PBI"          "Poblacion"   
```
``` R
> data_pbi_pob_dw[order(data_pbi_pob_dw$PBI, decreasing=TRUE),]
   Country.Code   Country.Name          PBI  Poblacion
10          USA Estados Unidos 1.803665e+13  321418820
3           CHN          China 1.100772e+13 1371220000
9           JPN          Japón 4.383076e+12  126958472
4           DEU       Alemania 3.363447e+12   81413145
6           GBR    Reino Unido 2.858003e+12   65138232
5           FRA        Francia 2.418836e+12   66808385
7           IND          India 2.095398e+12 1311050527
8           ITA         Italia 1.821497e+12   60802085
1           BRA         Brasil 1.774725e+12  207847528
2           CAN         Canadá 1.550537e+12   35851774
>  
```
``` R
> cor(data_pbi_pob_dw[["Poblacion"]], data_pbi_pob_dw[["PBI"]])
[1] 0.2909591
```
``` R
> cor(data_pbi_pob_dw[["Poblacion"]], data_pbi_pob_dw[["PBI"]]/data_pbi_pob_dw[["Poblacion"]])
[1] -0.7175964
```
``` R
> cor(data_pbi_pob_dw[["PBI"]], data_pbi_pob_dw[["PBI"]]/data_pbi_pob_dw[["Poblacion"]])
[1] 0.2806139
> 
```

