## Ítem 1 ----
v1 <- 1:8
v2 <- c('a', 'b', 'c', 'd', 'e')
v3 <- c('f', 'i', 2, 'a')

typeof(v1)
typeof(v2)
typeof(v3)

## Ítem 2 ----
# obtener 20 elementos con números entre 0 y 2
example(sample)
elementos <- sample(0:2, 20, replace = TRUE) 

## Ítem 3
#Cuántos elementos tiene para cada valor?
table(elementos)
