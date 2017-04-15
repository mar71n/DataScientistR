## Correlaciones

## ejercicio 1.2.9
# buscar los 10 paises de mayor PBI y evaluar correlacion entre 
# . PBI y Pobablocion
# . PBI per capita y Pobablocion
# PBI
# datos.bancomundial.org/indicador/NY.GDP.MKTP.CD
file.exists("../descargas/unidad03/BancoMundial/API_NY.GDP.MKTP.CD_DS2_es_csv_v2.csv")

# Poblacion
# http://data.worldbank.org/indicator/SP.POP.TOTL
file.exists("../descargas/unidad03/BancoMundial/API_SP.POP.TOTL_DS2_en_csv_v2.csv")

# PBI per capita
# datos.bancomundial.org/indicador/NY.GDP.MKTP.CD
file.exists("../descargas/unidad03/BancoMundial/API_NY.GDP.PCAP.CD_DS2_es_csv_v2.csv")

data_pbi <- read.csv("../descargas/unidad03/BancoMundial/API_NY.GDP.MKTP.CD_DS2_es_csv_v2.csv", skip=4)
names(data_pbi)
head(data_pbi)
nrow(data_pbi)  # 264

data_poblacion <- read.csv("../descargas/unidad03/BancoMundial/API_SP.POP.TOTL_DS2_en_csv_v2.csv", skip=4)
names(data_poblacion)
head(data_poblacion)

data_pbicap <- read.csv("../descargas/unidad03/BancoMundial/API_NY.GDP.PCAP.CD_DS2_es_csv_v2.csv", skip=4)
names(data_pbicap)
head(data_pbicap)

# los 10 mayor PBI - problema: hay aglomerados
data_pbi_top10 <- data_pbi[order(data_pbi$X2015, decreasing=TRUE),]
# le agrego un campo para marcar como pais (no aglomerado)
# data_pbi_top10 <- cbind(espais = 0, data_pbi_top10)
# data_pbi_top10_esp <- edit(data_pbi_top10)
# write.csv(data_pbi_top10_esp, file="./data_pbi_top10_esp.csv")
data_pbi_top10 <- read.csv("./data_pbi_top10_esp.csv")
nrow(data_pbi_top10)
data_pbi_top10 <- data_pbi_top10[data_pbi_top10$espais == "1",]
head(data_pbi_top10)
data_pbi_top10 <- data_pbi_top10[order(data_pbi_top10$X2015, decreasing=TRUE)]
head(data_pbi_top10)
data_pbi_top10 <- data_pbi_top10[1:10,]

# los 10 mayor Poblacion - problema: hay aglomerados
# data_poblacion_top10 <- data_poblacion[order(data_poblacion$X2015, decreasing=TRUE),]
# data_poblacion_top10 <- data_poblacion_top10[1:10,]
# data_poblacion_top10

names(data_pbi_top10)
names(data_poblacion)

data_pbi_pob <- merge(data_pbi_top10, data_poblacion, by.x="Country.Code", by.y="Country.Code")
names(data_pbi_pob)
data_pbi_pob_dw <- subset(data_pbi_pob, select = c(Country.Code, Country.Name.x, X2015.x, X2015.y))
names(data_pbi_pob_dw ) <- c("Country.Code", "Country.Name", "PBI", "Poblacion")
names(data_pbi_pob_dw)
head(data_pbi_pob_dw)
data_pbi_pob_dw[order(data_pbi_pob_dw$PBI, decreasing=TRUE),]

plot(data_pbi_pob_dw[["PBI"]], data_pbi_pob_dw[["Poblacion"]])
plot(data_pbi_pob_dw[["Poblacion"]], data_pbi_pob_dw[["PBI"]]/data_pbi_pob_dw[["Poblacion"]])
plot(data_pbi_pob_dw[["PBI"]], data_pbi_pob_dw[["PBI"]]/data_pbi_pob_dw[["Poblacion"]])

cor(data_pbi_pob_dw[["Poblacion"]], data_pbi_pob_dw[["PBI"]])
cor(data_pbi_pob_dw[["Poblacion"]], data_pbi_pob_dw[["PBI"]]/data_pbi_pob_dw[["Poblacion"]])
cor(data_pbi_pob_dw[["PBI"]], data_pbi_pob_dw[["PBI"]]/data_pbi_pob_dw[["Poblacion"]])

# mortandad infantil
data_mortandadi <- read.csv("../descargas/unidad03/BancoMundial/API_SP.DYN.IMRT.IN_DS2_es_csv_v2.csv", skip=4)
head(data_mortandadi)
data_pbi_mort <- merge(data_pbi_top10, data_mortandadi, by.x="Country.Code", by.y="Country.Code")
data_pbi_mort_dw <- subset(data_pbi_mort, select = c(Country.Code, Country.Name.x, X2015.x, X2015.y))
data_pbi_mort_dw
data_pbi_mort_dw <- subset(data_pbi_mort, select = c(Country.Code, Country.Name.x, X2015.x, X2015.y))
names(data_pbi_mort_dw ) <- c("Country.Code", "Country.Name", "PBI", "MortandadInf")

plot(data_pbi_mort_dw[["PBI"]], data_pbi_mort_dw[["MortandadInf"]])
cor(data_pbi_mort_dw[["PBI"]], data_pbi_mort_dw[["MortandadInf"]],use= "na.or.complet")
