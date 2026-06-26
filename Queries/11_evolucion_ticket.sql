/*
Estimado. Finanzas quiere evaluar la maduración de la empresa. 
Necesitamos un reporte que nos muestre por cada año de registro 
de los usuarios (extraído de register_date), dos métricas: 1) 
El total de usuarios registrados en ese año y 2) El precio 
promedio del plan que eligieron al iniciar. Queremos ver si con 
los años captamos clientes de mayor valor.
*/

SELECT 
	EXTRACT(YEAR FROM u.register_date) AS anio,
	p.plan_name,
	COUNT(u.user_id) AS registros_por_anio,
	CONCAT('$', ROUND(AVG(p.monthly_price), 2)) AS precio_promedio_precio
FROM users AS u
INNER JOIN subscriptions AS s
	ON 	u.user_id = s.user_id
INNER JOIN plans AS p
	ON p.plan_id = s.plan_id
GROUP BY 
	EXTRACT(YEAR FROM u.register_date),
	p.plan_name
ORDER BY EXTRACT(YEAR FROM u.register_date);


/*
Aqui está la información solicitada. 

2024	"Basic"	43	"$5.99"
2024	"Premium"	46	"$17.99"
2024	"Standard"	40	"$11.99"
2025	"Basic"	81	"$5.99"
2025	"Premium"	89	"$17.99"
2025	"Standard"	91	"$11.99"
2026	"Basic"	34	"$5.99"
2026	"Premium"	43	"$17.99"
2026	"Standard"	33	"$11.99"

*/