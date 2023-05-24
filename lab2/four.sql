-- TASK 4 --
SELECT fktu_groups_2011."ГРУППА", fktu_groups_2011."КОЛВО"
FROM (
    SELECT stud."ГРУППА", COUNT(stud."ИД") AS "КОЛВО" FROM "Н_УЧЕНИКИ" stud
    JOIN "Н_ПЛАНЫ" plans
        ON stud."ПЛАН_ИД" = plans."ИД" AND plans."УЧЕБНЫЙ_ГОД" = '2010/2011'
    JOIN "Н_ОТДЕЛЫ" otd
        ON otd."ИД" = plans."ОТД_ИД" AND otd."КОРОТКОЕ_ИМЯ" = 'КТиУ'
    GROUP BY stud."ГРУППА"
) AS fktu_groups_2011
WHERE fktu_groups_2011."КОЛВО" > 5;


-- TASK 4 : ANASTASIA --
SELECT DISTINCT peop."ОТЧЕСТВО", COUNT(peop."ОТЧЕСТВО") as "amount"
FROM "Н_ЛЮДИ" peop
INNER JOIN "Н_УЧЕНИКИ" studs ON peop."ИД" = studs."ЧЛВК_ИД"
INNER JOIN "Н_ПЛАНЫ" plans ON studs."ПЛАН_ИД" = plans."ПЛАН_ИД"
INNER JOIN "Н_ОТДЕЛЫ" deps ON plans."ОТД_ИД" = deps."ОТД_ИД"
WHERE peop."ИД" NOT IN (SELECT nonstuds."ЧЛВК_ИД" FROM "Н_УЧЕНИКИ" nonstuds)
  AND deps."КОРОТКОЕ_ИМЯ" = 'КТиУ'
GROUP BY peop."ОТЧЕСТВО"
HAVING COUNT(peop."ОТЧЕСТВО") < 50;



CREATE TABLE kek(
    kek INT
);