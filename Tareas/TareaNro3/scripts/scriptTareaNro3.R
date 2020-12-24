## Leer datos ----
dinic <- read.csv("https://raw.githubusercontent.com/Ciespinosa/Subconjuntos/master/dinic.csv", sep = ",", header=T) 
nobj <- read.csv("https://raw.githubusercontent.com/Ciespinosa/Subconjuntos/master/nobj.csv", sep = ",", header=T, colClasses = c("character", "character", "character")) 
dnum <- read.csv("https://raw.githubusercontent.com/Ciespinosa/Subconjuntos/master/dnum.csv", sep = ",", header=T) 
dinal <- read.csv("https://raw.githubusercontent.com/Ciespinosa/Subconjuntos/master/dinal.csv", sep = ',', header=T)


## Problema 2.a ----
# Extraer como un data.frame las columnas “mens” y “ord” de dinic. 
sink("./reporte.txt")

mens <- dinic["mens"]
ord <- dinic["ord"]

## Problema 2.b ----
# Use el vector “ord” para extraer todos los elementos que son mayores que 1300 
ordv <- dinic[["ord"]]
ordv_mayor_1300 <- ordv[ordv > 1300]

## Problema 2.c ---- 
# Extraiga la columna “mens” como un vector y ordenar este vector usando el 
# vector “ord” de forma decreciente.
mensv <- dinic[["mens"]]
mensvord <- mensv[order(ordv)]

## Problema 3 ----
# Use la función cat e imprima el vector extraido en el punto anterior 
# y el vector que obtenga de extraer la posición global de la matriz “nobj” 
# en las posiciones: 1, 10, 12, 14.
cat("Mensaje ordenado:", mensvord)

# Extrae elementos de la matriz nobj
submnobj <- unname(unlist(nobj))[c(1, 10, 12, 14)]

cat("Elementos globales de la matriz nobj, posiciones 1, 10, 12, 14:", submnobj)

## Problema 4.a ----
# Del ítem anterior se indica que se debe trabajar con dnum
# Extraiga un data.frame con todas las variables, donde “grup” es igual a “a”.
group_a <- dnum[dnum["grup"]=='a', ]
print(group_a)

## Problema 4.b ----
# Ordene los datos de forma ascendente usando la variable “ord”.
ordgroup_a <- group_a[order(group_a['ord']),]


## Problema 4.c ----
# Extraiga como un vector los datos de la variable “loc”.
loc <- ordgroup_a[["loc"]]

## Problema 4.d ----
# Utilice el vector extraido en el punto b para extraer como vector la 
# columna 1 del ojeto que no ha sido usado hasta este punto. El vector 
# extraido en el punto b le dará la posición de los elementos a extraer.

# IMPORTANTE: El vector se obtiene en el punto c, no en el b.

men <- dinal[loc, ][["men"]]

## Problema 4.e ----
# Asignele a este vector el nombre “mensaje”
mensaje <- men
cat(mensaje)

## Problema 4.f ----
# Con el mismo objeto, extraiga todos los datos donde ord es mayor a 4 
dnum_con_ord_mayor_4 <- dnum[dnum["ord"]>4,]

## Problema 4.g ----
# Ordene de forma descendente la matriz usando las variables; “ord” y “grup”
dnum_ord <- dnum_con_ord_mayor_4[with(dnum_con_ord_mayor_4, order(ord, grup)),]

## Problema 4.h ---- 
# Del data.frame obtenido en el punto g extraiga los dos primeros datos 
# de la variable “loc”. Use este objeto para extraer los datos del 
# último data.frame (el que fue usado antes) de la variable 2. 
# El objeto resultante de esta extracción debería ser un data.frame. 
# Guarde el objeto como “califica”.
pos <- dnum_ord[c(1,2),][["loc"]]
califica <- dnum[pos, ]["grup"]

## Problema 5.i
# Extraiga la variable group, donde loc tiene el máximo valor (use la función max).
dnum_clear <- na.omit(dnum)
grupmax <- dnum_clear[dnum_clear["loc"] == max(dnum_clear["loc"]), ][["grup"]]

## Problema 5.j
# Use el objeto generado para filtrar del último data.frame (dinal), donde la variable 3 
# es igual al objeto creado en el punto i.
dinalfil <- dinal[dinal['grup']==grupmax,]



## Problema 5.k
dinalfilsort <- dinalfil[order(dinalfil["menfin"]),] 

## Problema 5.l
dinalfilsort[["menfin"]]



## Problema 5.m
# obtener reporte
sink()


