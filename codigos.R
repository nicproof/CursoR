bebidas <- data.frame(
  Bebida = c('Café', 'Té', 'Refresco', 'Zumo', 'Agua'),
  Preferencias = c(45, 30, 25, 20, 50)
)

barras <- barplot(names.arg = bebidas$Bebida,bebidas$Preferencias,
                  main = 'Preferencias de bebidas en el grupo',
                  xlab = 'Tipo de bebida',
                  ylab = 'Número de personas',
                  col = c('darkgreen', 'forestgreen', 'darkolivegreen3', 'chartreuse', 'green'),
                  border = 'darkgreen',
                  ylim = c(0, 60)),
                  

grid(nx = NA, ny = NULL, lty = 2, col = 'gold', lwd = 1)

text(x = barras, y = bebidas$Preferencias + 3,
     labels = bebidas$Preferencias,
     cex = 0.9, col = 'black')