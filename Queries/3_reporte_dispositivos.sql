/*
El Reporte de Dispositivos (Marketing)
"Hola. Queremos lanzar una campaña de notificaciones push 
personalizadas según el dispositivo que usa el cliente. 
Necesitamos saber: ¿Cuáles son los dispositivos (device) 
más utilizados por nuestros usuarios activos para ver contenido? 
Muéstrame el dispositivo y el conteo de reproducciones totales, 
ordenado de mayor a menor
*/

WITH dispositivos AS(
	SELECT 
		w.device,
		COUNT(w.device) AS usos
	FROM watch_history AS w
	INNER JOIN subscriptions AS s
		ON w.user_id = s.user_id
	WHERE subscription_status = 'Active'
	GROUP BY 
		w.device
)
SELECT *
FROM dispositivos
ORDER BY usos DESC;

/*
Buenas tardes. Aquí está la información pedida y sintetizada:

"Tablet"	    493
"Laptop"	    466
"Smart TV"	    447
"Smartphone"	437

Como se puede observar, los dispositivos más utilizados por 
nuestros usuarios activos para ver contenido son las Tablets, 
seguidas de las Laptops, Smart TVs y Smartphones. Esta 
información nos permitirá personalizar nuestras notificaciones 
push de manera más efectiva según el dispositivo preferido por 
nuestros usuarios.
*/