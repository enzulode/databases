BEGIN;

-- location table
INSERT INTO location (description, x_coord, y_coord, z_coord)
VALUES ('Диаспара', 1.0, 2.0, 3.0),
       ('Космос', 1.0, 2.0, 3.0),
       ('Море', 1.0, 2.0, 3.0),
       ('Океан', 1.0, 2.0, 3.0);

-- haircut
INSERT INTO coloured_haircut (color, date_from, name)
VALUES ('розовый', (TIMESTAMP '2023-01-21 12:34:12'), 'андрекат'),
       ('блонд', (TIMESTAMP '2023-02-21 12:34:12'), 'горшок');

-- person table
INSERT INTO person (name, age, gender, location_id, character, haircut_id)
VALUES ('Мастер', 42, 'М', 2, 'Сумасшедший', 1),
       ('Олвин', 12, 'М', 1, 'Аскет', 2),
       ('Иван', 12, 'М', 1, 'Аскет', 1),
       ('Дима', 12, 'М', 1, 'Сумасшедший', 1);


-- ship license
INSERT INTO ship_licence (owner_id)
VALUES (1);


-- license registry
INSERT INTO ship_licence_registry (owner_id, license_id, status)
VALUES (1, 1, 'Активна');


-- ship
INSERT INTO ship (name, creation_date)
VALUES ('Димандия', (TIMESTAMP '2021-01-24 12:43:23'));

-- ship passport
INSERT INTO ship_passport (owner_id, licence_id, ship_id)
VALUES (1, 1, 1);


-- interior element
INSERT INTO interior_element (type)
VALUES ('декор'),
       ('посуда'),
       ('настолки');

-- interior elements registry
INSERT INTO ship_interior_registry (ship_id, element_id, name)
VALUES (1, 1, 'дверь'),
       (1, 2, 'тарелка'),
       (1, 3, 'домино'),
       (1, 2, 'дверь'),
       (1, 2, 'дверь');

-- ship passengers registry
INSERT INTO ship_passengers_registry (ship_id, person_id)
VALUES (1, 1),
       (1, 2),
       (1, 4);


-- person passports registry
INSERT INTO person_passports_registry (person_id, passport_id)
VALUES (1, 1);

COMMIT;