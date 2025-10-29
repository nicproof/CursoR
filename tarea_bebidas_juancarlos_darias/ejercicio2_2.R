bebidas_wide <- read.csv(file.choose(), header = TRUE) 

colnames(bebidas_wide)[1] <- "GrupoEdad"
preferencias_matriz <- as.matrix(bebidas_wide[, -1])

rownames(preferencias_matriz) <- bebidas_wide$GrupoEdad
colnames(preferencias_matriz) <- c("Café", "Té", "Refresco")
totales_por_grupo <- rowSums(preferencias_matriz)
proporciones_matriz <- sweep(preferencias_matriz, 1, totales_por_grupo, FUN = "/")

colores_bebidas <- c("#6F4E37", "#38761D", "#FF7F00")

par(mfrow = c(1, 1), mar = c(7, 4, 4, 2) + 0.1) 

barras_agrupadas <- barplot(preferencias_matriz, 
                            beside = TRUE, # ¡Clave para barras agrupadas!
                            col = colores_bebidas,
                            main = "Comparación por Edad",
                            ylab = "Número de Personas",
                            xlab = "Bebidas", 
                            ylim = c(0, max(preferencias_matriz) + 5),
                            border = NA)
legend("topright", 
       legend = colnames(preferencias_matriz), 
       fill = colores_bebidas, 
       title = "Bebida", 
       bty = "n", 
       cex = 0.9)
axis(side = 1, 
     at = colMeans(barras_agrupadas), # Centra la etiqueta en cada grupo
     labels = rownames(preferencias_matriz), 
     las = 2, # Rotar etiquetas para mejor lectura
     cex.axis = 0.8) 
barplot(proporciones_matriz,
        col = colores_bebidas,
        main = "2. Distribución Proporcional (Barras Apiladas)",
        ylab = "Proporción (0% a 100%)",
        xlab = "Grupo de Edad",
        ylim = c(0, 1.05),
        border = NA,
        names.arg = rownames(proporciones_matriz)) # Etiquetas X directas
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2) + 0.1)