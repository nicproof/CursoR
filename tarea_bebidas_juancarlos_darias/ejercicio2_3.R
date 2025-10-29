bebidas_wide <- read.csv(file.choose(), header = TRUE) 
colnames(bebidas_wide)[1] <- "GrupoEdad"
colores_grupos_edad <- hcl.colors(num_grupos, palette = "Dark 3") 

windows()
msgWindow(type="maximize")

par(mfrow = c(1, 2), mar = c(7, 4, 4, 5) + 0.1)

barras_agrupadas <- barplot(preferencias_matriz, 
                            beside = TRUE,
                            col = colores_grupos_edad, 
                            main = "Agrupadas por Edad",
                            ylab = "Número de Personas",
                            xlab = "Bebidas", 
                            ylim = c(0, max(preferencias_matriz) + 5),
                            border = NA)
legend("topright", 
       legend = rownames(preferencias_matriz), 
       fill = colores_grupos_edad, 
       title = "Grupo de Edad", 
       bty = "n", 
       cex = 0.9)
axis(side = 1, xaxt = 'n',
     at = colMeans(barras_agrupadas), # Centra la etiqueta en cada grupo
     labels = colnames(preferencias_matriz), # Etiquetas de las columnas (Bebidas)
     las = 2, # Rotar etiquetas para mejor lectura
     cex.axis = 0.8) 

preferencias_matriz_T <- t(preferencias_matriz)
totales_por_grupo_T <- colSums(preferencias_matriz_T)
totales_por_bebida <- rowSums(preferencias_matriz_T)
proporciones_final <- sweep(preferencias_matriz_T, 1, totales_por_bebida, FUN = "/")

barplot(proporciones_matriz,
        col = colores_grupos_edad,
        main = "Apiladas por Edad",
        ylab = "Densidad",
        xlab = "Bebidas",
        border = NA,
        names.arg = colnames(proporciones_matriz))

legend("topright", 
       legend = rownames(proporciones_matriz), 
       fill = colores_grupos_edad, 
       title = "Grupo de Edad", 
       bty = "n", 
       cex = 0.9)
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2) + 0.1)



