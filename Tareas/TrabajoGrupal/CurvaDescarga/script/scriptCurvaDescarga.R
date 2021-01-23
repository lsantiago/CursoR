## Autores ----
# Richard Serrano
# José Guartan
# Sonia Gonzaga
# Cristhian Chamba
# Santiago Quiñones


## Lectura de datos ----
dCaudales = read.csv("data/caudal_con_sitios.csv", sep = ";", header=T)

## Definición de función ----
curvaDescarga <- function(main_df, ho=0.25){
  #' Curva de descarga
  #' 
  #' La función obtiene la estimación de la variable caudal con respecto a 
  #' la variable tiempo en diferentes estaciones.  
  #' 
  #' @param main_df Datos de caudales
  #' @param ho      Altura inicial
  #' 
  #' @export plots Graficos de regresión lineal y curvas de descarga 
  
  
  # Extracción de sitios
  sitios = unique(main_df["sitio"])
  
  # Configuración de subplots
  par(mfrow=c(length(sitios[,1]),2), oma=c(1,6,4,1))
  
  line = 6
  cex = 1.2
  side = 1
  adj=-0.0001
  
  
  ##  OBTIENE INFORMACIÓN DE CAUDAL POR CADA SITIO
  for (i in 1:length(sitios[,1])) {
    
    nombre_sitio = sitios[i,1]
    df <- main_df[main_df["sitio"] == nombre_sitio, ]
    
    
    
    ## ho: Altura inicial (cuando el caudal es 0)
    
    # Alturas
    h <- df[,3]
    caudal <- df[,4]
    
    # Cálculo de variación (h-ho)
    variacion <- h - ho
    
    # Cáculo de Y
    Y <- log10(variacion)
    
    # Cálculo de X
    X <- log10(caudal)
    
    # Cálculo de n
    # Referencia: https://bit.ly/383UCF9
    
    print(c(summary(lm(X~Y))))
    
    #n <- c(summary(lm(X~Y))$coef[1,1], summary(lm(X~Y))$coef[2,1])
    mod <- lm(X~Y)
    n <- summary(mod)$coef[2,1]
    intercept <- round(summary(mod)$coef[1,1], 2)
    R <- round(summary(mod)$r.squared, 2)
    
    # Cálcular a
    a <- 10^(1.742)
    
    # Cálcular Q
    Q <- a * (variacion)^n
    
    
    
    # PRESENTACIÓN DE RESULTADOS
    
    #print(Q)
    plot(Y, X, pch=19, main = "Regresión lineal")
    abline(mod, col="red")  
    
    # Presentación de ecuación de ajuste lineal
    eq <- paste0("y = ", round(n, 2), " x + ", intercept)
    
    mtext(eq,side=3,adj=0,cex=0.7)
    mtext(bquote(r^2 == .(R)),adj=1,cex=0.7)
    
    # Nombre de sitio
    mtext(toupper(nombre_sitio), side=2, line=line, cex=cex, adj=adj)
    
    # Gráfica de curva de descarga
    plot(h, Q, col="blue", main = "Curva de descarga", 
                                        xlab="Nivel de agua (h)", ylab="Caudal (Q)")
    
      
    
  }
  
  title(main = list("RESULTADOS", cex = 1.5), 
        line = 0, outer = TRUE)
  
  
}


## Ejemplo de uso de función ----
curvaDescarga(dCaudales)


