#
#
###############  PERSONALIZANDO EL TEMA EN GGPLOT2 ############################

# La versión oscura debe tener un fondo negro para que coincida con los 
# portaobjetos de microscopía use los mismos colores con ambos
# elementos del gráfico para modificar:  área de trazado y fondo del margen del 
# mismo color, líneas de cuadrícula principales color claro,
# líneas de cuadrícula menores aún más claras, apenas perceptibles, leyenda 
# predeterminada debajo, paneles de facetas en cuadrado y / o texto de panel en 
# negrita fondo claro blanco, texto negro Necesita 3 juegos de 16 colores 
# (claro, medio, oscuro) versiones oscuras/claras (intercambiar negro / blanco) 
# necesita 1 degradado de un solo color, 1  degradado de doble color

theme_unique_light <- function (base_size = 12, base_family = "") {
  ret <- (theme_bw(base_size = base_size, base_family = base_family) +
            theme(text = element_text(colour = "black"),
                  title = element_text(color = "black"),
                  line = element_line(color = "black"),
                  rect = element_rect(fill = "white", color = "black"),
                  axis.ticks = element_line(color = "black"),
                  axis.line = element_line(color = "black", linetype = 1),
                  legend.background = element_rect(fill = NULL, color = NULL),
                  legend.position = "bottom",
                  legend.key = element_rect(fill = NA, color = NA, linetype = 0),
                  strip.background = element_rect(fill=NA,colour=NA,size=NA,linetype = NULL),
                  strip.text = element_text(color="black",face="bold",vjust=.5,hjust=.5),
                  panel.background = element_rect(fill = NULL, color = NULL),
                  panel.border = element_blank(),
                  panel.grid = element_line(color = "#f0f0f0"),
                  panel.grid.major = element_line(color = "#f0f0f0"),
                  panel.grid.minor = element_line(color = "#fAfAfA"),
                  plot.background = element_rect(fill = NULL, colour = NA, linetype = 0)))
  ret
}



theme_unique_dark <- function (base_size = 12, base_family = "") {
  ret <- (theme_bw(base_size = base_size, base_family = base_family) +
            theme(text = element_text(colour = "white"),
                  title = element_text(color = "white"),
                  line = element_line(color = "white"),
                  rect = element_rect(fill = "black", color = "white"),
                  axis.ticks = element_line(color = "#969696"),
                  axis.title = element_text(color = "white"),
                  axis.text = element_text(color = "#eaeaea"),
                  axis.line = element_line(color = "#969696", linetype = 1),
                  legend.background = element_rect(fill = NULL, color = NULL),
                  legend.position = "bottom",
                  legend.key = element_rect(fill = NA, color = NA, linetype = 0),
                  strip.background = element_rect(fill=NA,colour=NA,size=NA,linetype = NULL),
                  strip.text = element_text(color="white",face="bold",vjust=.5,hjust=.5),
                  panel.background = element_rect(fill = "black", color = NULL),
                  panel.border = element_blank(),
                  panel.grid = element_line(color = "#252525"),
                  panel.grid.major = element_line(color = "#353535"),
                  panel.grid.minor = element_line(color = "#101010"),
                  plot.background = element_rect(fill = "black", colour = "black", linetype = 0)))
  ret
}