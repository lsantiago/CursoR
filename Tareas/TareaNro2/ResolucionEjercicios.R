## PROBLEMA 4.1 ----
#  Un vector con datos de edad de 20 estudiantes puede usar rnorm para generar 
#  un vector de pesos con una media de 70kg. Incluya en el mismo vector 20 datos 
#  más con una media de 56Kg. Usted defina la desviación.

pesoEst <- c(rnorm(n=20, mean=70, sd=2), rnorm(n=20, mean=56, sd=5))
pesoEst

## PROBLEMA 4.2 ----
#  Repita el mismo ejercicio pero esta vez de altura. Para los primeros 20 
#  estudiantes la altura debe tener una media de 167 cm y el segundo grupo 
#  con una media de 150 cm
altEst <- c(rnorm(n=20, mean=167, sd=20), rnorm(n=20, mean=150, sd=20))

## PROBLEMA 4.3 ----
#  Un vector con el género de los estudiantes. Escoja aleatoreamente 40 
#  datos de Masculino, Femenino. Use la función sample.
set.seed (1)
generoEst <- sample(c('m', 'f'), 40, replace = T)
generoEst

## PROBLEMA 4.4 ----
#  Genere un vector de edades en años de los estudiantes, use rnorm para 
#  generar un vector con una media de 25, use la función round para redondear 
#  a cero decimales.

#  al valor de n se asigna el tamaño de los vectores anteriores
edadEst <- round(rnorm(n = length(generoEst), mean = 25, sd=5), 0)
edadEst

## PROBLEMA 4.5 ----
#  Un vector lógico que contenga que posisión los estudiantes cumplen con 
#  ser mayores de 25
posMayoresA25 <- edadEst > 25
posMayoresA25


## PROBLEMA 5 ----
#  Genere una lista con el vector de edad y género. Vuelva a convertir en 
#  vector. 
listEdadGen <- list(edadEst, generoEst)
vecEdadGen <- unlist(listEdadGen)


## PROBLEMA 6 ----
#  Genere 3 categorías de edad, entre 18 y 20, entre 20 y 25 y mayores de 25. 
#  Nombre a cada categoría; jovenes, adultos y maduros. Para poner el nombre 
#  use la función levels para asignar los nombres. Modifique el orden de las 
#  categorías para que aparezca primero maduro, luego adulto y finalmente joven
edadcat <- cut(edadEst, breaks = c(18, 20, 25, max(edadEst)),
               labels=c("joven", "adulto", "maduro"))
recatedat <- factor(edadcat, levels = c("maduro", "adulto", "joven"))
cat("Categorias edad:", levels(edadcat) ,"\n")
levels(edadcat)
cat("Recategorizando edad: ", levels(recatedat), "\n") 
levels(recatedat)

## PROBLEMA 7 ----
# Genere una matriz con los datos numéricos de los vectores antes generados.
mPeso   <- matrix(pesoEst, 10, 4, byrow = T); cat("\nMatriz de pesos: \n"); print(mPeso)
mAlt    <- matrix(altEst, 10, 4, byrow = T); cat("\nMatriz de alturas: \n"); print(mAlt)  
mEdad   <- matrix(edadEst, 10, 4, byrow = T); cat("\nMatriz de edades: \n"); print(mEdad)
mGenero <- matrix(generoEst, 10, 4, byrow = T); cat("\nMatriz de generos: \n"); print(mGenero)

## PROBLEMA 8 ----
#  Genere una data frame con los vectores numéricos y caracteres.
dfEst <- data.frame(pesoEst, altEst, edadEst, generoEst); print(dfEst)

## PROBLEMA 9 ----
#  Convierta el data frame en una matriz y verifique que tipo de elementos
#  constituyen esta matriz. 
newMat <- data.matrix(dfEst); print(newMat)


## REPORTE ----
# PREGUNTAS DEL PROBLEMA 4
sink(file("reporte.txt", encoding = "UTF-8"))
cat("¿Qué tipo de vectores hemos generado?\n") 
#  Rta. Peso, Alto, Genero, Edad son del tipo double, double, character y
#  double respectivamente
cat("Tipo de vectores para estudiantes\n")
cat("- Peso:   ", typeof(pesoEst), "\n")
cat("- Alto:   ", typeof(altEst), "\n")
cat("- Genero: ", typeof(generoEst), "\n")
cat("- Edad:   ", typeof(edadEst), "\n")
cat("¿Cuantos estudiantes mayores a 25 años hay en el aula?")
cat(" Existen ", sum(posMayoresA25), " estudiantes mayores a 25 años\n\n")

## PROBLEMA 5
cat("Genere una lista con el vector de edad y género. Vuelva a convertir en 
vector. ¿El vector resultante es numérico o carácter? Explique la razón 
del resultado.\n")
cat("Rta. Devuelve un vector de ", typeof(vecEdadGen), " porque los elementos han sido 
coacionados al tipo más flexible.\n\n") 

## PROBLEMA 6
cat("Genere 3 categorías de edad, entre 18 y 20, entre 20 y 25 y mayores de 25. 
Nombre a cada categoría; jovenes, adultos y maduros. Para poner el nombre 
use la función levels para asignar los nombres. Modifique el orden de las 
categorías para que aparezca primero maduro, luego adulto y finalmente joven.\n")
cat("Categorias edad:", levels(edadcat) ,"\n")
cat("Recategorizando edad: ", levels(recatedat), "\n")

## PROBLEMA 7
cat("\n\nGenere una matriz con los datos numéricos de los vectores antes generados.\n")
cat("\nMatriz de pesos: \n"); print(mPeso)
cat("\nMatriz de alturas: \n"); print(mAlt)
cat("\nMatriz de edades: \n"); print(mEdad)
cat("\nMatriz de generos: \n"); print(mGenero)
## PROBLEMA 8
cat("\n\nGenere una data frame con los vectores numéricos y caracteres.")
print(dfEst)
## PROBLEMA 9
cat("\n\nConvierta el data frame en una matriz y verifique que tipo de elementos
constituyen esta matriz. De que tipo son los datos de esta matriz.\n")
print(newMat)
cat("\nRta. Los datos son de tipo ", typeof(newMat))
sink()