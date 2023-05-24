-- TASK 6 --
SELECT stud."ГРУППА",
       stud."ИД",
       people."ФАМИЛИЯ",
       people."ИМЯ",
       people."ОТЧЕСТВО",
       stud."П_ПРКОК_ИД" as номер_приказа,
       stud."СОСТОЯНИЕ" as состояние
FROM "Н_УЧЕНИКИ" stud
  JOIN "Н_ЛЮДИ" people ON people."ИД" = stud."ЧЛВК_ИД"
  JOIN "Н_ПЛАНЫ" plans ON stud."ПЛАН_ИД" = plans."ИД"
  JOIN "Н_ФОРМЫ_ОБУЧЕНИЯ" education_forms ON plans."ФО_ИД" = education_forms."ИД"
    AND education_forms."НАИМЕНОВАНИЕ" = 'Очная'
  JOIN "Н_НАПРАВЛЕНИЯ_СПЕЦИАЛ" ON plans."НАПС_ИД" = "Н_НАПРАВЛЕНИЯ_СПЕЦИАЛ"."ИД"
  JOIN "Н_НАПР_СПЕЦ" ON "Н_НАПР_СПЕЦ"."ИД" = "Н_НАПРАВЛЕНИЯ_СПЕЦИАЛ"."НС_ИД"
    AND "Н_НАПР_СПЕЦ"."КОД_НАПРСПЕЦ" = '230101'
  WHERE EXISTS (
    SELECT *
    FROM "Н_УЧЕНИКИ" all_enrolled_stud
    WHERE all_enrolled_stud."ПРИЗНАК" = 'обучен'
      AND all_enrolled_stud."СОСТОЯНИЕ" = 'утвержден'
      AND all_enrolled_stud."ИД" = stud."ИД"
      AND DATE(all_enrolled_stud."КОНЕЦ") < '2012-09-01'
  );