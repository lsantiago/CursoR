# 1 Genere un vector con 100 números aleatorios entre 1 y 800. Use la función sample
numeros <- sample(1:800,100,replace=F) 

# 2 Gener un vecotr con 4 nivles: "a", "b", "c", "d". Use la función rep
letras <- rep(c("a", "b", "c", "d"), 25)

# 3 Una estos dos vectores en un dataframe. Use la función 
df <- data.frame(numeros, letras)

#4 Estraer los elementos 10, 15, 20, 25
numeros[c(10, 15, 20, 25)]

#5 ......
numeros[numeros > 500]


#6 Con el data.frame creado en punto 3. Obtenga todas las columnas con las filas que son igual a "b" y "c"
df[df$letras == "c" | df$letras == "b", ]

#7 En el vector caracter de niveles extraiga los datos que son mayores a "b"
df[df$letras > "b", ]

# 8 Elimine de la matriz los casos(filas) que son iguales a "d"
df <- df[df[,2] != ("d"), ]
df

quadratic <- function(x) {
    return(2 + x)
}







