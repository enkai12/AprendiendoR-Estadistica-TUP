# --- PASO 1: CARGAR Y EXPLORAR DATOS ---

# 1. Cargar la librería
# library() es como encender la herramienta que ya instalaste.
if (!require(readxl)) install.packages("readxl")
library(readxl)

# 2. Leer el archivo de Excel (lo renombre para evitar errores)
# Usamos la función read_excel()
datos_programadores <- read_excel("encuesta_programadores.xlsx")

# 3. Explorando nuestros datos (que ahora son un "tibble")
# NOTA: La función read_excel() crea un "tibble", que es una versión moderna y mejorada
# de los data frames de R. (Es más eficiente pero tiene menos compatibilidad)
#
# head() nos muestra las primeras 6 filas. (Sirve para confirmar si los datos se cargaron bien)
print("Primeras filas de los datos:")
head(datos_programadores)

# summary() es otra herramienta clave de exploración. Calcula
# estadísticas descriptivas básicas para cada columna de la tabla.
# Para columnas de texto (categóricas), cuenta cuántas veces aparece cada categoría.
# Para columnas numéricas, nos da el mínimo, máximo, media, mediana y cuartiles.
# Es perfecto para tener un panorama general de nuestros datos.
print("Resumen estadístico de los datos:")
summary(datos_programadores)

# --- PASO 2: TABLA PARA VARIABLE NOMINAL (Plataforma_Trabajo) ---

frec_abs_plataforma <- table(datos_programadores$Plataforma_Trabajo)
frec_rel_plataforma <- prop.table(frec_abs_plataforma)
tabla_plataforma <- cbind(Frec_Abs_Plataforma = frec_abs_plataforma, Frec_Rel_Plataforma = round(frel_plataforma, 3))
print("Tabla de Frecuencia para Plataforma de Trabajo:")
print(tabla_plataforma)











