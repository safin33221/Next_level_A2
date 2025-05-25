-- Active: 1748191021305@@127.0.0.1@5432@conservation_db@public
CREATE TABLE rangers (
    rangers_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

SELECT * FROM rangers;



CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status  VARCHAR(50) DEFAULT 'Unknown'
);

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    "location" VARCHAR(100) NOT NULL,
    note TEXT
);








