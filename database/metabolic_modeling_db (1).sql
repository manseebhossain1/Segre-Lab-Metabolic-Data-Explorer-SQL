-- Team5 table creation statements -- 

-- Select Team5 as our database
use Team5;

-- Drop tables in reverse order of dependencies (children first, then parents)
-- This ensures no foreign key constraint violations during drops

DROP TABLE IF EXISTS model;
DROP TABLE IF EXISTS experimental_conditions;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS carbon_source;
DROP TABLE IF EXISTS media;

-- Create the media table
CREATE TABLE media (
    media_id INT PRIMARY KEY,
    minimal_media TEXT
) ENGINE=InnoDB;

-- Create the carbon_source table
CREATE TABLE carbon_source (
    carbon_id INT PRIMARY KEY,
    bigg_id INT,
    c_source TEXT,
    met_id VARCHAR(255)
) ENGINE=InnoDB;

-- Create index on c_source
CREATE INDEX idx_carbon_source_c_source ON carbon_source (c_source);

-- Create the species table
CREATE TABLE species (
    species_id INT PRIMARY KEY,
    species_name TEXT
) ENGINE=InnoDB;

-- Create the experimental_conditions table
CREATE TABLE experimental_conditions (
    experiment_id INT PRIMARY KEY,
    scientist VARCHAR(255),
    growth_method ENUM('Culture', 'Plate'),
    temperature INT,
    date DATE,
    growth ENUM('Yes', 'No', 'Unsure')
) ENGINE=InnoDB;

-- Create the model table
CREATE TABLE model (
    model_id INT PRIMARY KEY,
    carbon_id INT,
    species_id INT,
    media_id INT,
    experiment_id INT,
    gapfill_method ENUM('CarveMe', 'ModelSEED', 'KBase'),
    annotation_method ENUM('CarveMe', 'ModelSEED', 'KBase'),
    metabolite_ID INT,
    platform ENUM('CarveMe', 'ModelSEED', 'KBase'),
    biomass_composition ENUM('gram_pos', 'gram_neg', 'other'),
    date_created DATE,
    control_type ENUM('pos', 'neg'),
    notes VARCHAR(255),
    parent_model_id INT,
    model_file TEXT,
    FOREIGN KEY (carbon_id) REFERENCES carbon_source(carbon_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id),
    FOREIGN KEY (media_id) REFERENCES media(media_id),
    FOREIGN KEY (experiment_id) REFERENCES experimental_conditions(experiment_id)
) ENGINE=InnoDB;

-- Create index on species_id in model table
CREATE INDEX idx_model_species_id ON model (species_id);