## RIA (Rainfall Anomaly Index)
#
#  Descripción: Script para obtener índice de anomalía pluvial
#               de una serie de precipaciones
#
#  Autor:       Santiago Quiñones
#  Versión:     1.0.0


# Verificación e instalación de paquetes ----
list.of.packages <- c("readxl", "precintcon", "ggpubr", "zoo", "ggplot2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# Forma manual
#install.packages("readxl")
#install.packages("precintcon")
#install.packages("ggpubr")
#install.packages("xts")


# Importación de librerías ----
library(readxl)
library(precintcon)
library(ggpubr)
library(zoo)
library(ggplot2)

## Carga precipitaciones diarias ----
precipitaciones <- read_excel("data/precipitacion_diaria.xls")
#View(precipitaciones)

## Extracción de precipitaciones de MALACATOS ----
nomb_estacion <- "MALACATOS"
prec_malacatos <- precipitaciones[precipitaciones["NombreEstacion"] == nomb_estacion, 
                                  3:35]
#View(prec_malacatos)

# Cálculo de RAI  ----
rai_m = rai(as.daily(prec_malacatos, na.value = NA), granularity = "m")
rai_a = rai(as.daily(prec_malacatos, na.value = NA), granularity = "a")


# Generando columnas de fechas
rai_m$date <- as.yearmon(paste(rai_m$year, rai_m$month), "%Y %m")


## Gráficas ---- 


## Gráfica de RIA, granularidad mensual 
g1 <- ggplot(rai_m, aes(x=date, y= rai)) + 
  geom_bar(stat="identity") + labs(x = "Meses", y = "RAI")

## Gráfica de RIA, granularidad anual
g2 <- ggplot(rai_a, aes(x=year, y= rai)) + 
  geom_bar(stat="identity") + labs(x = "Años", y = "RAI")



figure <- ggarrange(g1, g2,
                    ncol = 1, nrow = 2)
annotate_figure(figure,
                top = text_grob("Índice de anomalía pluvial (RAI) en Malacatos", 
                                color = "black", size = 12))

