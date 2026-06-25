/*
Estimado, la CFO quiere evaluar si los usuarios que adquieren los 
planes más caros prefieren pagar con tarjetas o billeteras digitales. 
Haz una matriz simple donde agrupes por tipo de plan (subscription_type)
y método de pago (payment_method), y me muestres cuántas suscripciones 
activas hay para cada combinación. Ordena por el plan y luego por la 
cantidad de usuarios.
*/

SELECT 
	p.plan_name,
	p.monthly_price,
	s.payment_method,
	COUNT(*) AS total_pagos,
	DENSE_RANK() OVER(
		PARTITION BY 
			p.plan_name 
		ORDER BY 
			COUNT(*) DESC) 
	AS ranking
FROM plans AS p
INNER JOIN subscriptions AS s
	ON p.plan_id = s.plan_id 
WHERE p.plan_id > 1
GROUP BY 
	p.plan_name,
	p.monthly_price,
	s.payment_method
ORDER BY
	p.plan_name,
	COUNT(*) DESC;



/*
Hola. Aquí te envío la información solicitada. Encontramos que los usuarios 
que adquieren los planes más caros prefieren pagar con gift cards y PayPal,
en lugar de billeteras digitales o tarjetas de crédito o débito.

plan_name|monthly_price|payment_method|total_pagos|ranking

"Premium"	17.99	"Gift Card"	    51	1
"Premium"	17.99	"Paypal"	    45	2
"Premium"	17.99	"Debit Card"	42	3
"Premium"	17.99	"Credit Card"	40	4
"Standard"	11.99	"Paypal"	    44	1
"Standard"	11.99	"Credit Card"	43	2
"Standard"	11.99	"Gift Card"	    39	3
"Standard"	11.99	"Debit Card"	38	4
*/
