## Crear directorios de trabajo ----
dir.create("data")
dir.create("output")

## Data ----
data <- read.csv("https://raw.githubusercontent.com/Ciespinosa/datos_practicas/48309b02d8a7c6ad78baba7a05ede7b178344d36/Aves_temporal2.csv", sep = ";", header=T) 
write.csv(data, "data/ejemplo.csv", row.names = F)