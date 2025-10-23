x <- c(3, 5, 9, 12, 15, 23, 30)
y <- c(7, 9, 14, 12, 15, 16, 18)
plot(x, y)

# pch = caracter de la coordenada
# plot(x,y, pch=16)
# plot(x, y, pch = "~")

# cex = tamaño del caracter de la coordaneda
# plot(x, y, pch = "~", cex = 5)

# col = color del contorno caracter
# bg = color del relleno del caracter
plot(x, y, pch = 22, col = 125, bg = 98)
plot(x, y, pch = 22, cex=2, col = "red", bg = rgb(0, 102, 0, max = 255))


# alpha.f = degrada el color, intersante el efecto de solapamiento.
rojo.tr <- adjustcolor("red", alpha.f = 0.3)
set.seed(6)
abscisa <- rnorm(300)
ordenada <- abscisa + runif(300, -1, 1)
plot(abscisa, ordenada, cex=2, pch = 21, col = "black", bg = rojo.tr)
# xlab, ylab = pone nombre a la abscisa y la ordenada
# main = pone nombre al titulo
plot(abscisa, ordenada, xlab="Dimension 1", ylab="Dimension 2", main="TITULO", cex=2, pch = 21, col = "black", bg = rojo.tr)


plot(rnorm(500), rnorm(500), asp = 1)

# xlim, ylim = pone límite a loa rangos visibles del gráfico
plot(abscisa, ordenada, xlim = c(-2, -1), ylim = c(-3, -1), cex=2, pch = 21, col = "black", bg = rojo.tr)

# las = orientación de las datos de los ejes
# cex.axis = tamaño de la fuente
# font = tipo de fuente
# plot(x, y, cex.axis = 1.5, font = 1, las = 1)
plot(abscisa, ordenada, cex.axis = 1.5, font = 1, las = 1, xlim = c(-2, -1), ylim = c(-3, -1), cex=2, pch = 21, col = "black", bg = rojo.tr)


# cex.main = tamaño del título.
# axes = para que no dibuje los ejes
plot(x, y, pch = 22, cex = 2, col = 1, bg = 'orangered1',
     main = 'Diagrama de dispersión', cex.main = 2.5, xlab = 'dim 1',
     ylab = 'dim 2', cex.lab = 1.5, xlim = c(0, 35), ylim = c(2, 24),
     axes = F)
axis(1, at = seq(0, 35, 5),  cex.axis = 1.4)
axis(2, at = seq(2, 14, 2), cex.axis = 1.4, las = 1)
box()



x <- c(3, 5, 9, 12, 15, 23, 30)
y <- c(7, 9, 14, 12, 15, 16, 18)
plot(x, y, pch = 22, cex = 2, col = 1, bg = 'orangered1',
     main = 'Diagrama de dispersión', cex.main = 2.5, xlab = 'dim 1',
     ylab = 'dim 2', cex.lab = 1.5, xlim = c(0, 35), ylim = c(2, 24),
     axes = FALSE)
axis(1, at = seq(0, 35, 5), cex.axis = 1.4)
axis(2, at = seq(0, 24, 2), cex.axis = 1.4, las = 1)
box()

# corrección posición (0,0) con pos=0
x <- c(3, 5, 9, 12, 15, 23, 30)
y <- c(7, 9, 14, 12, 15, 16, 18)
plot(x, y, pch = 22, cex = 2, col = 1, bg = 'orangered1',
     main = 'Diagrama de dispersión', cex.main = 2.5, xlab = 'dim 1',
     ylab = 'dim 2', cex.lab = 1.5, xlim = c(0, 35), 
     ylim = c(0, 24), # <--- CORRECCIÓN 1: Asegura que haya espacio para y=0
     axes = FALSE)
axis(1, pos=0, at = seq(0, 35, 5), cex.axis = 1.4)
axis(2, pos=0, at = seq(0, 24, 2), cex.axis = 1.4, las = 1) # <--- CORRECCIÓN 2: Incluye el 0
box()


# corrección posicion (0,0) con xaxs="i" y yaxs="i"
x <- c(3, 5, 9, 12, 15, 23, 30)
y <- c(7, 9, 14, 12, 15, 16, 18)
plot(x, y, pch = 22, cex = 2, col = 1, bg = 'orangered1',
     main = 'Diagrama de dispersión', cex.main = 2.5, xlab = 'dim 1',
     ylab = 'dim 2', cex.lab = 1.5, xlim = c(0, 35), 
     ylim = c(0, 24),
     axes = FALSE, xaxs = "i", yaxs = "i")
axis(1, at = seq(0, 35, 5), cex.axis = 1.4)
axis(2, at = seq(0, 24, 2), cex.axis = 1.4, las = 1)
box()

# para añadir puntos
points(c(10, 20, 30), c(8, 22, 14),
       pch = 24, bg = "blue", cex = 2.5)


# etiq.puntos pone nombre a las coordenadas
etiq.puntos <- c('a12', 'd31', 'f23', 'a34', 'g18', 'b52', 'g49') 
plot(x, y, type="n")
text(x, y, labels = etiq.puntos, cex = 0.7, col = 'blue')


# Si solo queremos que se le ponga nombre a un solo punto
x <- c(3, 5, 9, 12, 15, 23, 30)
y <- c(7, 9, 14, 12, 15, 16, 18)
etiq.puntos <- c('a12', 'd31', 'f23', 'a34', 'g18', 'b52', 'g49')
etiqueta_especifica <- etiq.puntos[4] # 'a34'
indice_etiqueta <- 4
plot(x, y, type = 'n', 
     main = 'Diagrama de dispersión', xlab = 'dim 1', ylab = 'dim 2', 
     xlim = c(0, 35), ylim = c(0, 24))
points(x[-indice_etiqueta], y[-indice_etiqueta], 
       pch = 22, cex = 0.5, col = 1, bg = 'orangered1')
text(x[indice_etiqueta], y[indice_etiqueta], 
     labels = etiqueta_especifica, cex = 1.2, col = 'blue', pos = 3) 


plot(x, y, pch = 17, cex = 0.8)
text(x, y, labels = etiq.puntos, cex = 0.8, col = 'blue',
     pos = 3)

# SOlo ponemos etiquetas a los valores que eremos con x[etiqueta_posicion]
x <- c(3, 5, 9, 12, 15, 23, 30)
y <- c(7, 9, 14, 12, 15, 16, 18)
etiq.puntos <- c('a12', 'd31', 'f23', 'a34', 'g18', 'b52', 'g49')
etiqueta_inicio <- 1
etiqueta_final <- 7

plot(x, y, pch = 17, cex = 0.8, main = 'Diagrama de dispersión', 
     xlab = 'dim 1', ylab = 'dim 2', ylim = c(3, 21)) 
text(x[etiqueta_inicio], y[etiqueta_inicio], # Coordenadas de la tercera marca
     labels = etiq.puntos[etiqueta_inicio], # Etiqueta de la tercera marca
     cex = 1, col = 'blue',
     pos = 3) # Coloca la etiqueta encima del punto
text(x[etiqueta_final], y[etiqueta_final], # Coordenadas de la tercera marca
     labels = etiq.puntos[etiqueta_final], # Etiqueta de la tercera marca
     cex = 1, col = 'blue',
     pos = 3) # Coloca la etiqueta encima del punto


# Posicionamiento del contenido con srt
plot(0:5, 0:5, type = "n", xlab = "", ylab = "")
text(0, 3, "texto a 90°", srt = 90, col = "red", font = 6, cex = 1.5)
text(5, 3, "texto a 270°", srt = 270, col = "blue", font = 3)
text(2.5, 1, "texto a 180°", srt = 180, col = "orange")
text(2.5, 3, "texto a 45°", srt = 45, col = "green", cex = 2)



a <- matrix(rep(0:25, 10), nrow = 10, ncol = 26, byrow = T)

# Símbolos ----------------------------------------------------
matplot(a, lty = 1, pch = c(0:25), col = 1, main = "pch = c(0:25)",
        axes = F, ylab = "", cex = 1.4)
axis(2, at = 0:25, cex.axis = 0.9, las = 1)
abline(h = c(0:25), lty = 3)


pc <- princomp(iris[1:4])  # Análisis de Componentes Principales
library(lattice)
xyplot(pc$scores[, 2] ~ pc$scores[, 1], groups = iris$Species,
       pch = 21:23, xlab = "PC 1", ylab = "PC 2", auto.key = T)





library(rgl)
x_3d <- c(3, 5, 9, 12, 15, 23, 30)
y_3d <- c(7, 9, 14, 12, 15, 16, 18)
z_3d <- c(3, 5, 4, 13, 23, 3, 12)
plot3d(x_3d, y_3d, z_3d)




