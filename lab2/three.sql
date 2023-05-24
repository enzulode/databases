-- TASK 3 --
SELECT COUNT(peop) FROM "Н_ЛЮДИ" peop
RIGHT JOIN "Н_УЧЕНИКИ" stud
    ON peop."ИД" = stud."ЧЛВК_ИД"
WHERE DATE_PART('year', AGE(peop."ДАТА_РОЖДЕНИЯ")) < 20
    AND stud."ГРУППА" = '3102';