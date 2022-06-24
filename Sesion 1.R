#Intrucciones para instalar R y R Studio

#1. Descargar R de https://cran.r-project.org e instalar

#2. Descargar Rstudio de https://www.rstudio.com e instalar.


#El codigo R esta compuesto por una serie de expresiones que deben estar
#escritas correctamente, llamada sintaxis. Ejemplo de expresiones en R incluyen,
#expresiones aritméticas, instrucciones de control (condicionales e iterativas)
#e instrucciones de asignación.


#R como calculadora:

2+2

2*3

2^3

5/2

#Comparaciones de numeros 

2 == 1

2 == 2

3 > 2

2 < 3 

#R proporciona cuatro tipos básicos de datos, tambien conocidos como 
#vectores atomicos: logical numeric integer character

#Variables y Asignaciones

#NUMERICO
x <- 2
x
class(x)
length(x)

#x es una variable pero tambien es un "vector numerico de longitud 1"


#ENTERO
numero<-1L
class(numero)

#Entero (o integer) se utiliza para ser mas eficiente con la memoria, 
#la variable numeric es de tipo double

#CARACTERES
fruta <- "manzana"
fruta
length(fruta)
class(fruta)
nchar(fruta)


#LOGICO, toma los valores TRUE o FALSE
opcion<-TRUE
class(opcion)


#Los valores TRUE pueden corresponder a 1 y FALSE a 0.
opcion<-FALSE
opcion<-as.integer(opcion)
opcion

opcion<-TRUE
opcion<-as.integer(opcion)
opcion

#Y VICEVERSA, convertimos los enteros 1 y 0 a TRUE y FALSE
numero<-1
numero
numero<-as.logical(numero)
numero

#Todo el codigo R manipula objetos. El objeto, es el concepto principal 
#sobre el cual se fundamenta la tecnologia orientada a objetos. Un objeto puede
#ser visto como una entidad que posee atributos y efectua acciones. Ejemplos 
#de objetos en R incluyen las funciones, symbols (nombre objetos) e incluso 
#las expresiones. 


#SE PUEDEN COMPARAR OBJETOS EN R

"manzana" == "manzana"

"pera" == "uva"

# El orden no importa para ==

"uva" == "pera" 


#Usamos la función "c" para unir elementos
x <- c(1, 2, 3) 
x

#Note que hemos redefinido a x
class(x)
length(x)

#Para hacer un vector de cadenas de caracteres
frutas <- c("manzana", "platano", "fresa")
length(frutas)
class(frutas)
nchar(frutas)

#Para accesar a la primera componente
frutas[1]



#Podemos concatenar (pegar) cadenas de caracteres
paste("Una", "casa", "fea")
paste("Una", "casa", "10")

pegazon<-paste("Una", "casa", "fea")
pegazon

#Las listas y los vectores son muy similares. La diferencia es que
#en un vector todos los elementos son del mismo tipo mientras que una lista 
#puede tener elementos de diferentes classes, veamos:

lista<-list(1, "apple", 3)

class(list)

l <- list(x = 1:5, y = c('a', 'b'))
l

#Para accesar a los elementos de una lista

#Segundo elemento de l.
l[[2]]

#Solo el primer elemento
l[1]

#El elemento llamado x
l$x

#Lista con solo el elemento llamado y.
l['y']

#DATA FRAMES. Los analisis de datos se llevar acabo usando data 
#frames. Los dataframes tienen forma tabular con encabezados y renglones de
#datos, como hojas de calulo.

#Las podemos crear:
datos <- data.frame(sitio = c("A", "B", "C","D"),
                       temperatura = c(20, 30, 40,40))
datos

#Hay otras formas de crear dataframes apartir de vectores o matrices
#Para contar el numero de renglones o registros nrow()
nrow(datos)

#Para contar el numero de columnas o variables ncol()
ncol(datos)

#Podemos mostrar solo una de las columnas
datos$sitio

#O también
datos[1]

#Para mostrar los elementos diferentes de la columna
unique(datos$temperatura)

#Para accesar el primer renglon
datos[1,] 
  
#Para accesar la segunda columna
datos[,2] 
datos$temperatura
datos[[2]]

#Accesar primer renglon, primera columna  
datos[1,1] 

#Accesar primer y tercer renglon
datos[c(1,3),] 
  
#Podemos accesar a renglores basados en un algun criterio
datos[datos$sitio == "A",] #Imprimir todos los renglones que
#en la columna (variable) contengan "A"
  
datos[datos$temperatura == "40",] #Imprimir todos los renglones que
#en la columna (variable) contegan 40


#Podemos agregar columnas y renglones con las funciones rbind() y cbind()
datos
new<-c("A",30) #Para agregarse como renglon a datos, debe de tener las mismas 
#columnas
rbind(datos,new) #Muestra la union
datos<-rbind(datos,new) #Asigna la union a datos otra vez
datos

#Tambien podemos agregar otra columna
newC<-c(40,30,20,10,15)
datos<-cbind(datos,newC)
datos  

#Remover un renglon 
datos2<-datos[-3,]
datos2

#Remover una columna
datos2<-datos[,-3]
datos2

#Para mostrar los nombres de las columnas
datos
colnames(datos)

#Cambiar el nombre de las columnas
colnames(datos)<-c("SITIO","TEMP","TEMP2")
datos

#Cambiar el nombre a una columna en especifico
colnames(datos)[3]<-"HUM"
datos

#Mostrar los renglones con una columna con cierto valor
datos$TEMP == 30
datos[datos$TEMP == 30,]

#Uso de if
if (datos[1,2]> 40) {
  print("Caliente")} else print("Frio")
datos[1,2]

#Como hacer la misma operacion en todo el dataframe


#El dataframe se puede guardar en formato csv

#Sesion y seleccionar set working directory e introducir ubicacion
write.csv(datos,"datos.csv", row.names = FALSE)


#Tambien podemos leer csv y tratarlo como dataframe
ndatos<-read.csv("datos.csv")
ndatos

###Existen varias librerias para importar datos
#library(readxl)
#library(xlsx)

#Para instalar use:
#install.packages("readxl")
#install.packages("xlsx")

#Leer archivos de Excel usando readxl: read_excel(file.choose(), sheet = 1)
#Leer archivos de Excel usiando xlsxe: read.xlsx(file.choose(), sheetIndex = 1)
#En ambos casos se puede omitir sheet

#Tambien se puede usar la funcion subset() para seleccionar 
#renglones con ciertas caracteristicas
subset(datos, TEMP == "30") # Equivalent to datos[datos$TEMP == "30",]
subset(datos, TEMP == "30")

datos
#Para intersectar datos usamos &
datos[ which( datos$TEMP > "20" & datos$HUM > "20") , ]

#Para intersectar datos usamos &, con mayor o igual
datos[ which( datos$TEMP >= "20" & datos$HUM >= "20") , ]


#Para unir datos usamos |
datos[ which( datos$TEMP > "20" | datos$HUM > "20") , ]
  
#Algunas otras funciones utiles que nos ayudan con los data frames
str(datos)
  
summary(datos) #Muestra los quantiles de las variables numericas


#Matrices
A = matrix( c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, ncol = 3)
# Por default se llena la matrix de columna en columna
class(A)
colnames(A)

#Transformar una matrix a dataframe
A<-as.data.frame(A)
class(A)
colnames(A)
A

#Ahora utilizaremos un conjunto de datos mas grande y la libreria ggplot2 para graficar
library(ggplot2)
#Accesamos a los datos "diamonds" de la libreria ggplot2
data("diamonds")
diamonds
#Para ver los primeros 6 renglones
head(diamonds)
#Para ver los ultimos 6 rengloes
tail(diamonds)
#Para conocer las dimensiones del dataframe
dim(diamonds)

#Esta funcion nos da informacion de las variables 
str(diamonds)

#Resume cada variable numericas del dataframe
summary(diamonds)

#O tambien podemos acceder a cada una de las variables de la siguiente manera
summary(diamonds$price)

#Podemos asignale el objeto a una variable 
a<-summary(diamonds$price)
a
#y acceder a cada parametro
a[3]
#O tambien aplicar las funciones de manera individual: min(), max(), mean(),
#median(),quantile() y podemos agregar #sd()
quantile(diamonds$price,0.25)
quantile(diamonds$price,0.5)
quantile(diamonds$price,0.75)

#Funciones
min(diamonds$price)
max(diamonds$price)
mean(diamonds$price)
median(diamonds$price)
sd(diamonds$price)

#Tambien podemos generar las funciones personalizadas
cuadrado <- function(x){
  squared <- x*x
  return(squared)
}
cuadrado(2)


#Otra forma de accesar a una columa es por su posicion
diamonds[[7]]
diamonds$price


#Crear variable normalizada de precio
diamonds$normalizedprice<-(diamonds$price - mean(diamonds$price))/sd(diamonds$price)

#Comprobamos
mean(diamonds$normalizedprice)
round(mean(diamonds$normalizedprice))
sd(diamonds$normalizedprice)
hist(diamonds$normalizedprice)
?hist()
hist(diamonds$normalizedprice, main="Ejemplo", ylab = "Frecuencia",
     xlab = "Precio normalizado", col = "green")


#Mostrar renglones con alguna caracteristica cuantitativa
diamonds[diamonds$normalizedprice>0,]

#Contar los reglones
nrow(diamonds[diamonds$normalizedprice>0,])
nrow(diamonds[diamonds$normalizedprice<0,])
nrow(diamonds[diamonds$normalizedprice==0,])
nrow(diamonds)

#Comprobamos
nrow(diamonds[diamonds$normalizedprice>0,])+nrow(diamonds[diamonds$normalizedprice<0,])

#Mostrar renglones con alguna caracteristica cualitativa
diamonds[diamonds$cut=="Very Good",]

##Generar nuevas columnas
diamonds$suma<-diamonds$x+diamonds$y
diamonds$suma

#Tambien podemos ver los datos en forma tabular
View(diamonds)
str(diamonds)

#Muestra las diferentes niveles de la categoria cut
unique(diamonds$cut)

#Vemos que las categorias presentan un orden
dim(diamonds)


#Ciclo FOR, generacion de numeros y NA

#Generamos numeros de 3 en 3.
numeracion<-seq(1, 10, by=3)
numeracion

#Hasta el numeros de reglones de diamonds
numeracion<-seq(1, 15, by=3)
numeracion

numeracion<-seq(1, nrow(diamonds), by=3)
numeracion

#Para asignar NA a la columna de price cada tercer renglon
for(i in numeracion){
 #                     print(i)
diamonds$price[i]<-NA
  
                }

head(diamonds)
View(diamonds)

#Para contar el numero de NA's
sum(is.na(diamonds)) 

#Podemos remover todos los renglones con NA
na.omit(diamonds)

#Y asignarle a diamonds sin NA
diamonds<-na.omit(diamonds)
diamonds

#Graficamos con plot()
plot(price ~ carat, data = diamonds)

#Podemos personalizar
?plot()

plot(price ~ carat, data = diamonds, main="Ejemplo", 
     ylab = "Frecuencia",
     xlab = "Precio normalizado", col = "black")
     
#Guardar la grafica en archivo dos opciones:
#A) Directamente Plots->Export->PDF o Imagen

#B)
#1 Generar el archivo
pdf("rplot.pdf") 
#2. Crear la grafica
plot(price ~ carat, data = diamonds, main="Ejemplo", 
     ylab = "Frecuencia",
     xlab = "Precio normalizado", col = "black")
#3. Cerrar el archivo
dev.off()


# 1. Generar 
jpeg("rplot.jpg", width = 350, height = 350)
# 2. Create the plot
plot(price ~ carat, data = diamonds, main="Ejemplo", 
     ylab = "Frecuencia",
     xlab = "Precio normalizado", col = "black")
# 3. Close the file
dev.off()



#Regresion lineal price vs carat
mod <- lm(price ~ carat, data = diamonds)
summary(mod)

#Podemos graficar la linea que mejor ajusta los datos el diagrama de dispersión
plot(price ~ carat, data = diamonds)
abline(mod$coefficients[[1]], mod$coefficients[[2]], col = "red", lwd = 5)
  
colnames(diamonds)[7]<-"Precio"
colnames(diamonds)

#Volvemos a graficar
plot(Precio ~ carat, data = diamonds)
abline(mod$coefficients[[1]], mod$coefficients[[2]], col = "red", lwd = 5)


#Suavizacion
library("readxl")
#Opcion escoger el archivo S1gasto
read_excel(file.choose())


#Tenemos 3 opciones para importar datos
#1)Introduciendo la ubicacion del archivo
data1 <- read.excel("C:\\Users\\pro\\Downloads\\S1gasto.xls")

#2) Sesion-> Setworking directory-> Choose directory y escoger la carpeta
data1<-read_excel("S1gasto.xls")
#3) Seleccionar el archivo
data1<-read_excel(file.choose())

head(data1)
str(data1)
colnames(data1)
dim(data1)

#Diagrama de dispersion
plot(data1$Population,data1$Spending)

#Podemos personaliza el diagrama de dispersion
plot(data1$Population,data1$Spending,main='Diagrama de dispersion',xlab="Population",ylab='Spending',col = "red")


y<-data1$Spending
x<-data1$Population


#Para hacer smoothing, donde span es el parametro de suavizacion
ggplot(data1, aes(x, y)) +   # Draw ggplot2 scatterplot with smooth curve
  geom_point() +
  geom_smooth(se = FALSE,
              method = "loess",span = 0.5,
              formula = y ~ x)

# Para moster varias graficas en una salida 
par(mfrow=c(3,1)) #(3 renglones,1columna)
