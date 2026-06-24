/*
Buenas tardes. Estamos preocupados por los usuarios 
que se registraron pero que jamás han usado la plataforma. 
Necesitamos un listado de los user_id y register_date de 
todos los usuarios cuyo estado sea 'Active' pero que no 
tengan ningún registro de reproducción en su historial.
*/

WITH active_users_played AS (
	SELECT 
		u.user_id,
		u.register_date,
		u.status,
		COUNT(w.playing_id) AS total_plays
	FROM users as u
	LEFT JOIN watch_history AS w
		ON u.user_id = w.user_id
	WHERE 
		status = 'Active'
	GROUP BY
		u.user_id
)
SELECT
	user_id,
	register_date,
	status,
	total_plays
FROM active_users_played
WHERE total_plays < 1
ORDER BY user_id;

/*
Hola. Aquí está la información pedida y sintetizada:

id_user | name      |      register_date | status  | total_plays
259	    "Kyle Mccormick"	"2024-08-03"	"Active"	0
386	    "Paul Marks"	    "2025-05-25"	"Active"	0

Como se puede observar, estos son los usuarios que se registraron 
pero que jamás han usado la plataforma. Esta información nos permitirá 
identificar a los usuarios inactivos y tomar medidas para mejorar su 
experiencia y fomentar su participación en la plataforma.
*/