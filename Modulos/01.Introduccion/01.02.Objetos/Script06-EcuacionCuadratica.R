
ecuacionCuadratica <- function(a=0, b=0, c=0){
  #' ecuacionCuadratica Determina la solución de una Ecuación Cuadrática
  #' 
  #' 
  #' @param a Coeficiente de x^2
  #' @param b Coeficiente de x
  #' @param c Coeficiente det termino independiente
  #' 
  #' @return rsta Raices de la ecuación
  
  D <- (b^2 - (4*a*c))
  

  if (D == 0){
    rsta <- -b / (2 * a)
  }else if(D > 0){
    x1 <- (-b + sqrt(D))/(2*a)
    x2 <- (-b - sqrt(D))/(2*a)
    rsta <- c(x1, x2)
  }else{
    rsta <- "No tiene raices reales"
  }
  
  return(rsta)
}

raices <- ecuacionCuadratica(2, 1, 6)
raices



  