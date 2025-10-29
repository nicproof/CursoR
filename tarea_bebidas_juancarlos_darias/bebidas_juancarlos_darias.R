#bebidas <- data.frame(
#  Bebida = c('Café', 'Té', 'Refresco', 'Zumo', 'Agua'),
#  Preferencias = c(45, 30, 25, 20, 50)
#)

bebidas <- read.csv(file.choose(), header = TRUE)

barras <- barplot(bebidas$Preferencias, plot = FALSE) 
windows()
msgWindow(type="maximize")
plot(1, type = "n", 
     xlim = c(min(barras) - 0.5, max(barras) + 0.5), 
     ylim = c(0, 60),
     main = 'Preferencias de bebidas en el grupo',
     xlab = 'Tipo de bebida',
     ylab = 'Número de personas',
     xaxt = "n",
     col.main = "black",
     col.lab = "black")
par(bg = "gray")
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], 
     col = "lightgray", border = "black")
barplot(bebidas$Preferencias, add = TRUE, 
        col = c('darkgreen', 'forestgreen', 'darkolivegreen3', 'chartreuse', 'green'),
        border = 'darkgreen',
        axes = FALSE) # No dibuja los ejes de nuevo
axis(side = 1, at = barras, labels = bebidas$Bebida, col.axis = "black")
axis(side = 2, col.axis = "black")
grid(nx = NA, ny = NULL, lty = 2, col = 'white', lwd = 1)
text(x = barras, y = bebidas$Preferencias + 3,
     labels = bebidas$Preferencias, font=2,
     cex = 1, col = 'black')