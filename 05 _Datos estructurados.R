# ejercicio 1
x <-matrix(0, nrow=2, ncol=3)
x
y <-matrix(0, nrow=3, ncol=7)
y

# ejercicio 2
resultado = (y+1)*(1/5)
resultado

# ejercicio 3
traspuesta = t(y)
traspuesta
dim(t(y))
print("Numero de colmnas:")
ncol(t(y))
print("Numero de filas:")
nrow(t(y))

# ejercicio 4
matriz <- matrix(1:12, nrow = 4)
matriz
apply(matriz, MARGIN=2, FUN="sum")

# ejercicio 5
matriz <- matrix(1:12, nrow = 4)
matriz
sumatotal <-sum(matriz)
sumatotal
totalelementos <-length(matriz)
totalelementos
media <- (sumatotal/totalelementos)
media

mediafila <-apply(matriz, MARGIN=1, FUN="mean")
mediafila

mediacolumna <-apply(matriz, MARGIN=2, FUN="mean")
mediacolumna

# ejercicio 6
library(datasets)
names(airquality)

# ejercicio 7
dim(airquality)
nrow(airquality)
ncol(airquality)

# ejercicio 8
filtro_fila <- subset(airquality, subset = Month == 7)
filtro_fila

# ejercicio 9
filtrar_meses <- subset(airquality, subset = !(Month %in% c(7,8)))
filtrar_meses

# ejercicio 10
filtro_col <- subset(airquality,  select = c("Ozone","Temp"))
filtro_col

# ejercicio 11
filtro_datos <- subset(airquality, subset = Month == 8, 
                       select=c("Temp","Wind"))
filtro_datos

# ejercicio 12
filasborradas <-nrow(airquality) - nrow(filtro_datos)
filasborradas
names(filtro_datos)<- c("tempreratura","viento")
filtro_datos

# ejercicio 13
columnafecha <-as_date(paste("1973", airquality$Month, airquality$Day, sep = "-"))
data.frame(airquality, columnafecha)