x<-1
funcion_ejemplo<-function(){
  x<<-2
  return(x)
}

funcion_ejemplo()
print(x)