MRU <- function(x = NULL, x0, v, t=NULL, t0){
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
MRU(x0=0, v=3, t=5, t0=3)

  