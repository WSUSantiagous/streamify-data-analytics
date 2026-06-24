--1. Crear la tabla para los usuarios
CREATE TABLE users(
	user_id SERIAL PRIMARY KEY,
	user_name VARCHAR(100),
	email VARCHAR(100) NOT NULL UNIQUE,
	date_of_birth DATE,
	country VARCHAR(100),
	city VARCHAR(100),
	register_date DATE,
	status VARCHAR(100)
);

--2. Crear la tabla para los usuarios
CREATE TABLE plans(
	plan_id SERIAL PRIMARY KEY, 
	plan_name VARCHAR(100),
	monthly_price NUMERIC(10, 2),
	device_limit INT,
	video_quality VARCHAR(100)
);

--3. Crear la tabla para el contenido
CREATE TABLE media(
	media_id SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	media_type VARCHAR(100),
	genre VARCHAR(100), 
	age_rating VARCHAR(10),
	duration_minutes INT,
	release_date DATE
);


--4. Crear una tabla para el historia de reproducción
CREATE TABLE watch_history(
	playing_id SERIAL PRIMARY KEY,
	user_id INT REFERENCES users(user_id),
	media_id INT REFERENCES media(media_id),
	date_played TIMESTAMP, 
	minutes_played INT,
	device VARCHAR(32)
);

--5. Crear una tabla para los pagos de las suscripciones de los clientes
CREATE TABLE subscriptions(
	subscription_id SERIAL PRIMARY KEY,
	user_id INT REFERENCES users(user_id),
	plan_id INT REFERENCES plans(plan_id),
	subscription_date DATE,
	amount NUMERIC(10, 2),
	payment_method VARCHAR(100),
	subscription_status VARCHAR(32)
);
