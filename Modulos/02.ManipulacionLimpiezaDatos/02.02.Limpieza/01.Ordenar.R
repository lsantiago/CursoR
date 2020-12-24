## 
#install.packages("reshape2")

library(reshape2)

## Crear directorios de trabajo ----
dir.create("data")
dir.create("output")

## Data ----
data <- read.csv("https://raw.githubusercontent.com/Ciespinosa/datos_practicas/48309b02d8a7c6ad78baba7a05ede7b178344d36/Aves_temporal2.csv", sep = ";", header=T) 
#write.csv(data, "data/aves.csv", row.names = T)


dataf <- melt(data, id.vars=c("date", "Season"),
             variable.name="especie",
             value.name="frecuencia")

knit::kable()