BEGIN;

CREATE TYPE location_description AS ENUM (
    'Неизвестно',
    'Лес',
    'Диаспара',
    'Космос',
    'Море',
    'Океан'
);

CREATE TYPE person_gender AS ENUM ('М', 'Ж');

CREATE TYPE person_character AS ENUM (
    'Нет информации',
    'Сумасшедший',
    'Аскет',
    'Отшельник'
);

CREATE TYPE license_status AS ENUM (
    'Активна',
    'Неактивна'
);

CREATE TYPE interior_element_type AS ENUM (
    'мебель',
    'посуда',
    'настолки',
    'декор'
);

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    description location_description NOT NULL DEFAULT 'Неизвестно'::location_description,
    x_coord FLOAT NOT NULL,
    y_coord FLOAT NOT NULL,
    z_coord FLOAT NOT NULL
);

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    age INT NOT NULL,
    gender person_gender NOT NULL,
    location_id INT NOT NULL REFERENCES location(id),
    character person_character NOT NULL DEFAULT 'Нет информации'::person_character
);

CREATE TABLE ship_licence (
    id SERIAL PRIMARY KEY,
    owner_id INT NOT NULL REFERENCES person(id),
    status license_status NOT NULL DEFAULT 'Неактивна'::license_status
);

CREATE TABLE ship_licence_registry (
    owner_id INT NOT NULL REFERENCES person(id),
    license_id INT NOT NULL REFERENCES ship_licence(id)
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
    name VARCHAR(128) NOT NULL,
    type interior_element_type NOT NULL
);

CREATE TABLE ship_interior_registry (
    ship_id INT NOT NULL REFERENCES ship(id),
    element_id INT NOT NULL REFERENCES interior_element(id)
);

CREATE TABLE ship_passengers_registry (
    ship_id INT REFERENCES ship(id),
    person_id INT REFERENCES person(id)
);

COMMIT;