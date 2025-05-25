-- Active: 1748191021305@@127.0.0.1@5432@conservation_db@public
CREATE TABLE rangers (
    rangers_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

SELECT * FROM rangers;







