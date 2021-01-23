demo(graphics)

# El lienzo donde graficar
par(bg="grey98")
plot(1:100, type="n", axes=F, xlab = "", ylab="", bg="white")
rect(-10, -10, 120, 120, col="white")
box(lty = 3)
mtext(c("side = 1", "side = 2", "side = 3", "side = 4"),
side = c(1, 2, 3, 4), col = "grey", line = 1, cex = 1.5)

dev.off()


par(bg="grey98",mar=c(3,3,3,3))
layout.show()


par(bg="grey98",mar=c(3,3,3,3),mfcol=c(1,2))
layout.show()


# Dividiendo el lienzo
layout(matrix(c(1,2,3,3),2,2))
par(mar=c(1,1,1,1),bg="grey98")
layout.show()


# Controlando el tamaño
l = layout(matrix(c(1,1,2,3),2,2,byrow =TRUE),
       widths = c(2,3),heights = c(1.5,3))
par(mar=c(1,1,1,1),oma=c(3,3,1,1),bg="grey98")
layout.show(l)

# Parámetros gráficos
par(mar=c(1,1,1,1),oma=c(3,3,1,1),bg="grey98",mfcol=c(2,2))


# Los puntos
x <- rep(1:5,5)
y <- sort(rep(1:5,5))
par(mar=c(1,1,1,1))
plot(x,y,pch=1:25,col=1:5,cex=seq(1,3,length.out =25),bg="yellow",
     axes=FALSE,xlab="",ylab="",ylim=c(0,6))
text(x,y-0.3,cex=0.8)


library(png)
##Leerlo del disco duro
coli <- readPNG("Bird.png")
#Leerlo de internet y guardarlo
pngURL <-"http://www.pngall.com/wp-content/uploads/4/Single-Flying-Bird.png"
download.file(pngURL,"birdD.png",mode ="wb")
