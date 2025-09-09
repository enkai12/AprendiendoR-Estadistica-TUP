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

# Con la función print() muestro en la consola un título para que la salida
# sea más ordenada y fácil de leer.
print("Primeras filas de los datos:")

# head() es una función de exploración fundamental. Le paso mi objeto de datos
# y me muestra las primeras 6 filas. Esto me sirve para confirmar visualmente
# que los datos se cargaron bien y que los nombres de las columnas son correctos.
head(datos_programadores)

print("Resumen estadístico de los datos:")

# summary() es otra herramienta clave. Calcula estadísticas descriptivas
# básicas para cada columna de la tabla. Para texto, cuenta las categorías;
# para números, me da el mínimo, máximo, media y cuartiles.
# Es perfecto para tener un panorama general de mis datos.
summary(datos_programadores)


# --- PASO 2: TABLA PARA VARIABLE NOMINAL (Plataforma_Trabajo) ---

# La función table() es mi herramienta principal para calcular la frecuencia
# absoluta. Cuenta las ocurrencias de cada categoría en la columna que le
# especifico. Para acceder a la columna que quiero, uso la sintaxis
# 'nombre_de_la_tabla$nombre_de_la_columna'.
frec_abs_plataforma <- table(datos_programadores$Plataforma_Trabajo)

# prop.table() (tabla de proporciones) toma una tabla de frecuencia absoluta
# y calcula la frecuencia relativa para cada categoría, es decir, su
# proporción o porcentaje respecto al total.
frec_rel_plataforma <- prop.table(frec_abs_plataforma)

# cbind() (column bind) une varios vectores como columnas para formar una
# nueva tabla. Uso la función round() para redondear la frecuencia relativa
# a 3 decimales y que se vea más prolija.
tabla_plataforma <- cbind(Frec_Abs_Plataforma = frec_abs_plataforma, Frec_Rel_Plataforma = round(frec_rel_plataforma, 3))

print("Tabla de Frecuencia para Plataforma de Trabajo:")
print(tabla_plataforma)

# --- PASO 3: TABLA PARA VARIABLE DISCRETA (Tickets_Soporte) ---

# Los primeros dos pasos son idénticos al anterior.
frec_abs_tickets <- table(datos_programadores$Tickets_Soporte)
frec_rel_tickets <- prop.table(frec_abs_tickets)

# La función cumsum() (cumulative sum) calcula la suma acumulada de un
# vector de números. Al aplicarla a mi tabla de frecuencia absoluta,
# obtengo la frecuencia acumulada.
frec_acum_tickets <- cumsum(frec_abs_tickets)

# Aplicando cumsum() a la frecuencia relativa, obtengo la frecuencia
# relativa acumulada.
frec_rel_acum_tickets <- cumsum(frec_rel_tickets)

# data.frame() es una función más robusta para crear tablas. Me permite
# definir explícitamente cada columna. Uso as.vector() para "limpiar"
# los objetos de table() antes de meterlos en el data.frame y evitar
# posibles problemas de formato.
tabla_tickets <- data.frame(
  Frec_Absoluta = as.vector(frec_abs_tickets),
  Frec_Relativa = round(as.vector(frec_rel_tickets), 3),
  Frec_Acumulada = as.vector(frec_acum_tickets),
  Frec_Rel_Acumulada = round(as.vector(frec_rel_acum_tickets), 3)
)

# Por defecto, las filas de un data.frame se nombran 1, 2, 3...
# Con rownames() puedo asignarles los nombres de las categorías (en este
# caso, la cantidad de tickets) para que la tabla sea más fácil de leer.
rownames(tabla_tickets) <- names(frec_abs_tickets)

print("Tabla de Frecuencia para Tickets de Soporte:")
print(tabla_tickets)







