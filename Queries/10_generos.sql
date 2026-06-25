/*
Hola William. Necesitamos premiar a los directores de contenido. Por cada 
género de películas/series (genre), queremos conocer cuál es el título 
(title) exacto de la obra que acumula la mayor cantidad de minutos 
reproducidos en total. Muéstrame el género, el título y los minutos totales.
*/

WITH titulo_por_categoria AS(
	SELECT 
		m.genre AS genero,
		m.title AS titulo,
		SUM(minutes_played) AS minutos_reproducidos,
		DENSE_RANK() OVER(
			PARTITION BY
				m.genre
			ORDER BY
				SUM(minutes_played) DESC
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
FROM 
	titulo_por_categoria
WHERE
	ranking <= 1;


/*
Hola, área de producto. Revisando la información devuelta por la query, 
encontramos la siguiente información sobre los títulos que acumulan la 
mayor cantidad de minutos reproducidos por género:

"Action"	    "El Viento Feroz"	    2018
"Comedy"	    "La Guerra Inesperada"	1746
"Documentary"	"El Fuego Silencioso"	2196
"Drama"	        "La Crónica Prohibida"	2116
"Horror"	    "El Camino Sagrado"	    2327
"Romance"	    "El Legado Perdido"	    2038
"Sci-Fi"	    "La Crónica Mortal"	    2298
"Thriller"	    "El Camino Prohibido"	1967

*/