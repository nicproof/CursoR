### Condicionales y bucles
##########################

notas <- c(8.2, 5.9, 7.1, 9.0, 4.8)

# 1) Usa un bucle for para recorrer el vector y mostrar si cada nota está “Aprobada” o
# “Suspensa” (nota ≥ 5).
for (nota in notas) {
  if (nota >= 5) {
    print(paste("La nota", nota, "está Aprobada."))
  } else {
    print(paste("La nota", nota, "está Suspensa."))
  }
}


# 2) Muestra cuántos alumnos han aprobado y cuántos han suspendido.
esta_aprobado <- notas >= 5
aprobados <- sum(esta_aprobado)
suspendidos <- sum(!esta_aprobado)
print(paste("Número de alumnos aprobados:", aprobados))
print(paste("Número de alumnos suspendidos:", suspendidos))





### Funciones
#############
calcular_promedio <- function(x) {
  promedio <- mean(x)
  return(promedio)
}

promedio_curso <- calcular_promedio(notas)
print(paste("El promedio de las notas es:", promedio_curso))





### listas anidadas
###################

curso <- list(
    nombre = "R Intermedio",
    modulos = list(
      modulo1 = list(nombre = "Condicionales y bucles", horas = 10),
      modulo2 = list(nombre = "Funciones", horas = 12),
      modulo3 = list(nombre = "Listas y estructuras anidadas", horas = 8)
    )
  )

horas_total <- sum(curso$modulos$*$notas)



# 1) Accede al nombre del segundo módulo.
nombre_modulo2 <- curso$modulos$modulo2$nombre
print("Nombre del segundo módulo:")
print(nombre_modulo2)


# 2) Calcula el total de horas del curso.
horas_por_modulo <- sapply(curso$modulos, function(m) m$horas)
total_horas <- sum(horas_por_modulo)
print("Horas por módulo:")
print(horas_por_modulo)
print(paste("Total de horas del curso:", total_horas))

# 3) Añade un nuevo módulo 4 con nombre “Importación de datos” y 10 horas.
nuevo_modulo <- list(nombre = "Importación de datos", horas = 10)
curso$modulos$modulo4 <- nuevo_modulo
print("Estructura de la lista 'modulos' actualizada:")
print(curso$modulos)





## Data Frames y filtrado
#########################

empleados <- data.frame(
    Nombre = c("Ana", "Luis", "Marta", "Pedro", "Lucía"),
    Departamento = c("Ventas", "IT", "IT", "Marketing", "Ventas"),
    Salario = c(1800, 2500, 2300, 2100, 1900)
  )

# 1) Muestra solo los empleados del departamento “IT”.
empleados_IT <- empleados[empleados$Departamento == "IT", ]
print("Empleados del departamento IT:")
print(empleados_IT)

# 2) Calcula el salario medio.
salario_medio <- mean(empleados$Salario)
print(paste("El salario medio es:", salario_medio))
# cat(paste("El salario medio es:", salario_medio))

# 3) Filtra los empleados con salario superior al promedio.
empleados_salario_alto <- empleados[empleados$Salario > salario_medio, ]
print("Empleados con salario superior al promedio (2120):")
print(empleados_salario_alto)





## Matrices y operaciones
#########################

# Crea una matriz 3x3 con valores aleatorios entre 1 y 10:
set.seed(123)
m <- matrix(sample(1:10, 9, replace = TRUE), nrow = 3)
print("Matriz m:")
print(m)

# 1) Calcula la suma total de la matriz.
suma_total <- sum(m)
print(paste("La suma total de la matriz es:", suma_total))

# 2) Crea una nueva matriz con los valores al cuadrado.
m_cuadrado <- m^2
print("Matriz con los valores al cuadrado:")
print(m_cuadrado)

# 3) Muestra la media por fila.
media_por_fila <- rowMeans(m)
print("Media de cada fila:")
print(media_por_fila)
