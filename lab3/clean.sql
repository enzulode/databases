BEGIN;

DROP TABLE person_passports_registry CASCADE;
DROP TABLE ship_passengers_registry CASCADE;
DROP TABLE ship_interior_registry CASCADE;
DROP TABLE interior_element CASCADE;
DROP TABLE ship_passport CASCADE;
DROP TABLE ship CASCADE;
DROP TABLE ship_licence_registry CASCADE;
DROP TABLE ship_licence CASCADE;
DROP TABLE person CASCADE;
DROP TABLE coloured_haircut CASCADE;
DROP TABLE location CASCADE;

DROP TYPE license_status CASCADE;
DROP TYPE person_gender CASCADE;

DROP FUNCTION count_ship_items;
DROP FUNCTION ship_interior_elements_trigger_function;

COMMIT;