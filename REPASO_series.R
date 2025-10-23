biomasa <- c(2, 5, 15, 35, 89, 115)
plot(1:6, biomasa, type = "o", xlab = "semana", col = 2)



Mes <- c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
         "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")
Serie1 <- c(147, 146, 144, 141, 138, 132, 115, 89, 35, 15, 5, 2)
Serie2 <- c(8, 14, 26, 46, 76, 100, 114, 126, 134, 138, 140, 141)
Serie3 <- c(20, 50, 114, 134, 150, 158, 162, 165, 167, 169, 170, 170)

datos <- data.frame(Mes, Serie1, Serie2, Serie3)
print(datos)

matplot(datos[, 2:4], type = "o", xlab = " ", ylab = "Biomasa",
        pch = c(2, 8, 15), col = c(2,3,4), axes = F, lty = 1)
axis(1, at = seq(1, 12), labels = datos[[1]], cex.axis = 0.9, las = 2)
axis(2, at = seq(0, 190, 20), cex.axis = 0.9, las = 1)
box()
legend(6, 70, names(datos[, 2:4]), col = c(2, 3, 4), cex = 0.9,
       pch = c(2, 8, 15), lty = 1)