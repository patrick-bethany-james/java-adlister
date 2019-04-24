USE pets_db;

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS charPivot;
DROP TABLE IF EXISTS characteristics;

CREATE TABLE users (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
   name VARCHAR(240) NOT NULL UNIQUE,
   email VARCHAR(240) NOT NULL,
   password VARCHAR(255) NOT NULL,
   PRIMARY KEY (id)
);

CREATE TABLE ads (
     ad_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
     user_id INT UNSIGNED NOT NULL,
     title VARCHAR(250) NOT NULL,
     description VARCHAR(250) NOT NULL,
     createDate DATE NOT NULL,
     soldDate DATE,
     zipCode int,
     dob DATE,
     gender VARCHAR(1) NOT NULL,
     pictureURL VARCHAR(250),
     PRIMARY KEY (ad_id),
     FOREIGN KEY (user_id) REFERENCES users(id)
         ON DELETE CASCADE
);

CREATE TABLE characteristics (
     char_id INT UNSIGNED NOT NULL,
     characteristic VARCHAR(240) NOT NULL,
     PRIMARY KEY (char_id)
);

CREATE TABLE charPivot (
   ad_id INT UNSIGNED NOT NULL,
   char_id INT UNSIGNED NOT NULL,
   PRIMARY KEY (ad_id),
   FOREIGN KEY (char_id) REFERENCES characteristics(char_id)
);