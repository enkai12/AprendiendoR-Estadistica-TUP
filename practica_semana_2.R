# --- PASO 1: CARGAR Y EXPLORAR DATOS ---

# 1. Cargar la librería (haz esto cada vez que inicies una nueva sesión)
# library() es como encender la herramienta que ya instalaste.
if (!require(readxl)) install.packages("readxl")
library(readxl)

# 2. Leer el archivo de Excel
# Usamos la función read_excel() del paquete que acabamos de cargar.
datos_programadores <- read_excel("encuesta_programadores.xlsx")

# 3. Explorando nuestros datos (que ahora son un "tibble")
# NOTA: La función read_excel() crea un "tibble", que es una versión moderna y mejorada
# de los data frames de R. Por ahora, lo importante es saber que funciona de manera muy
# similar, pero es más eficiente. Seguiremos con este formato moderno.
#
# head() nos muestra las primeras 6 filas.
print("Primeras filas de los datos:")
head(datos_programadores)

# summary() nos da un resumen estadístico rápido de cada columna.
print("Resumen estadístico de los datos:")
summary(datos_programadores)