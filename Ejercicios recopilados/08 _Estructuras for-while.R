# ejercicio 1
for (i in seq(1, 9, by = 2)) {
  
  print(i + 1)
}


# ejercicio 2
conteo <- 1
while (conteo < 6) {
  
  print(conteo)
  conteo <- conteo <- conteo + 1
}

# ejercicio 3
library(glue)
data("airquality")
for (i in 1:8) {
  print(glue("La temperatura es de {airquality$Temp[i]}ºF"))
}

# ejercicio 4
library(glue)
dinero<-100
for (i in 1:200) {
  dinero <- ifelse(dinero %% 2 == 0, dinero + 3, dinero  - 5)
}
dinero

# ejercicio 5
dinero <- rep(0, 201)
dinero[1] <- 100
for (i in 2:201) {
  dinero[i] <- ifelse(dinero[i - 1] %% 2 == 0, dinero[i - 1] + 3,
                      dinero[i - 1]  - 5)
}
dinero

# ejercicio 6
dinero <- 100
it<-0
while (dinero >= 0) {
  dinero <- ifelse(dinero %% 2 == 0, dinero + 3, dinero - 5)
  it=it+1
  print(it)
  print(dinero)
}
dinero


