
library(dplyr)
load("C:\\Users\\Alumno\\Curso_R\\Graficas de Barras\\Estudiantes.Rdata")
df_archivo <- Estudiantes
Sexo <- as.factor(df_archivo$Sexo)
Fuma <- as.factor(df_archivo$Fuma) 

# Ejemplo 1 (diagrama para la variable Sexo)
Cuentas1 <- table(Sexo)                 #A) Tabla de frecuencias no agrupadas para Sexo
barplot(Cuentas1,                       #B) Se aplica barplot a esa tabla
        main="TITULO GENERAL",          #C) Título principal     
        xlab="Eje X",                   #D) Tíulo del eje X
        ylab="Eje Y",                   #E) Título del eje Y
        legend = rownames(Cuentas1),    #F) Mostrar las leyendas
        ylim = c(0, 300)                #G) Ajustar límites en eje Y
)                               #H) No olvidar cerrar el paréntesis


# Ejemplo 2 (colorear barras en diagrama para Sexo)
Cuentas1 <- table(Sexo)                 #A) Tabla de frecuencias no agrupadas para Sexo
barplot(Cuentas1,                       #B) Se aplica barplot a esa tabla
        main="TITULO GENERAL",          #C) Título principal     
        xlab="Eje X",                   #D) Tíulo del eje X
        ylab="Eje Y",                   #E) Título del eje Y
        legend = rownames(Cuentas1),    #F) Mostrar las leyendas
        ylim = c(0, 300),               #G) Ajustar límites en eje Y
        col=c("pink","blue")            #H) Colorear las barras
)  


# Ejemplo 3 (Más opciones en diagrama para Sexo)
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


#Ejemplo 3 (Distribución de Sexo dentro de cada nivel de Fuma)
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


#Ejemplo 4 (Distribución de Fuma dentro de cada nivel de Sexo)
Cuentas3 <- table(Fuma, Sexo); Cuentas3
barplot(Cuentas3,                       #B) Se aplica barplot a esa tabla
        main="Diagrama de barras",      #C) Título principal     
        xlab="Sexo",                    #D) Tíulo del eje X
        ylab="Frecuencias",             #E) Título del eje Y
        legend = rownames(Cuentas3),    #F) Mostrar las leyendas
        ylim = c(0, 300),               #G) Ajustar límites en eje Y
        col=c("yellow","brown")         #H) Colorear las barras
)


#Ejemplo 5 (Distribución de Sexo dentro de cada nivel de Fuma)
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


#Ejemplo 6 (Distribución de Fuma dentro de cada nivel de Sexo)
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


# Ejemplo 7 (density, angle, col)
set.seed(0)                                                                 
Datos <- data.frame(Letra=letters[1:6], Valor=sample(seq(3,20),6))          

barplot(height=Datos$Valor, name=Datos$Letra, density=c(5,10,20,30,7,18) , 
        angle=c(0,45,90,11,36,43) , col="darkblue", ylim = c(0, 30)) 


# Ejemplo 8 (text, axis)
ylim <- c(0, 1.5*max(Datos$Valor))                                                     
barra <- barplot(height=Datos$Valor, name=Datos$Letra, density=c(5,10,20,30,7,18) ,    
                 angle=c(0,45,90,11,36,43) , col="darkblue", xlab = '', ylim=ylim)     
text(x=barra, y = Datos$Valor, label = Datos$Valor, pos = 3, cex = 0.8, col = "red")   
axis(1, at=barra, labels=Datos$Letra, tick=FALSE, las=2, line=-0.5, cex.axis=0.5) 


# Ejemplo 9: Control de espacio (con space)
ylim <- c(0, 1.6*max(Datos$Valor))                                             
colores <- c("Indianred1","lightslateblue", "yellow", "blue", "orange", "brown")
barplot(height=Datos$Valor, name=Datos$Letra, col=colores,  ylim=ylim,  
        space=c(0.3, 0.1, 1.6, 3, 0.2, 2.1)  )


# Ejemplo 10: Control de ancho (con width)
ylim <- c(0, 1.6*max(Datos$Valor))                                             
colores <- c("Indianred1","lightslateblue", "yellow", "blue", "orange", "brown")
barplot(height=Datos$Valor, name=Datos$Letra, col=colores,  ylim=ylim,  
        width=c(0.3, 0.1, 1.6, 3, 0.2, 2.1)  )           


#Ejemplo 11: Control de ancho (con width)
windows()
msgWindow(type = "maximize")
set.seed(0) #A) Creando una semilla
datos <- data.frame( #B) Creando el data frame
  Letras = c("A","AA","BB","AC" ,"B","BB","BA","BC" ,"C","CC","CA","CB" ),
  Promedio = sample(seq(1,9) , 12 , replace=T),
  Frecuencia = sample(seq(3,40) , 12 , replace=T)
)
par(mar=c(6,4,4,4))  #C) Aumentando el margen inferior
ylim <- c(0, 1.7*max(datos$Promedio))   #D) El diagrama de barras
barra <- barplot(datos$Promedio , border=F , names.arg=datos$Letras , 
                 las=2 , 
                 col=c("darkgreen", "red", "darkblue",  "darkblue") , 
                 ylim=ylim , 
                 main="Diagrama de barras"
)
abline(v=c(4.9 , 9.7) , col="black")  #E) Añadiendo una línea
text(barra, datos$Promedio + 0.5 , paste("n= ", datos$Frecuencia, sep="") ,cex=1)  #F) Añadiendo un texto 
legend("top", legend = c("Letra sola","Letra repetida","Letra diferente" ) ,   #G) Ajustando la leyenda
       col = c("darkgreen", "red", "darkblue") , 
       bty = "n", pch=20 , pt.cex = 2, cex = 0.8, horiz = FALSE, inset = c(0.05, 0.05))


# Ejemplo 12 (con par)
B <- layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))  #layout.show(B)
barplot(Cuentas1, main="Diagrama simple (sin color) ", xlab="Eje X", ylab="Eje Y", 
        ylim = c(0, 400))
barplot(Cuentas2, main="Diagrama simple (a color)", xlab="Eje X", ylab="Eje Y", col=c("pink","blue"),
        ylim = c(0, 400))
barplot(Cuentas3, main="Barras apiladas", xlab="Eje X", ylab="Eje Y", col=c("yellow","brown"), 
        legend = rownames(Cuentas3), ylim = c(0, 400))
barplot(Cuentas4, main="Barras agrupadas", xlab="Eje X", ylab="Eje Y", col=c("green","red"),
        legend = rownames(Cuentas4), ylim = c(0, 400), beside=TRUE)


#Ejemplo 13 (con layout: gráfica sin título)
windows()
msgWindow(type = "maximize")
B <- layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))  #layout.show(B)
barplot(Cuentas1, main="Diagrama simple (sin color) ", xlab="Eje X", ylab="Eje Y", 
        ylim = c(0, 400))
barplot(Cuentas2, main="Diagrama simple (a color)", xlab="Eje X", ylab="Eje Y", col=c("pink","blue"),
        ylim = c(0, 400))
barplot(Cuentas3, main="Barras apiladas", xlab="Eje X", ylab="Eje Y", col=c("yellow","brown"), 
        legend = rownames(Cuentas3), ylim = c(0, 400))
barplot(Cuentas4, main="Barras agrupadas", xlab="Eje X", ylab="Eje Y", col=c("green","red"),
        legend = rownames(Cuentas4), ylim = c(0, 400), beside=TRUE)


# Ejemplo 14 (con layout: gráfica con título)
def.par <- par(no.readonly = TRUE)
par(oma = c(0, 0, 3, 0))
B <- layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))  #layout.show(B)
barplot(Cuentas1, main="Diagrama simple (sin color) ", xlab="Eje X", ylab="Eje Y", 
        ylim = c(0, 400))
barplot(Cuentas2, main="Diagrama simple (a color)", xlab="Eje X", ylab="Eje Y", col=c("pink","blue"),
        ylim = c(0, 400))
barplot(Cuentas3, main="Barras apiladas", xlab="Eje X", ylab="Eje Y", col=c("yellow","brown"), 
        legend = rownames(Cuentas3), ylim = c(0, 400))
barplot(Cuentas4, main="Barras agrupadas", xlab="Eje X", ylab="Eje Y", col=c("green","red"),
        legend = rownames(Cuentas4), ylim = c(0, 400), beside=TRUE)
mtext(side=3, line=0, cex=1.2, outer=T,"Unión de histogramas con layout()")



#extra 1
windows()
msgWindow(type = "maximize")
set.seed(0) #A) Creando una semilla
datos <- data.frame( #B) Creando el data frame
  Letras = c("A","AA","BB","AC" ,"B","BB","BA","BC" ,"C","CC","CA","CB" ),
  Promedio = sample(seq(1,9) , 12 , replace=T),
  Frecuencia = sample(seq(3,40) , 12 , replace=T)
)
par(bg = "black", fg = "white", col.main = "white", col.lab = "white", col.axis = "white", mar = c(6, 4, 4, 4))
ylim <- c(0, 1.7 * max(datos$Promedio))  #D) El diagrama de barras
barra <- barplot(datos$Promedio , border = F , names.arg = datos$Letras ,
                 las = 2 ,
                 col = c("cyan", "yellow", "magenta", "magenta") , # 💡 Sugerencia: Usar colores brillantes/claros para las barras sobre fondo oscuro.
                 ylim = ylim ,
                 main = "Diagrama de barras",
                 col.axis = "white", # Asegura que los números de los ejes sean blancos
                 col.lab = "white" # Asegura que las etiquetas del eje sean blancas
)
abline(v = c(4.9, 9.7), col = "gray50")  #E) Añadiendo una línea (cambiada a gris para visibilidad)
text(barra, datos$Promedio + 0.5 , paste("n= ", datos$Frecuencia, sep="") , cex = 1, col = "white")
legend("top", legend = c("Letra sola", "Letra repetida", "Letra diferente") ,  #G) Ajustando la leyenda
       col = c("cyan", "yellow", "magenta") , # Ajustar los colores a los nuevos colores de las barras
       text.col = "white", # Esto hace que el texto de la leyenda sea blanco
       bty = "n", pch = 20 , pt.cex = 2, cex = 0.8, horiz = FALSE, inset = c(0.05, 0.05))