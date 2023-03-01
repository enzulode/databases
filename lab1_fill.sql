BEGIN;

-- location table
INSERT INTO location (description, x_coord, y_coord, z_coord)
VALUES ('Диаспара', 1.0, 2.0, 3.0);

INSERT INTO location (description, x_coord, y_coord, z_coord)
VALUES ('Космос', 1.0, 2.0, 3.0);

INSERT INTO location (description, x_coord, y_coord, z_coord)
VALUES ('Море', 1.0, 2.0, 3.0);

INSERT INTO location (description, x_coord, y_coord, z_coord)
VALUES ('Океан', 1.0, 2.0, 3.0);


-- person table
INSERT INTO person (name, age, gender, location_id, character)
VALUES ('Мастер', 42, 'М', 2, 'Сумасшедший');

INSERT INTO person (name, age, gender, location_id, character)
VALUES ('Олвин', 12, 'М', 1, 'Аскет');

INSERT INTO person (name, age, gender, location_id, character)
VALUES ('Иван', 12, 'М', 1, 'Аскет');

INSERT INTO person (name, age, gender, location_id, character)
VALUES ('Дима', 12, 'М', 1, 'Сумасшедший');


-- ship license
INSERT INTO ship_licence (owner_id, status)
VALUES (1, 'Активна');


-- license registry
INSERT INTO ship_licence_registry (owner_id, license_id)
VALUES (1, 1);


-- ship
INSERT INTO ship (name, creation_date)
VALUES ('Димандия', (TIMESTAMP '2021-01-24 12:43:23'));

-- ship passport
INSERT INTO ship_passport (owner_id, licence_id, ship_id)
VALUES (1, 1, 1);


-- interior element
INSERT INTO interior_element (name, type)
VALUES ('дверь', 'декор');

INSERT INTO interior_element (name, type)
VALUES ('тарелка', 'посуда');

INSERT INTO interior_element (name, type)
VALUES ('домино', 'настолки');

-- interior elements registry
INSERT INTO ship_interior_registry (ship_id, element_id)
VALUES (1, 1);

INSERT INTO ship_interior_registry (ship_id, element_id)
VALUES (1, 2);

INSERT INTO ship_interior_registry (ship_id, element_id)
VALUES (1, 3);

INSERT INTO ship_interior_registry (ship_id, element_id)
VALUES (1, 2);

INSERT INTO ship_interior_registry (ship_id, element_id)
VALUES (1, 2);

COMMIT;