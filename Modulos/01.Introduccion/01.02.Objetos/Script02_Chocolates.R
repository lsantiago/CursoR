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
