install.packages("dplyr")

#ruta<-file.choose()

library(dplyr)
df_archivo <-load("C:\\Users\\Alumno\\Curso_R\\Graficas de Barras\\Estudiantes.Rdata")
#df_archivo<-Estudiantes
Sexo<-as.factor(df_archivo$Sexo)
Fuma<-as.factor(df_archico$Fuma)

Cuentas1 <- table(Sexo)                 
barplot(Cuentas1,                       
        main="TITULO GENERAL",          
        xlab="Eje X",                   
        ylab="Eje Y",                   
        legend = rownames(Cuentas1),    
        ylim = c(0, 300)                
)      

