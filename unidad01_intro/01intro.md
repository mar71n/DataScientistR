# DataScientistR
Curso Data Scientist con R UTN FRBA

``` R
> getwd()
[1] "/home/martin"
> setwd("~/Desa/DataScientistR/")
> getwd()
[1] "/home/martin/Desa/DataScientistR"
```
``` R
a <- 2
b <- 5
> ls()
[1] "a" "b"
```
``` R
> args(rnorm)
function (n, mean = 0, sd = 1) 
NULL

> args(available.packages)
function (contriburl = contrib.url(repos, type), method, fields = NULL, 
    type = getOption("pkgType"), filters = NULL, repos = getOption("repos")) 
NULL
```
``` R
library(datasets)

> ls(package:datasets)
  [1] "ability.cov"           "airmiles"              "AirPassengers"        
  [4] "airquality"            "anscombe"              "attenu"               
  [7] "attitude"              "austres"               "beaver1"              
 [10] "beaver2"               "BJsales"               "BJsales.lead"         
 [13] "BOD"                   "cars"                  "ChickWeight"          
 [16] "chickwts"              "co2"                   "CO2"                  
 [19] "crimtab"               "discoveries"           "DNase"                
 [22] "esoph"                 "euro"                  "euro.cross"           
 [25] "eurodist"              "EuStockMarkets"        "faithful"             
 [28] "fdeaths"               "Formaldehyde"          "freeny"               
 [31] "freeny.x"              "freeny.y"              "HairEyeColor"         
 [34] "Harman23.cor"          "Harman74.cor"          "Indometh"             
 [37] "infert"                "InsectSprays"          "iris"                 
...
 [91] "UKDriverDeaths"        "UKgas"                 "USAccDeaths"          
 [94] "USArrests"             "UScitiesD"             "USJudgeRatings"       
 [97] "USPersonalExpenditure" "uspop"                 "VADeaths"             
[100] "volcano"               "warpbreaks"            "women"                
[103] "WorldPhones"           "WWWusage"             
Warning message:
In ls(package:datasets) : ‘package:datasets’ converted to character string

> data(iris)
> head(iris)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```
