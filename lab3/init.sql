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
    licence_id INT NOT NULL UNIQUE REFERENCES ship_licence(id),
    ship_id INT NOT NULL UNIQUE REFERENCES ship(id)
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

ALTER TABLE ship ADD COLUMN interior_items_amount INT DEFAULT 0;

CREATE OR REPLACE FUNCTION count_ship_items(s_id INT) RETURNS INT AS $$
    DECLARE
        result_value INT;
    BEGIN

        SELECT COUNT(*)
        FROM ship_interior_registry
        WHERE ship_id = s_id
        INTO result_value;

        RETURN result_value;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ship_interior_elements_trigger_function() RETURNS TRIGGER AS $$
    DECLARE
        current_items_amount INT;
        old_items_amount INT;
        affected_ship INT;
        old_affected_ship INT;

    BEGIN

        IF (tg_op = 'INSERT') THEN

            affected_ship = new.ship_id;

            SELECT count_ship_items(affected_ship)
            INTO current_items_amount;

            UPDATE ship
            SET interior_items_amount = current_items_amount
            WHERE id = affected_ship;

            RETURN new;

        ELSEIF (tg_op = 'UPDATE') THEN

            affected_ship = new.ship_id;
            old_affected_ship = old.ship_id;

            SELECT count_ship_items(affected_ship)
            INTO current_items_amount;

            SELECT count_ship_items(old_affected_ship)
            INTO old_items_amount;

            UPDATE ship
            SET interior_items_amount = current_items_amount
            WHERE id = affected_ship;

            UPDATE ship
            SET interior_items_amount = old_items_amount
            WHERE id = old_affected_ship;

            RETURN new;

        ELSE
            affected_ship = old.ship_id;

            SELECT count_ship_items(affected_ship)
            INTO current_items_amount;

            UPDATE ship
            SET interior_items_amount = current_items_amount
            WHERE id = affected_ship;

            RETURN new;
        END IF;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER ship_items_trigger
AFTER INSERT OR UPDATE OR DELETE ON ship_interior_registry
FOR EACH ROW
EXECUTE FUNCTION ship_interior_elements_trigger_function();



COMMIT;