-- TASK 5 --
SELECT stud."ГРУППА", AVG(DATE_PART('year', AGE(peop."ДАТА_РОЖДЕНИЯ")))
FROM "Н_ЛЮДИ" peop
JOIN "Н_УЧЕНИКИ" stud
    ON stud."ЧЛВК_ИД" = peop."ИД"
GROUP BY stud."ГРУППА"
HAVING AVG(DATE_PART('year', AGE(peop."ДАТА_РОЖДЕНИЯ"))) < (
    SELECT AVG(DATE_PART('year', AGE(peop."ДАТА_РОЖДЕНИЯ")))
    FROM "Н_ЛЮДИ" peop
    JOIN "Н_УЧЕНИКИ" stud
        ON stud."ЧЛВК_ИД" = peop."ИД"
    WHERE stud."ГРУППА" = '1100'
    GROUP BY stud."ГРУППА"
);