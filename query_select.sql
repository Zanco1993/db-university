-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

-- 1° soluzione
SELECT `id`
FROM `students` 
WHERE `date_of_birth` >= '1990-01-01' AND `date_of_birth` <= '1990-12-31';

-- 2° soluzione
SELECT `id`
FROM `students` 
WHERE `date_of_birth` BETWEEN '1990-01-01' AND '1990-12-31';

-------------------------------------------------------------------------------------------------------------------

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `id`
FROM `courses`
WHERE `cfu` > '10';

-------------------------------------------------------------------------------------------------------------------

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `id`, `name`, `date_of_birth`
FROM `students`
WHERE YEAR(CURRENT_DATE) - YEAR(`date_of_birth`) > 30;

-------------------------------------------------------------------------------------------------------------------



