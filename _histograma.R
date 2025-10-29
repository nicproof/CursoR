distancia <- c(241.1, 284.4, 220.2, 272.4, 271.1, 268.3,
               291.6, 241.6, 286.1, 285.9, 259.6, 299.6,
               253.1, 239.6, 277.8, 263.8, 267.2, 272.6,
               283.4, 234.5, 260.4, 264.2, 295.1, 276.4,
               263.1, 251.4, 264.0, 269.2, 281.0, 283.2)

# Frecuancia absoluta
hist(distancia, 
     main = "Histograma de las frecuencias", xlab="Varores de las distancias", 
     ylab = "Numero de repeticiones")

# Densidad
hist(distancia,
     prob = TRUE, 
     main = "Histograma de densidad", ylab = "Densidad")

# grid
hist(distancia, prob = TRUE, ylab = "Densidad", main = "Grid")
grid(nx = NA, ny = NULL, lty = 2, col = "red", lwd = 1)
hist(distancia, prob = TRUE, add = TRUE, col = "darkorange")

# par
windows()
msgWindow(type="maximize")
par(mfrow = c(1, 3))
hist(distancia, breaks = 2, main = "Pocas clases", ylab = "Frecuencia")
hist(distancia, breaks = 50, main = "Demasiadas clases", ylab = "Frecuencia")
hist(distancia, main = "Método de Sturges", ylab = "Frecuencia")
par(mfrow = c(1, 1))

# KernSmooth
library(KernSmooth)
ancho_barras <- dpih(distancia)
nbarras <- seq(min(distancia) - ancho_barras,
               max(distancia) + ancho_barras, by = ancho_barras)
hist(distancia, breaks = nbarras, main = "KernSmooth", ylab = "Frecuencia")

# superposicion
set.seed(1)
x <- rnorm(1000)    # Primer grupo
y <- rnorm(1000, 1) # Segundo grupo
hist(x, main = "Dos variables", ylab = "Frecuencia")
hist(y, add = TRUE, col = rgb(1, 0, 0, alpha = 0.5))

# tres histogramas
par(mfrow = c(1, 3))
set.seed(1)
x <- rnorm(1000)    
y <- rnorm(1000, 1) 
hist(x, main = "Histograma de X", xlab = "Valor", ylab = "Frecuencia",
        xlim = range(c(x, y)), ylim = c(0, 200))

hist(y, main = "Histograma de Y", xlab = "Valor",  ylab = "Frecuencia",
        col = rgb(1, 0, 0, alpha = 0.5), xlim = range(c(x, y)), ylim = c(0, 200))

hist(x, main = "Superpodición X e Y", xlab="Valor", ylab = "Frecuencia")
hist(y, add = TRUE, col = rgb(1, 0, 0, alpha = 0.5))
par(mfrow = c(1, 1))



