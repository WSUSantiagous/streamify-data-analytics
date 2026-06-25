/*
Hola. El equipo de auditoría legal detectó que debido a un bug 
antiguo en la app, algunas suscripciones quedaron registradas 
con fechas absurdas. Necesitamos identificar todos los registros 
en subscriptions donde la fecha de inicio (start_date) sea anterior 
a la fecha en que el usuario se registró en la plataforma 
(register_date). Muéstrame el user_id, register_date y start_date 
para exigirle una corrección a TI.
*/

WITH fecha_incorrecta AS(
	SELECT 
		u.user_id,
		u.register_date,
		s.subscription_date,
		CASE 
			WHEN u.register_date <= s.subscription_date THEN 'Correcto'
			ELSE 'Incorrecto'
		END AS corroboracion
	FROM users AS u
	INNER JOIN subscriptions AS s
		ON	u.user_id = s.user_id
)
SELECT *
FROM fecha_incorrecta;

/*
Hola. Revisando la información devuelta por la query, encontramos que 
no hay registros con fechas incorrectas.

Con confianza puedes ejecutar la query en producción para corroborar 
que no hay registros con fechas incorrectas. En caso de que se encuentren 
registros con fechas incorrectas, por favor notifícanos para que podamos 
tomar las medidas necesarias y corregir la información en la base de datos.
*/