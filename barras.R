
library(dplyr)

load("C:\\Users\\Alumno\\Curso_R\\Graficas de Barras\\Estudiantes.Rdata")

df_archivo <- Estudiantes


Sexo <- as.factor(df_archivo$Sexo)
Fuma <- as.factor(df_archivo$Fuma) 


Cuentas1 <- table(Sexo)
Cuentas1 <- table(Sexo)
windows()#A) Tabla de frecuencias no agrupadas para Sexo
barplot(Cuentas1,                       #B) Se aplica barplot a esa tabla
        main="Diagrama de barra",       #C) Título principal     
        xlab="Sexo",                    #D) Tíulo del eje X
        ylab="Frecuencias",             #E) Título del eje Y
        #legend = rownames(Cuentas1),   #F) Mostrar las leyendas
        ylim = c(0, 300),               #G) Ajustar límites en eje Y
        col=c("pink","blue"),           #H) Colorear las barras
        density = c(5, 20),             #I) Para dar intensidades dentro de las barras
        angle = c(45, 90)               #J) Para el ángulo de la intensidad 
        #col = "brown"                  #K) Para el color de las líneas densas
)                               #L) No olvidar cerrar el paréntesis

legend("topleft",                       #M) Leyenda en parte superior izquierda
       c("Female","Male"),              #N) Las leyendas
       fill = c("pink","blue"),         #O) Colores de las leyendas 
       title = "Género",                #P) Título de la leyenda]
       text.font = 4,                   #Q) Fuente del texto de la leyenda
       bg='lightblue'                   #R) Color del fondo de la caja de la leyenda
) 



Cuentas2 <- table(Sexo, Fuma); Cuentas2
windows()
barplot(Cuentas2,                       #B) Se aplica barplot a esa tabla
        main="Diagrama de barras",      #C) Título principal     
        xlab="Fuma",                    #D) Tíulo del eje X
        ylab="Frecuencias",             #E) Título del eje Y
        legend = rownames(Cuentas2),    #F) Mostrar las leyendas
        ylim = c(0, 300),               #G) Ajustar límites en eje Y
        col=c("pink","blue")            #H) Colorear las barras
)             


Cuentas3 <- table(Fuma, Sexo); Cuentas3

barplot(Cuentas3,                       #B) Se aplica barplot a esa tabla
        main="Diagrama de barras",      #C) Título principal     
        xlab="Sexo",                    #D) Tíulo del eje X
        ylab="Frecuencias",             #E) Título del eje Y
        legend = rownames(Cuentas3),    #F) Mostrar las leyendas
        ylim = c(0, 300),               #G) Ajustar límites en eje Y
        col=c("yellow","brown")         #H) Colorear las barras
)


Cuentas4 <- table(Sexo, Fuma); Cuentas2

barplot(Cuentas2,                            #B) Se aplica barplot a esa tabla
        main="Diagrama de barras",           #C) Título principal     
        xlab="Fuma",                         #D) Tíulo del eje X
        ylab="Frecuencias",                  #E) Título del eje Y
        legend = rownames(Cuentas2),         #F) Mostrar las leyendas
        ylim = c(0, 200),                    #G) Ajustar límites en eje Y
        col=c("moccasin","mediumseagreen"),  #H) Colorear las barras
        beside=TRUE                          #I) Para agrupar las barras
)  


Cuentas5 <- table(Fuma, Sexo); Cuentas5

barplot(Cuentas3,                              #B) Se aplica barplot a esa tabla
        main="Diagrama de barras",             #C) Título principal     
        xlab="Sexo",                           #D) Tíulo del eje X
        ylab="Frecuencias",                    #E) Título del eje Y
        legend = rownames(Cuentas3),           #F) Mostrar las leyendas
        ylim = c(0, 200),                      #G) Ajustar límites en eje Y
        col=c("Indianred1","lightslateblue"),  #H) Colorear las barras
        beside=TRUE                            #I) Para agrupar las barras
)  

windows()
par(mfrow=c(2,2), oma=c(0, 0, 4, 0))
barplot(Cuentas1, main="Diagrama simple (sin color) ", xlab="Eje X", ylab="Eje Y", 
        ylim = c(0, 400))

barplot(Cuentas2, main="Diagrama simple (a color)", xlab="Eje X", ylab="Eje Y", col=c("pink","blue"),
        ylim = c(0, 400))

barplot(Cuentas3, main="Barras apiladas", xlab="Eje X", ylab="Eje Y", col=c("yellow","brown"), 
        legend = rownames(Cuentas3), ylim = c(0, 400))

barplot(Cuentas4, main="Barras agrupadas", xlab="Eje X", ylab="Eje Y", col=c("green","red"),
        legend = rownames(Cuentas4), ylim = c(0, 400), beside=TRUE)

mtext(side=3, line=0, cex=1.2, outer=T,"Unión de diagramas de barras con par()")

windows()
def.par <- par(no.readonly = TRUE)
par(oma = c(0, 0, 3, 0))

B <- layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))
#layout.show(B)

barplot(Cuentas1, main="Diagrama simple (sin color) ", xlab="Eje X", ylab="Eje Y", 
        ylim = c(0, 400))

barplot(Cuentas2, main="Diagrama simple (a color)", xlab="Eje X", ylab="Eje Y", col=c("pink","blue"),
        ylim = c(0, 400))

barplot(Cuentas3, main="Barras apiladas", xlab="Eje X", ylab="Eje Y", col=c("yellow","brown"), 
        legend = rownames(Cuentas3), ylim = c(0, 400))

barplot(Cuentas4, main="Barras agrupadas", xlab="Eje X", ylab="Eje Y", col=c("green","red"),
        legend = rownames(Cuentas4), ylim = c(0, 400), beside=TRUE)

mtext(side=3, line=0, cex=1.2, outer=T,"Unión de histogramas con layout()")

