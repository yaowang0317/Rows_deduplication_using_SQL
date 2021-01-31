
CREATE TABLE IF NOT EXISTS apps (
   pk integer PRIMARY KEY,
   id VARCHAR(256) NOT NULL,
   title VARCHAR(256) NOT NULL,
   rating NUMERIC(2,1),
   last_update_date TIMESTAMP
);

INSERT INTO 
    apps(pk,id,title,rating,last_update_date)
VALUES
    (1,'com.facebook.katana','Facebook',4.0,'2016-09-12'),
    (2,'com.whatsapp','WhatsApp',4.5,'2016-09-11'),
	(3,'com.whatsapp','WhatsApp',4.4,'2016-09-12'),
	(4,'com.nianticlabs.pokemongo','Pokémon GO',4.6,'2016-09-05'),
	(5,'com.nianticlabs.pokemongo','Pokémon GO',4.3,'2016-09-06'),
	(6,'com.nianticlabs.pokemongo','Pokémon GO',4.1,'2016-09-07')
RETURNING *;

SELECT pk,id,title,rating,last_update_date FROM
(SELECT MAX(last_update_date) max_date,MAX(title) max_title FROM apps 
GROUP BY title) AS a
LEFT JOIN apps on 
a.max_date=apps.last_update_date and a.max_title = apps.title;

