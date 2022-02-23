-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`id`, `students`.`name`, `degrees`.`name`
FROM `students`
JOIN `degrees`
	ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di laurea in Economia";

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `departments`.id, `departments`.name,`degrees`.`name`
FROM `departments`
JOIN `degrees`
	ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` LIKE "%neuroscienze";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `course_teacher`.`teacher_id`,`courses`.`name`
FROM `courses`
JOIN `course_teacher`
	ON `courses`.`id` = `course_teacher`.`course_id`
WHERE `course_teacher`.`teacher_id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
--    relativo dipartimento, in ordine alfabetico per cognome e nome

-- ho eseguito un doppio join perchè volevo ottenere anche l'informazione del nome dipartimento e non solo il codice
-- che si sarebbe trovata nella tabella ponte
SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `degrees`.`name` AS `nome_corso`, `departments`.`name` AS `nome_dipartimento` 
FROM `departments`
JOIN `degrees`
	ON `departments`.`id` = `degrees`.`department_id`
JOIN `students`
	ON `degrees`.`id` = `students`.`degree_id`
ORDER BY `students`.`name`, `students`.`surname`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`id` AS `corso_di_laurea_id`, `degrees`.`name`, `course_teacher`.`course_id`, `course_teacher`.`teacher_id`
FROM `degrees`
JOIN `courses`
	ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
	ON `course_teacher`.`course_id` = `courses`.`id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT COUNT(`course_teacher`.`teacher_id`), `degrees`.`department_id`
FROM `course_teacher`
JOIN `courses`
	ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees`
	ON `courses`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`department_id` = 5;
-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
--    superare ciascuno dei suoi esami

SELECT `students`.`id` AS `codice_studente`, COUNT(`exam_student`.`vote`) AS `num_esami_non_passati`
FROM `students`
LEFT JOIN `exam_student`
	ON `students`.`id` = `exam_student`.`student_id`
LEFT JOIN `exams`
	ON `exam_student`.`exam_id` = `exams`.`id`
WHERE `exam_student`.`vote` < 18
GROUP BY `students`.`id`;

