#library("rstudioapi") 
#setwd(dirname(getActiveDocumentContext()$path)) 


dtaMamif = read.csv("data/Mamiferos.csv", header=T,encoding="UTF-8-BOM")


## Datos de observación: temp, presión ----
dtaObs <- aggregate(dtaMamif[,(9:10)], list(cod=dtaMamif$Codigo), max)

## Caracterisiticas de los mamiferos
dtaCM <- aggregate(dtaMamif[,(12:15)], list(cod=dtaMamif$Codigo), max)


