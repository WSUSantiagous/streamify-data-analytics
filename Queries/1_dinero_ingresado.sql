/*
Hola. Mañana tengo junta con los inversionistas y necesito armar una 
diapositiva financiera de Streamify. Por favor, genérame un reporte 
que responda exactamente a esto:

1. ¿Cuánto dinero real está ingresando hoy a la plataforma por los 
usuarios que están activos?
2. ¿Cuánto dinero estamos dejando de ganar (dinero perdido) por 
culpa de los usuarios que ya cancelaron?
3. ¿Cuál es el método de pago que más dinero le está dejando a la 
empresa considerando solo a los usuarios activos?

Pásame los resultados finales en una tablita limpia cuando lo 
tengas listo. ¡Gracias!
*/

-- Dinero ingresado por usuarios activos y dinero perdido por usuarios inactivos
SELECT 
	subscription_status,
	SUM(amount) AS total
FROM subscriptions
GROUP BY subscription_status;

-- Método de pago con más dinero para usuarios activos
SELECT
	payment_method,
	SUM(amount) AS total
FROM subscriptions
WHERE subscription_status = 'Active'
GROUP BY payment_method
ORDER BY total DESC;

/*
Buenas tardes. Aquí está el reporte pedido por cada item:

1. El dinero real a día de hoy que está ingresando mensualmente es 
un total de 4634.25 USD
2. El dinero que se está perdiendo por los usuarios inactivos es 
un total de 1480.75 USD
3. El método de pago que más dinero le está dejando a la empresa 
son las Gift Cards con un total de 1264.99 USD para usuarios activos

Dinero usuarios activos | Dinero usuarios inactivos | Método de pago con más dinero
    4634.25 USD         |          1480.75 USD      |       Gift Card: 1264.99 USD 

Quedo atento a cualquier inquietud o ajuste que necesites para la presentación. 
¡Éxitos en la junta con los inversionistas!
*/

