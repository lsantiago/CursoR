## Creación de objetos ----
profe <- "Santiago Quiñones"


## Problema de ganacia, chocolates ----

negocio <- function(C, N, D, E, G){
  x <- (C/60) + (N/40) + (D/50) + E
  y <- x*G
  z <- x+y
  
  neg <- c(x, y, z)
  names(neg) <- c("costo", "ganancia", "PVP")
  return(neg)
}

#Veamos cuanto cuesta el chocolate
negocio(C=7, N=2.5, D=2, E =0.10, G=0.3)

## Función que cálcula un ingreso global
ganT <- function(gT, G){
  xx <- negocio(7.2, 5.2, 2, 0.10, G)
  total <- gT/xx[2]
  names(total) <- "Unidades"
  return(total)
}

ganT(100, 0.5)

## Problema de Movimiento Rect. Uniforme ----
MRU <- function(x0, v, t, t0){
  #' MRU (Movimiento rectilineo unifore)
  #' x = x0 + v * (t-t0)
  #' 
  #' @param x0 ubicación inicial en m
  #' @param v  velocidad en m/s
  #' @param t  tiempo final en s
  #' @param t0 tiempo inicial en s
  #' 
  #' @return x distancia recorrida en m
  
  x = x0 + v * (t - t0)
  return(x)
}

# Test de función MRU
MRU(0, 3, 5, 3)


## Uso de condiciones ----

## Con números
x <- 3
if (x == 3){x <- x * 4}
if (x <  3){x <- x / 4}
if (x >  3){x <- x}
x

# Con caracteres
x <- 3
y <- 'N'

if(y == "N"){ xi <- x/2 }
if(y != "N"){ xi <- x/4 }
xi

## Problema de Movimiento Rect. Univormes V2 ----

MRU2 <- function(x = NULL, x0, v, t=NULL, t0){
  #' MRU (Movimiento rectilineo unifore)
  #' 
  #' 
  #' @param x  distancia recorrida en m
  #' @param x0 ubicación inicial en m
  #' @param v  velocidad en m/s
  #' @param t  tiempo final en s
  #' @param t0 tiempo inicial en s
  
  #' 
  #' @return resp Disctancia recorrida o tiempo final 
  
  
  if (is.null(x) && !is.null(t)){
    # otiene la distancia recorrida
    # x = x0 + v * (t-t0)
    resp = x0 + v * (t - t0)
    names(resp) <- "Distancia"
  }else if(is.null(t) && !is.null(x)){
    # obtienen el tiempo final
    # t = ((x - x0) - (v * t0))/v
    resp = ((x - x0) - (v * t0))/v
    names(resp) <- "Tiempo"
  }else{
    print("Faltan valores")
    return('NaN')
  }
  
  return(resp)
}

# Test de función MRU
distancia = MRU2(x0=0, v=3, t=5, t0=3)
print(distancia)
tiempo = MRU2(x=10, x0=0, v=3, t0=3)
print(tiempo)

