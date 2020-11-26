# Descarga instrucciones ----

sink("./instrucciones.txt",  type = c("output", "message"))
instrucciones <- readLines("https://raw.githubusercontent.com/Ciespinosa/datos_practicas/master/leyendoDatos.txt", warn=FALSE)
cat(instrucciones, sep = "\n")
sink()

# Descarga de datos ----

dAves <- read.csv("https://raw.githubusercontent.com/Ciespinosa/datos_practicas/master/Aves_temporal2.csv", sep = ";", header=T) 
write.csv(dAves, "../data/aves.csv")

# Obtener 5 especies de aves con mas individuos ----

dAvesColSum <- colSums(dAves[,-(1:2)])
nombreAvesOrd <- sort(dAvesColSum, decreasing = TRUE)
especiesDomin <- nombreAvesOrd[1:5]

# Reporte de especies dominantes ----

names(especiesDomin)
summary(especiesDomin)
print("Luego del análisis desarrollado la especie más dominante es ", )

#6. Agregue en el reporte el summary del objeto de aves.
#7. Incluya en el informa una frase que diga: Luego del analisis 
#   desarrollado la especie mas dominante es xx(incluir con codigo 
#   la especie mas dominante), con un total de xx (incluir con codigo 
#   el numero de individuos de esa especie).




