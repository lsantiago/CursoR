## Descargar instrucciones ----

sink("./instrucciones.txt",  type = c("output", "message"))
instrucciones <- readLines("https://raw.githubusercontent.com/Ciespinosa/datos_practicas/master/leyendoDatos.txt", warn=F)
cat(instrucciones, sep = "\n")
sink()

## Descargar datos de aves ----
setwd("./Tareas/TareaNro1")
data <- read.csv("https://raw.githubusercontent.com/Ciespinosa/datos_practicas/master/Aves_temporal2.csv", sep = ";", header=T) 
write.csv(data, "data/aves.csv", row.names = F)

## Obtener 5 especies de aves con mas individuos ----

dAves = read.csv("data/aves.csv", sep = ",", header=T)
dAvesFilter <- dAves[,-(1:2)]
dAvesSum <- colSums(dAvesFilter)
especiesDomin <- sort(dAvesSum, decreasing = TRUE)[1:5]

## Reporte de especies dominantes ----

sink("output/reporte.txt")
cat("Especies con mayor abundancia: ", names(especiesDomin))
cat("\n\n-------Summary---------------\n")
summary(dAvesFilter)
cat("\n\n-------Analysis---------------")
cat("\nLuego del analisis desarrollado la especie más dominante es ", names(especiesDomin[1]), "con un total de ", 
    especiesDomin[1])
sink()



