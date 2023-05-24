-- TASK 2 --
SELECT peop."ФАМИЛИЯ", ved."ЧЛВК_ИД", ses."УЧГОД" FROM "Н_ЛЮДИ" peop
RIGHT JOIN "Н_ВЕДОМОСТИ" ved
    ON ved."ЧЛВК_ИД" = peop."ИД"
RIGHT JOIN "Н_СЕССИЯ" ses
    ON ses."ЧЛВК_ИД" = peop."ИД"
WHERE peop."ФАМИЛИЯ" > 'Соколов'::varchar
  AND ved."ИД" < 1457443
  AND ses."ДАТА" > '2012-01-25'::timestamp;