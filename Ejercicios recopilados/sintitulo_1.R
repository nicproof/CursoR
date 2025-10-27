# Ejercicio 1: Función de suma simplificada
valor1<-0
valor2<-0
# 1. Definición de la función de suma
funcion_suma <- function(x, y) {
  # Eliminamos la comprobación de error con 'stop' para simplificar
  suma <- x + y
  return(suma)
}

# 2. Primera llamada de prueba explícita
print("Resultado de la suma 3 + 7 (prueba inicial):")
print(funcion_suma(3, 7))

# 3. Solicitud de entrada del usuario
# Utilizamos as.integer() para convertir la entrada de texto a entero.
# ADVERTENCIA: Si el usuario introduce texto, la variable será NA.
valor1 <- as.integer(readline(prompt = "Introduce un numero entero (valor 1):"))
valor2 <- as.integer(readline(prompt = "Introduce otro numero entero (valor 2):"))

# 4. Llamada final a la función y MUESTRA del resultado
print("Resultado de la suma con los valores introducidos:")
print(funcion_suma(valor1, valor2))