#ejercicio 1
load("C:\\Users\\Alumno\\Curso_R\\titanic.RData")
titanic

#ejercicio 2
ncol(titanic)
nrow(titanic)

names(titanic)

#ejercicio 3
class(titanic$Name)
class(titanic$Pclass)
class(titanic$Age)
class(titanic$Survived)

#ejercicio 4
titanic$Survived <- ifelse(titanic$Survived==1, TRUE, FALSE)
titanic

#ejercicio 5
library(stringr)
solo_miss <- titanic$Name[str_detect(titanic$Name,"Miss.")]
solo_miss

#ejercicio 6
filtrado_datos <- titanic$Age[!is.na(titanic$Age)]
filtrado_datos
media_edad <- mean(filtrado_datos)
print("Edad media de todos:")
media_edad
filtrado_hombres <- mean(titanic$Age[!is.na(titanic$Age) & titanic$Sex=="male"])
print("Edad media hombres:")
filtrado_hombres
filtrado_mujeres <- mean(titanic$Age[!is.na(titanic$Age) & titanic$Sex=="female"])
print("Edad media mujeres:")
filtrado_mujeres

#ejercicio 7
filas_completas <- complete.cases(airquality)
filtrado_valores <- airquality[filas_completas, ]
filtrado_valores
nrow(filtrado_valores)
