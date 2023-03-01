BEGIN;

DROP TABLE ship_interior_registry CASCADE;
DROP TABLE interior_element CASCADE;
DROP TABLE ship_passport CASCADE;
DROP TABLE ship CASCADE;
DROP TABLE ship_licence_registry CASCADE;
DROP TABLE ship_licence CASCADE;
DROP TABLE person CASCADE;
DROP TABLE location CASCADE;

DROP TYPE interior_element_type CASCADE;
DROP TYPE license_status CASCADE;
DROP TYPE person_character CASCADE;
DROP TYPE person_gender CASCADE;
DROP TYPE location_description CASCADE;

COMMIT;