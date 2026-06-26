# Streamify - Data Analytics Project

## Descripción del proyecto

Streamify es un proyecto de análisis de datos basado en una plataforma ficticia tipo Netflix.

El proyecto consiste en la creación de una base de datos en PostgreSQL con datos simulados sobre usuarios, planes, suscripciones, historial de reproducción y contenido multimedia. A partir de esta base de datos, se desarrollaron consultas SQL para responder preguntas de negocio relacionadas con ingresos, comportamiento de usuarios, consumo de contenido, métodos de pago y dispositivos utilizados.

Este proyecto combina Python, SQL, PostgreSQL, Jupyter Notebook, Git y GitHub.

---

## Objetivo del proyecto

El objetivo principal fue simular un escenario real de análisis de datos para una plataforma de streaming.

A través del proyecto se buscó responder preguntas como:

* ¿Cuánto dinero está generando la plataforma?
* ¿Cuánto dinero se pierde por usuarios cancelados?
* ¿Qué contenido tiene mayor consumo?
* ¿Qué géneros retienen más a los usuarios?
* ¿Qué dispositivos usan más los usuarios activos?
* ¿Qué usuarios están activos pero no han reproducido contenido?
* ¿Qué método de pago genera más ingresos?
* ¿Qué usuarios podrían considerarse VIP?

---

## Herramientas utilizadas

* SQL
* PostgreSQL
* Python
* Pandas
* Faker
* Random
* SQLAlchemy
* Jupyter Notebook
* Git
* GitHub

---

## Base de datos

La base de datos fue creada en PostgreSQL y está compuesta por 5 tablas principales:

| Tabla           | Descripción                                                        |
| --------------- | ------------------------------------------------------------------ |
| `plans`         | Contiene la información de los planes disponibles en la plataforma |
| `users`         | Contiene la información de los usuarios registrados                |
| `subscriptions` | Contiene la información de las suscripciones de los usuarios       |
| `watch_history` | Contiene el historial de reproducción de contenido                 |
| `media`         | Contiene el catálogo de películas y series disponibles             |

---

## Estructura del proyecto

```txt
Streamify/
├── Queries/
│   ├── 1_dinero_ingresado.sql
│   ├── 2_enganche_contenido.sql
│   ├── 3_reporte_dispositivos.sql
│   ├── 4_alerta_de_inactividad.sql
│   ├── 5_prime_time_streamify.sql
│   ├── 6_limpieza_contratos.sql
│   ├── 7_adictos_a_las_series.sql
│   ├── 8_series_largas.sql
│   ├── 9_metodos_de_pago.sql
│   ├── 10_generos.sql
│   ├── 11_evolucion_ticket.sql
│   └── 12_usuarios_VIP.sql
├── portfolio_streamify.ipynb
├── schema.sql
└── README.md
```

---

## Proceso realizado

### 1. Creación de la base de datos

Se diseñó una base de datos relacional en PostgreSQL para representar el funcionamiento básico de una plataforma de streaming.

El archivo `schema.sql` contiene la estructura de la base de datos, incluyendo la creación de las tablas principales.

---

### 2. Generación de datos con Python

Se utilizó Python para generar datos ficticios que simulan el comportamiento de una plataforma de streaming.

Las librerías utilizadas fueron:

* `pandas`: para organizar y manipular los datos.
* `faker`: para generar datos ficticios como nombres, correos y fechas.
* `random`: para crear valores aleatorios.
* `sqlalchemy`: para conectar Python con PostgreSQL.

Los datos generados en Python fueron enviados a PostgreSQL para posteriormente analizarlos mediante consultas SQL.

---

### 3. Análisis con SQL

Se desarrollaron consultas SQL para responder preguntas de negocio. Durante el análisis se utilizaron diferentes conceptos como:

* Consultas básicas
* Filtros
* Agregaciones
* Joins
* Subconsultas
* Common Table Expressions, CTEs
* Funciones de ventana
* Limpieza y transformación de datos

---

## Consultas desarrolladas

| Archivo                       | Análisis realizado                                                                    |
| ----------------------------- | ------------------------------------------------------------------------------------- |
| `1_dinero_ingresado.sql`      | Análisis financiero de ingresos activos, dinero perdido y método de pago más rentable |
| `2_enganche_contenido.sql`    | Análisis del contenido con mayor cantidad de minutos reproducidos                     |
| `3_reporte_dispositivos.sql`  | Reporte de dispositivos más usados por usuarios activos                               |
| `4_alerta_de_inactividad.sql` | Identificación de usuarios activos sin reproducciones                                 |
| `5_prime_time_streamify.sql`  | Análisis de horarios de mayor consumo                                                 |
| `6_limpieza_contratos.sql`    | Revisión y limpieza de datos relacionados con contratos o suscripciones               |
| `7_adictos_a_las_series.sql`  | Identificación de usuarios con alto consumo de contenido                              |
| `8_series_largas.sql`         | Análisis de series o contenidos de larga duración                                     |
| `9_metodos_de_pago.sql`       | Análisis de métodos de pago utilizados                                                |
| `10_generos.sql`              | Análisis de géneros más consumidos                                                    |
| `11_evolucion_ticket.sql`     | Evolución del ticket promedio                                                         |
| `12_usuarios_VIP.sql`         | Identificación de usuarios VIP                                                        |

---

## Principales hallazgos

### 1. Análisis financiero

| Métrica                                                    |    Resultado |
| ---------------------------------------------------------- | -----------: |
| Dinero mensual generado por usuarios activos               | 4,634.25 USD |
| Dinero perdido por usuarios cancelados                     | 1,480.75 USD |
| Método de pago que más ingresos genera en usuarios activos |    Gift Card |
| Ingresos por Gift Card en usuarios activos                 | 1,264.99 USD |

Streamify genera actualmente 4,634.25 USD mensuales desde usuarios activos. Sin embargo, existe una pérdida potencial de 1,480.75 USD asociada a usuarios que cancelaron su suscripción.

Además, el método de pago que más ingresos genera entre usuarios activos es Gift Card, con 1,264.99 USD.

---

### 2. Contenido más reproducido

| Ranking | Título               | Minutos reproducidos | Horas equivalentes |
| ------: | -------------------- | -------------------: | -----------------: |
|       1 | El Camino Sagrado    |                2,327 |            38.78 h |
|       2 | La Crónica Mortal    |                2,298 |            38.30 h |
|       3 | El Fuego Silencioso  |                2,196 |            36.60 h |
|       4 | La Crónica Prohibida |                2,116 |            35.27 h |
|       5 | El Destino Último    |                2,057 |            34.28 h |

Los títulos con mayor reproducción acumulan entre 34 y 39 horas equivalentes de visualización. Esta información puede ayudar en decisiones de renovación de licencias, promoción de contenido y recomendaciones dentro de la plataforma.

---

### 3. Promedio de minutos reproducidos por género

| Género      | Promedio de minutos reproducidos |
| ----------- | -------------------------------: |
| Sci-Fi      |                        57.66 min |
| Horror      |                        49.41 min |
| Drama       |                        48.10 min |
| Romance     |                        46.79 min |
| Action      |                        46.51 min |
| Documentary |                        46.20 min |
| Thriller    |                        43.71 min |
| Comedy      |                        41.89 min |

El género con mayor promedio de minutos reproducidos es Sci-Fi, con 57.66 minutos por reproducción. Esto sugiere que este género tiene una alta capacidad de retención dentro de la plataforma.

---

### 4. Preferencia de formato

| Formato | Total de reproducciones |
| ------- | ----------------------: |
| Movie   |                   1,278 |
| Series  |                   1,222 |

Las películas tienen una ligera ventaja frente a las series en número total de reproducciones. Sin embargo, la diferencia es pequeña, por lo que ambos formatos mantienen un nivel de consumo similar.

---

### 5. Dispositivos más usados por usuarios activos

| Dispositivo | Reproducciones |
| ----------- | -------------: |
| Tablet      |            493 |
| Laptop      |            466 |
| Smart TV    |            447 |
| Smartphone  |            437 |

El dispositivo más usado por los usuarios activos es Tablet, seguido por Laptop, Smart TV y Smartphone. Esta información puede utilizarse para campañas de notificaciones push, optimización de interfaz y segmentación por dispositivo.

---

### 6. Usuarios activos sin reproducciones

| User ID | Nombre         | Fecha de registro | Estado | Total reproducciones |
| ------: | -------------- | ----------------- | ------ | -------------------: |
|     259 | Kyle Mccormick | 2024-08-03        | Active |                    0 |
|     386 | Paul Marks     | 2025-05-25        | Active |                    0 |

Se encontraron usuarios activos que se registraron pero nunca han reproducido contenido. Estos usuarios podrían ser parte de campañas de onboarding, correos de activación o recomendaciones iniciales.

---

### 7. Comportamiento maratónico

| Métrica                                                   | Resultado |
| --------------------------------------------------------- | --------: |
| Reproducciones donde se vio al menos el 90% del contenido |       570 |

Se encontraron 570 reproducciones donde los usuarios vieron al menos el 90% de la duración total del contenido. Este comportamiento puede ayudar a evaluar funciones como “¿Sigues ahí?” y a identificar contenido con alta retención.

---

### 8. Título más reproducido por género

| Género      | Título más reproducido | Minutos reproducidos |
| ----------- | ---------------------- | -------------------: |
| Action      | El Viento Feroz        |                2,018 |
| Comedy      | La Guerra Inesperada   |                1,746 |
| Documentary | El Fuego Silencioso    |                2,196 |
| Drama       | La Crónica Prohibida   |                2,116 |
| Horror      | El Camino Sagrado      |                2,327 |
| Romance     | El Legado Perdido      |                2,038 |
| Sci-Fi      | La Crónica Mortal      |                2,298 |
| Thriller    | El Camino Prohibido    |                1,967 |

Cada género tiene un título líder en minutos reproducidos. Esta información puede ayudar a priorizar renovaciones de licencias y destacar contenido relevante en la plataforma.

---

## Ejemplo de consulta SQL

La siguiente consulta identifica el título con mayor cantidad de minutos reproducidos dentro de cada género:

```sql
WITH titulo_por_categoria AS (
    SELECT 
        m.genre AS genero,
        m.title AS titulo,
        SUM(minutes_played) AS minutos_reproducidos,
        DENSE_RANK() OVER (
            PARTITION BY m.genre
            ORDER BY SUM(minutes_played) DESC
        ) AS ranking
    FROM watch_history AS w
    INNER JOIN media AS m
        ON w.media_id = m.media_id
    GROUP BY 
        m.genre, 
        m.title
)
SELECT
    genero,
    titulo,
    minutos_reproducidos
FROM titulo_por_categoria
WHERE ranking <= 1;
```

Esta consulta usa `DENSE_RANK()` para ordenar los títulos dentro de cada género según sus minutos totales reproducidos.

---

## Cómo ejecutar el proyecto

### 1. Clonar el repositorio

```bash
git clone https://github.com/WSUSantiagous/streamify-data-analytics.git
```

### 2. Entrar a la carpeta del proyecto

```bash
cd streamify-data-analytics
```

### 3. Instalar dependencias

```bash
pip install pandas faker sqlalchemy psycopg2-binary jupyter
```

### 4. Crear la base de datos en PostgreSQL

Ejecutar el archivo:

```txt
schema.sql
```

Este archivo contiene la estructura de las tablas necesarias para el proyecto.

### 5. Ejecutar el notebook

Abrir y ejecutar el archivo:

```txt
portfolio_streamify.ipynb
```

Este notebook genera los datos ficticios, se conecta con PostgreSQL y carga la información en la base de datos.

### 6. Ejecutar las consultas SQL

Las consultas se encuentran en la carpeta:

```txt
Queries/
```

Cada archivo contiene una consulta enfocada en responder una pregunta específica del negocio.

---

## Habilidades demostradas

Este proyecto demuestra habilidades en:

* Diseño de bases de datos relacionales
* Generación de datos sintéticos con Python
* Conexión entre Python y PostgreSQL
* Manipulación de datos con Pandas
* Análisis de datos con SQL
* Uso de consultas avanzadas
* Creación de reportes con enfoque de negocio
* Organización de proyectos con Git y GitHub
* Documentación técnica de proyectos

---

## Autor

**William Santiago Uribe Saldarriaga**

Proyecto desarrollado como parte de mi proceso de formación en análisis de datos.

---

## Repositorio

[Ver proyecto en GitHub](https://github.com/WSUSantiagous/streamify-data-analytics)
