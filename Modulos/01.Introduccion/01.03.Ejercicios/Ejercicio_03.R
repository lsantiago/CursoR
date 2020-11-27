#rnorm(media, desvia. estandar, n)
#des. est -> cuánto queremos que se extienda
#n -> la cantidad de datos

verno <- rnorm(mean=120, sd=40, n=30)
#ejemplo <- sample()

cuantiv <- quantile(verno, probs = c(0, 0.3, 0.7, 1))

vernoCat <- cut(verno, breaks = c(39, cuantiv[-1]))
levels(vernoCat) <- c("bajo", "medio", "alto")
print(vernoCat)



