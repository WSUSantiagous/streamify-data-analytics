/*
Asunto: Urgente: Insights de contenido para renovación de licencias 🎬

Hola. Estamos revisando qué contratos de distribución vamos a renovar el 
próximo mes y necesito que me ayudes a entender el comportamiento de 
consumo en la plataforma con tres datos clave:

1. El Top 5 de contenidos más exitosos: Necesito los títulos de los 5 
contenidos que acumulen la mayor cantidad de minutos totales reproducidos 
en la historia de la plataforma, y cuántas horas (u horas equivalentes) representa eso.
2. Rendimiento por Género: ¿Cuál es el promedio de minutos reproducidos por 
cada género (genre)? Queremos ver qué categorías retienen más a la audiencia 
cuando le dan play.
3. Películas vs. Series: En términos de reproducciones totales (conteo de veces 
que se les dio play), ¿qué formato prefiere nuestro público? ¿Las películas 
(Movie) o las series (Series)?

Quedo atento a tus queries y al reporte de datos para presentarlo al comité 
creativo esta tarde. ¡Mil gracias!
*/

-- Top 5 títulos más reproducidos
WITH most_played_titles AS(
	SELECT 
		w.media_id AS media_id,
		m.title AS title,
		SUM(minutes_played) AS minutes_played
	FROM watch_history as w
	INNER JOIN media as m
		ON w.media_id = m.media_id
	GROUP BY 
		w.media_id,
		m.title
),
ranking_titles AS(
	SELECT 
		media_id,
		title,
		minutes_played,
		ROUND((minutes_played / 60.0), 2) AS equivalent_hours,
		DENSE_RANK() OVER(ORDER BY minutes_played DESC) AS ranking
	FROM
		most_played_titles
)
SELECT *
FROM ranking_titles
WHERE ranking <= 5
ORDER BY minutes_played DESC;

-- Promedio de minutos reproducidos por género
WITH most_played_categories AS(
	SELECT 
		m.genre,
		ROUND(AVG(w.minutes_played), 2) AS minutes_played,
		DENSE_RANK() OVER(ORDER BY AVG(w.minutes_played) DESC) AS ranking
	FROM watch_history as w
	INNER JOIN media as m
		ON w.media_id = m.media_id
	GROUP BY
		m.genre
)
SELECT *
FROM most_played_categories
ORDER BY minutes_played DESC;

-- Preferencia de formato por reproducciones totales
WITH preferred_device AS(
	SELECT 
		m.media_type,
		COUNT(m.media_type) as total_clicks
	FROM watch_history as w
	INNER JOIN media as m
		ON w.media_id = m.media_id
	GROUP BY 
		m.media_type
)
SELECT *
FROM preferred_device
ORDER BY total_clicks DESC;


/*
Buenas. Aquí está la información pedida y sintetizada:

1. Ranking de los 5 títulos más reproducidos por minutos y su equivalente en horas:

43 "El Camino Sagrado"    | 2327 min | 38.78 h
11 "La Crónica Mortal"	  | 2298 min | 38.30 h
92 "El Fuego Silencioso"  | 2196 min | 36.60 h
44 "La Crónica Prohibida" | 2116 min | 35.27 h
88 "El Destino Último"    | 2057 min | 34.28 h

2. Promedio de minutos reproducidos por género:
"Sci-Fi"	    |  57.66 min
"Horror"	    |  49.41 min
"Drama"	        |  48.10 min
"Romance"	    |  46.79 min
"Action"	    |  46.51 min
"Documentary"	|  46.20 min
"Thriller"	    |  43.71 min
"Comedy"	    |  41.89 min

3. Preferencia de formato por reproducciones totales:
"Movie"  |1278
"Series" |1222

Quedo atento a cualquier ajuste o detalle adicional que necesites 
para la presentación al comité creativo. ¡Éxitos en la reunión!
*/