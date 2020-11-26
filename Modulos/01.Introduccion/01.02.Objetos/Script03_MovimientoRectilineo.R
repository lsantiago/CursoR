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

  