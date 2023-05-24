-- TASK 7 --
SELECT people."ИД",
       people."ФАМИЛИЯ",
       people."ИМЯ",
       people."ОТЧЕСТВО"
FROM "Н_ЛЮДИ" AS people
WHERE NOT EXISTS (
  SELECT *
  FROM "Н_УЧЕНИКИ" stud
    JOIN "Н_ПЛАНЫ" plans ON stud."ПЛАН_ИД" = plans."ИД"
    JOIN "Н_ОТДЕЛЫ" departs ON plans."ОТД_ИД" = departs."ИД"
      AND departs."КОРОТКОЕ_ИМЯ" = 'КТиУ'
  WHERE stud."ЧЛВК_ИД" = people."ИД"
);