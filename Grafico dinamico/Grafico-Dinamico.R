### 
## GRAFICAS ANIMADO DEL COVID-19 PARA BOLIVIA Y PAISES DE LA REGION
library(pacman)
library(ggthemes)
library(tidyverse)
library(RColorBrewer)
library(directlabels)
library(av)
p_load("base64enc", "htmltools", "mime", "xfun", "prettydoc","readr", "knitr","DT","dplyr", "ggplot2","plotly", "gganimate","gifski","scales")


url_conf <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
url_decesos <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"
url_recuperados <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv"
datos_conf <- read.csv(url_conf)
datos_decesos <- read.csv(url_decesos)
datos_recuperados <- read.csv(url_recuperados)
# Definir variables (Extraer datos)
# Confirmados en otros paises
conf_peru <- t(datos_conf[datos_conf$Country.Region=="Peru" ,])
conf_chi <- t(datos_conf[datos_conf$Country.Region=="Chile" ,])
conf_arg<- t(datos_conf[datos_conf$Country.Region=="Argentina" ,])
conf_uru <- t(datos_conf[datos_conf$Country.Region=="Uruguay" ,])
conf_col <- t(datos_conf[datos_conf$Country.Region=="Colombia" ,])
# Confirmados Bolibia
conf_boli <- t(datos_conf[datos_conf$Country.Region=="Bolivia" ,])
# Decesos Bolivia
dec_boli <- t(datos_decesos[datos_decesos$Country.Region=="Bolivia" ,])
# Recuperados
rec_boli <- t(datos_recuperados[datos_recuperados$Country.Region=="Bolivia" ,])


## Formatear datos 
# * Eliminar campos no utilizables
# * Formatear las Fechas
# * Crear un Marco de Datos (*data frame*)
Fecha <- seq(from = as.Date("2020-01-22"), to = as.Date("2021-02-23"), by = "day" )
vec1 <- as.vector(conf_peru)
vec2 <- vec1[5:403]
num1 <- as.numeric(vec2)
Peru <- as.vector(num1)
vec1 <- as.vector(conf_chi)
vec2 <- vec1[5:403]
num1 <- as.numeric(vec2)
Chile <- as.vector(num1)
vec1 <- as.vector(conf_arg)
vec2 <- vec1[5:403]
num1 <- as.numeric(vec2)
Argentina <- as.vector(num1)
vec1 <- as.vector(conf_uru)
vec2 <- vec1[5:403]
num1 <- as.numeric(vec2)
Uruguay <- as.vector(num1)
vec1 <- as.vector(conf_col)
vec2 <- vec1[5:403]
num1 <- as.numeric(vec2)
Colombia <- as.vector(num1)
vec1 <- as.vector(conf_boli)
vec2 <- vec1[5:403]
num1 <- as.numeric(vec2)
Bolivia <- as.vector(num1)
# BOLIVIA
## Casos confirmados
vec1 <- as.vector(conf_boli)
vec2 <- vec1[5:403]
num1 <- as.numeric(vec2)
Confirmados <- as.vector(num1)
## Casos Desecos
vec1 <- as.vector(dec_boli)
vec2 <- vec1[5:403]
num1 <- as.numeric(vec2)
Decesos <- as.vector(num1)
## Casos Recuperados
vec1 <- as.vector(rec_boli)
vec2 <- vec1[5:403]
num1 <- as.numeric(vec2)
Recuperados <- as.vector(num1)
## Generacion de un Data Frame
dastos1 <- data.frame(Fecha, Confirmados, Decesos, Recuperados)
datos2 <-  dastos1 %>% gather("Confirmados","Recuperados","Decesos",key="covid", value="valor",-Fecha)
dastos3 <- data.frame(Fecha, Bolivia, Chile , Peru, Argentina, Uruguay, Colombia)
datos4 <-  dastos3 %>% gather("Bolivia","Chile","Peru", "Argentina", "Uruguay", "Colombia", key="covid_p", value="valor",-Fecha)

#GRAFICA 
pq =
    ggplot(data = datos2, aes(x= Fecha, y=valor, group=covid, colour=covid)) +
    geom_line(size=1, show.legend = T) +
    #theme_minimal()+
    #theme_classic()+
    #theme_economist()+
    #theme_gdocs()+
    #theme_solarized(light = F)+
    theme_minimal()+ 
    theme(plot.title = element_text(size=18))+
    theme(axis.text = element_text(size = 14))+
    theme(text = element_text(size = 13))+
    scale_color_manual(values=c("#d11702", "#006400", "#1F65CC")) +
    theme(axis.text.x = element_text(angle=90,size=rel(1), vjust = 0.5))+
    theme(axis.text.y = element_text(angle=, size=rel(1),hjust = 1))+
    #theme(legend.position = c(0.9, 0.9))+
    #theme(legend.position = "right")+ 
    scale_x_date(date_breaks = "15 day", date_labels = "%b-%y")+
    labs(colour="COVID-19")+
    labs(title = 'Casos de COVID-19 en Bolivia',  
         x = NULL, y = NULL,
         caption = paste0("Imagen generado: ", Sys.time(), "\n", "Fuente: https://github.com/CSSEGISandData/COVID-19", "\n", "COVID-19 Data Repository by CSSE at Johns Hopkins University"))+ 
    geom_text(aes(label=valor, vjust = -1), size=7, show.legend = F)+
    #theme(plot.title = element_text(hjust = 0.5)) +
    geom_dl(aes(label=covid),  method=list("last.points",cex = 1.3, vjust = 1)) +
    transition_reveal(Fecha) +
    coord_cartesian(clip = 'off') + 
    ease_aes('cubic-in-out')
pq



animat2 <- animate(pq,renderer = av_renderer('covid-19.mp4'),
                   duration = 30,
                   end_pause = 20,
                   fps = 20,
                   width = 1280,
                   height = 720, 
                   nframes = 100,
)

utils::browseURL('covid-19.mp4')

