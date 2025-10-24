# ejercicio 1
library(datasets) # paquete con los datos
mes <- airquality$Month
if (all(mes != 1)) {
  print("Ningún dato es del mes de enero")
}

# ejercicio 2
temperatura <- airquality$Temp
if (any(temperatura > 90)) {
  print("Alguno de los registros tiene temperatura superior a 90 Farenheit")
}

# ejercicio 3
if (any(temperatura > 100)) {
  print("Alguno de los registros tiene temperatura superior a 100 Farenheit")
} else {
  print("No hay ningun valor superior a 100")
}

# ejercicio 4
dinero <- 100
for (i in 1:200) {
    dinero <- ifelse(dinero %% 2 == 0, dinero + 3, dinero  - 5)
}
dinero

# ejercicio 5
dinero <- rep(0, 201)
dinero[1] <- 100 # dinero inicial

for (i in 2:201) {
  dinero[i] <- ifelse(dinero[i - 1] %% 2 == 0, dinero[i - 1] + 3,
                      dinero[i - 1]  - 5)
}
dinero

# ejercicio 6
dinero <- 100
while (dinero > 0) {
  dinero <- ifelse(dinero %% 2 == 0, dinero + 3, dinero - 5)
  i=i+1
}
dinero
i