BEGIN;

CREATE TYPE person_gender AS ENUM ('М', 'Ж');

CREATE TYPE license_status AS ENUM (
    'Активна',
    'Неактивна'
);

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    description VARCHAR(64) NOT NULL DEFAULT 'Неизвестно',
    x_coord FLOAT NOT NULL,
    y_coord FLOAT NOT NULL,
    z_coord FLOAT NOT NULL
);

CREATE TABLE coloured_haircut(
    id SERIAL PRIMARY KEY,
    color VARCHAR(32) NOT NULL,
    date_from TIMESTAMP NOT NULL,
    name VARCHAR(32) NOT NULL
);

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    age INT NOT NULL,
    gender person_gender NOT NULL,
    location_id INT NOT NULL REFERENCES location(id),
    character VARCHAR(32) NOT NULL DEFAULT 'Нет информации',
    haircut_id INT REFERENCES person(id)
);

CREATE TABLE ship_licence (
    id SERIAL PRIMARY KEY,
    owner_id INT NOT NULL REFERENCES person(id)
);

CREATE TABLE ship_licence_registry (
    owner_id INT NOT NULL REFERENCES person(id),
    license_id INT NOT NULL REFERENCES ship_licence(id),
    status license_status NOT NULL DEFAULT 'Неактивна'::license_status
);

CREATE TABLE ship (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    creation_date TIMESTAMP NOT NULL
);


CREATE TABLE ship_passport (
    id SERIAL PRIMARY KEY,
    owner_id INT NOT NULL REFERENCES person(id),
    licence_id INT NOT NULL REFERENCES ship_licence(id),
    ship_id INT NOT NULL REFERENCES ship(id)
);

CREATE TABLE interior_element (
    id SERIAL PRIMARY KEY,
    type VARCHAR(32) NOT NULL
);

CREATE TABLE ship_interior_registry (
    ship_id INT NOT NULL REFERENCES ship(id),
    element_id INT NOT NULL REFERENCES interior_element(id),
    name VARCHAR(32) NOT NULL
);

CREATE TABLE ship_passengers_registry (
    ship_id INT REFERENCES ship(id),
    person_id INT REFERENCES person(id)
);

CREATE TABLE person_passports_registry (
    person_id INT REFERENCES person(id),
    passport_id INT REFERENCES ship_passport(id)
);

COMMIT;