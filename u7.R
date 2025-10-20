####################
# Copiar todo esto #
####################
# Hecho con gusto por Rafa @GonzalezGouveia

# video 07 – factores

# Objetivo: estudiar qué son factores en R.
# ——————————————–
# En este ejercicio vamos a:
# 1. Crear factores en R
# 2. Recodificar niveles de un factor
# 3. Ordenar niveles de un factor


#####################################
# correr esto antes de empezar…     #
#####################################

# crear vector de tallas (con inconsistencia de mayúsculas/minúsculas)
tallas <- c('m', 'g', 's', 'M','m', 'S')

# intentar graficar (produce el error de 'ylim' o un gráfico de frecuencias)
plot(tallas)

---
  
  ###################################
# práctica 1: crear factores en R #
###################################

# crear factor de un vector
tallas_factor <- factor(tallas)

# graficar factor (Funciona correctamente)
plot(tallas_factor)

# mirar niveles de factor
levels(tallas_factor)
# Resultado: ["G", "M", "S", "g", "m", "s"] - 6 niveles distintos.

---
  
  ######################################
# práctica 2: recodificando factores #
######################################

# Creando factor recodificado: fusiona minúsculas con mayúsculas
tallas_recodificado <- factor (tallas,
                               levels=c("g","m","M","S", "s", "G"), # Se especifican todos los niveles originales
                               labels= c("G","M","M","S", "S", "G")) # Se definen 3 nuevos niveles: "G", "M", "S"


# graficando tallas_recodificado
plot (tallas_recodificado)
# Resultado: Gráfico con solo 3 barras (G, M, S).

---
  
  #############################################
# práctica 3: ordenando niveles de factores #
#############################################

# ordenando niveles: Usamos el factor recodificado para establecer el orden lógico S < M < G

tallas_ordenado <- factor(tallas_recodificado, # Usamos el factor de la Práctica 2
                           ordered=TRUE,         # CLAVE: Define el factor como ordinal
                           levels = c("S", "M", "G")) # CLAVE: Define el orden explícito (S < M < G)


# viendo el orden en los niveles
levels(tallas_ordenado)
# Resultado: Se muestra el orden S < M < G

# graficando el factor ordenado
plot(tallas_ordenado)
# Resultado: El gráfico respeta el orden especificado: S, M, G.

# Hecho con gusto por Rafa @GonzalezGouveia
# Suscribete para más código en R https://bit.ly/2WNDhNR