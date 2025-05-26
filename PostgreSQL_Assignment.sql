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
SELECT * FROM species;

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    "location" VARCHAR(100) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    note TEXT
);


INSERT INTO rangers (name ,region)
VALUES 
('Diana Stone', 'Rainforest Edge'),
('Ethan Wells', 'Savannah Plains'),
('Fiona Brooks', 'Eastern Highlands'),
('George Hill', 'Lakeview Territory');

INSERT INTO species (common_name,scientific_name,discovery_date,conservation_status)
VALUES 
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Vulnerable'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Asian Elephant', 'Elephas maximus', '1758-01-01', 'Endangered'),
('Great Indian Bustard', 'Ardeotis nigriceps', '1863-01-01', 'Critically Endangered'),
('King Cobra', 'Ophiophagus hannah', '1836-01-01', 'Vulnerable'),
('Ganges River Dolphin', 'Platanista gangetica', '1801-01-01', 'Endangered'),
('Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Endangered'),
('Malabar Civet', 'Viverra civettina', '1862-01-01', 'Critically Endangered'),
('Indian Star Tortoise', 'Geochelone elegans', '1831-01-01', 'Vulnerable');


SELECT * FROM sightings;


INSERT INTO sightings (ranger_id,species_id,"location", sighting_time ,note)
VALUES
(1, 3, 'Rainforest Canopy Zone', '2024-05-20 06:15:00', 'Pair nesting in tree'),
(3, 4, 'Cobra Trail Bend', '2024-05-22 14:50:00', 'Sunbathing on rocks'),
(2, 3, 'Berry Patch Trail', '2024-05-24 11:05:00', 'Cub with mother'),
(1, 2, 'Golden Cliff', '2024-05-25 08:00:00', 'Group moving through trees'),
(4, 1, 'Delta Marsh', '2024-05-26 17:30:00', 'Tracks and scat found');

SELECT * FROM sightings;


-- Problem -1 :Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT into rangers (name,region)
VALUES ('Derek Fox', 'Coastal Plains')



-- problem-2:  Count unique species ever sighted.

SELECT count(*) as unique_species_count FROM(
    SELECT species_id
    FROM sightings
    GROUP BY species_id
)   ;


-- Problem-3:Find all sightings where the location includes "Pass".

SELECT * FROM sightings
    WHERE location ILIKE '%Pass%' ;

--problem-4:  List each ranger's name and their total number of sightings.
SELECT name  ,count(*) as total_sightings  FROM rangers as r
JOIN sightings as s
ON r.ranger_id = s.ranger_id
GROUP BY r.name


-- Problem 5 : List species that have never been sighted.

SELECT common_name FROM species as sp
left JOIN sightings as si ON sp.species_id = si.species_id 
WHERE si.sighting_id IS NULL;


-- Problem 6 : Show the most recent 2 sightings.

SELECT sp.common_name,sighting_time ,r.name FROM sightings as si
    JOIN species as sp ON si.species_id = sp.species_id
    JOIN rangers as r  ON si.ranger_id = r.ranger_id
    ORDER BY si.sighting_time DESC
    LIMIT 2;   


-- problem 7: Update all species discovered before year 1800 to have status 'Historic'.

SELECT * FROM species

UPDATE species
    SET conservation_status = 'Historic'
    WHERE discovery_date > '1800-01-01';
