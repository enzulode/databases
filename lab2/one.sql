-- TASK 1 --
SELECT oc."КОД", ved."ДАТА" FROM "Н_ОЦЕНКИ" oc
RIGHT JOIN "Н_ВЕДОМОСТИ" ved ON oc."КОД" = ved."ОЦЕНКА"
WHERE oc."ПРИМЕЧАНИЕ" = 'удовлетворительно'
AND ved."ДАТА" < '1998-01-05'::timestamp;