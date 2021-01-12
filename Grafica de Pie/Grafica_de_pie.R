
# Para hacer un gráfico de Pie con ggplot es recomendable  efectuar un 
# gráfico de barras, con todas las barras apiladas, después de 
# hacer este gráfico se utiliza la transformación circular 
# coord_polar(theta=“y”) para transformar los valores de las 
# alturas en ángulos. 

# Para este ejemplo necesitaras tener 
# cargada la librería ggplot2 y scales.

library(ggplot2)
library(scales)

#Lo primero es tener el  conjunto de datos con grupos y valores 
# los valores  son porcentajes y deben sumar 100

data<-data.frame(grupos=c("A","B","C","D"),
               porcentaje=c(30,20,15,35))
# despúes de esto  ya podemos  hacer nuestro gráfico de barras
ggplot(data,mapping = aes(x="",y=porcentaje, fill=grupos))+
    geom_bar(stat = "identity",color="white")

# Para hacer la transformación usamos coord_polar(theta=“y”) con la 
# “y” le indicamos al programa que lo que queremos cambiar en la 
#  geometría son las alturas de las barras.

data

ggplot(data,aes(x="",y=porcentaje, fill=grupos))+
    geom_bar(stat = "identity",color="white")+
    coord_polar(theta="y")

# Para agregar los valores como texto utilizamos geom_text(),
# para hacer esto es es necesario tener el texto que queremos.

# Se hace geom_text(aes(labels=“nuestro texto”),position=postion_stack(vjust=0.5))
# el parámetro vjust=0.5 hace que los valores se coloquen al 50% de las barras, 
# o sea en medio de cada barra.

ggplot(data,aes(x="",y=porcentaje, fill=grupos))+
    geom_bar(stat = "identity",
             color="white")+
    geom_text(aes(label=porcentaje),
              position=position_stack(vjust=0.5))

# Para hacer esto hacemos gggplot()+geom_bar()+geom_text(), agregando los datos,
# las estéticas y todos los parametros.

ggplot(data,aes(x="",y=porcentaje, fill=grupos))+
    geom_bar(stat = "identity",
             color="white")+
    geom_text(aes(label=porcentaje),
              position=position_stack(vjust=0.5),color="white",size=6)+
    coord_polar(theta = "y")

### PERSONALIZANDO EL GRAFICO
# 1 <- Cambiamos el color con scale_fill_manual().
# 2 <- Agregamos el simbolo de porcentaje con el comando percent(de la libreria scales)
# 3 <- Agregamos título y cambimos tema.

ggplot(data,aes(x="",y=porcentaje, fill=grupos))+
    geom_bar(stat = "identity",
             color="white")+
    geom_text(aes(label=percent(porcentaje/100)),
              position=position_stack(vjust=0.5),color="white",size=6)+
    coord_polar(theta = "y")+
    scale_fill_manual(values=c("salmon","steelblue","orange","gray"))+
    theme_void()+
    labs(title="Gráfico de Pie")

# GRAFICO DE DONAS


# Para hacer el gráfico de dona establecemos x=2 y xlim(0.5,2.5) de esta
# forma al rotar la barra se forma la dona, esto pues la rotación se 
# hace respecto al origen.

ggplot(data,aes(x=2,y=porcentaje, fill=grupos))+
    geom_bar(stat = "identity",
             color="white")+
    geom_text(aes(label=percent(porcentaje/100)),
              position=position_stack(vjust=0.5),color="white",size=6)+
    coord_polar(theta = "y")+
    scale_fill_manual(values=c("salmon","steelblue","orange","gray"))+
    theme_void()+
    labs(title="Gráfico de Dona")+
    xlim(0.5,2.5)


