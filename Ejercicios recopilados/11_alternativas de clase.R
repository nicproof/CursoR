impares <- c()
for (i in 1:10){
  if(!i%%2==0)
    impares<-append(impares,i+1)
}
print(impares)


conteo<-1
while(conteo<6){
  print(conteo)
  conteo=conteo+1
}

library(glue)
dinero<-100
for (i in 1:10){
  print(glue("Valor inicial: {dinero}"))
  if(dinero%%2==0){
    print("Numero par se le suma 3")
    dinero=dinero+3
    print(dinero)
  }else{
    print("Numero impar se le resta 5")
    dinero=dinero-5
    print(dinero)
  }
}


# ejercicio 5
dinero <- c()
dinero[1] <- 100
for (i in 2:201) {
  dinero <- append(dinero, ifelse(dinero[i - 1] %% 2 == 0, dinero[i - 1] + 3,
                      dinero[i - 1]  - 5))
}
dinero