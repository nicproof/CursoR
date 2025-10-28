#ejercicio 1
# ruta <- file.choose() # YO ya se lo había indicado con anterioridad
load("C:\\Users\\Alumno\\Curso_R\\titanic.RData")
titanic

#ejercicio 2
ncol(titanic)
nrow(titanic)

names(titanic)

colnames(titanic) <- c("ID_Pasajero", "Superviviente", "Clase_Billete", "Nombre",
                       "Sexo", "Edad", "Hermanos_Conyuges", "Hijos_Padres",
                       "Billete", "Tarifa", "Cabina", "Puerta_Embarque")
names(titanic)

#ejercicio 3
class(titanic$Nombre)
class(titanic$Clase_Billete)
class(titanic$Edad)
class(titanic$Superviviente)

#ejercicio 4
titanic$Superviviente <- ifelse(titanic$Superviviente==1, TRUE, FALSE)
titanic$Superviviente <- as.logical(titanic$Superviviente) # Otra forma mas elegante
titanic

#ejercicio 5
library(stringr)
solo_miss <- titanic$Nombre[str_detect(titanic$Nombre,"Miss.")]
solo_miss <- titanic$Nombre[str_detect(titanic$Nombre, pattern="Miss.")]
solo_miss

#ejercicio 6
filtrado_datos <- titanic$Edad[!is.na(titanic$Edad)] # tambien se puede usar "na.rm"
filtrado_datos
media_edad <- mean(filtrado_datos)
print("Edad media de todos:")
media_edad
filtrado_hombres <- mean(titanic$Edad[!is.na(titanic$Edad) & titanic$Sexo=="male"])
print("Edad media hombres:")
filtrado_hombres
filtrado_mujeres <- mean(titanic$Edad[!is.na(titanic$Edad) & titanic$Sexo=="female"])
print("Edad media mujeres:")
filtrado_mujeres

#ejercicio 7
edades_sin_na <- titanic$Edad[!is.na(titanic$Edad)]
edades_ascendente <- sort(edades_sin_na)
edades_descendente <- sort(edades_sin_na, decreasing = TRUE)
print("Edades por orden ascendentes")
print(edades_ascendente)
print(edades_descendente)

ordenado<-titanic[order(titanic$Edad)]