# Comandos básicos ----

# Ejecución de comandos e impresión
pi*3
log(234)

# La función de impresión
print(pi*3); print(pi*3, digits = 4) # El ; nos permite separar dos líneas
print(log(234), digits = 10)

# Controlar la salida de tablas
print(as.table(matrix(c(5:0,1,0,0), 3, 3)))
print(as.table(matrix(c(5:0,1,0,0), 3, 3)), zero.print = ".")


# La función cat para imprimit vectores
cat("Juan tiene", 17*pi, "años", "....\n")

# Asignando resultados a simbolos
set.seed(23) 
edad <- round(rnorm(5, 25, 5), 2)
print(edad)

# Vector de nombres
nom <- c("Juan", "Pedro", "Ana", "Sol", "Juliana")


sink("names_output.txt")
# Usamos la funcipon cat para imprimir
for(i in 1:length(nom)) cat("La edad de", nom[i], "es", edad[i], "...\n")
sink()
# Listado del workspace
ls()

# Listado con caracteristicas
ls.str()

#rm(list=ls())
#rm(list=sedfiff(ls(), c("edad", "nom)))

# Borrando en workspace
#ls(); rm(edad) ls() 

## Reportes ----

dta <- data.frame(edad, nom, gen=c(rep("Hombres",2), rep("Mujeres",3)))
resul <- tapply(dta$edad, dta$gen, mean)

sink("reporte1.txt")

print(resul)

summary(dta)
cat("Conclusión: La mayor media de edad se presenta en",
    names(resul[resul==max(resul)]),"(", max(resul), ")", 
    ", mientras que la menor edad en", 
    names(resul[resul==min(resul)]),"(", min(resul), ")")
sink()

write.csv(dta, file="datosEdad.csv", row.names=FALSE)


# Leyendo datos ----
dta2 <- read.csv("datosEdad.csv", header=T)
edad2 <- read.table("names_output.txt")
dta2;edad2

# Leyendo datos desde la una URL ----
url <- "https://raw.githubusercontent.com/Ciespinosa/datos_practicas/master/AMEBIASIS_LOJA.csv"

dtaAm <- read.csv2(url, header = TRUE, sep = ",")

head(dtaAm, 5)

write.csv(dtaAm, "./amebiasis.csv", row.names=T)

# Instalar paquetes ----
# install.packages("xlsx")

# Cargar paquete a memoria activa ----
library(xlsx)