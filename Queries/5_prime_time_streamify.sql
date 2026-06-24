/*
Hola, el servidor está experimentando picos de tráfico. 
Necesitamos analizar a qué hora del día la gente le da más 
'play' a los videos. Extrae la hora del día (de 0 a 23) de 
la columna playback_date y dinos cuántas reproducciones 
totales se han iniciado en cada hora. Ordena el resultado 
desde la hora más congestionada hasta la más pacífica.
*/

WITH horas_de_reproduccion AS(
	SELECT
		EXTRACT(HOUR FROM date_played) AS hora_de_reproduccion,
		COUNT(date_played) AS cuenta_de_reproducciones_por_hora,
		SUM(COUNT(date_played)) OVER() AS total_reproducciones
	FROM watch_history
	GROUP BY EXTRACT(HOUR FROM date_played)
)
SELECT
	hora_de_reproduccion,
	cuenta_de_reproducciones_por_hora,
	DENSE_RANK() OVER(ORDER BY(cuenta_de_reproducciones_por_hora) DESC) AS ranking,
	total_reproducciones
FROM 
	horas_de_reproduccion
ORDER BY cuenta_de_reproducciones_por_hora DESC;


/*

Hola. Aquí está la información pedida y sintetizada:
Hora | Reproducciones Totales por hora | Ranking | Reproducciones Totales
1	    136	    1	2500
3	    121	    2	2500
14	    120	    3	2500
4	    115	    4	2500
5	    111	    5	2500
23	    110	    6	2500
10	    109	    7	2500
8	    108	    8	2500
22	    104	    9	2500
11	    103	    10	2500
17	    103	    10	2500
13	    103	    10	2500
21	    103	    10	2500
0	    102	    11	2500
18	    102	    11	2500
9	    99	    12	2500
6	    99	    12	2500
12	    99	    12	2500
20	    97	    13	2500
15	    95	    14	2500
7	    94	    15	2500
2	    92	    16	2500
16	    90	    17	2500
19	    85	    18	2500

*/