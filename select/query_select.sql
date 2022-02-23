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
SELECT `id`, `name`
FROM `courses`
WHERE `cfu` > '10';

-------------------------------------------------------------------------------------------------------------------

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
-- SELECT `id`, `name`, `date_of_birth`
-- FROM `students`
-- WHERE YEAR(CURRENT_DATE) - YEAR(`date_of_birth`) > 30;

SELECT `id`, `name`, `date_of_birth`
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURRENT_DATE()) > 30;
-------------------------------------------------------------------------------------------------------------------

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
-- laurea (286)
SELECT `id`, `period`, `year`
FROM `courses`
WHERE `period` = 'I semestre' 
	AND `year` = 1;

-------------------------------------------------------------------------------------------------------------------

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
-- 20/06/2020 (21)

-- per chiarimento, in questa query terrò conto anche degli esami che sono iniziati dalle 14 in poi quindi:
SELECT `id`, `hour`, `date`
FROM `exams`
WHERE `date` = '2020-06-20'
	AND HOUR(`hour`) >= 14;

-------------------------------------------------------------------------------------------------------------------

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT `id`, `name`, `level`
FROM `degrees`
WHERE `level` = 'magistrale';

-------------------------------------------------------------------------------------------------------------------

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(`id`) AS num_departments
FROM `departments`;

-------------------------------------------------------------------------------------------------------------------

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT `id`, `name`, `surname`
FROM `teachers`
WHERE `phone` IS NULL;

-- per il conteggio invece

SELECT COUNT(`id`) AS num_teachers_no_phone
FROM `teachers` 
WHERE `phone` IS NULL;
