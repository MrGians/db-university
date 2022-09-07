-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `students`.`surname` ,`degrees`.`name` AS `corso_laurea`
FROM `students`
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';


-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `degrees`.`name`, `departments`.`name`
FROM `degrees`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';


-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`id` AS `course_id`, 
`courses`.`name` AS `course_name`, 
`teachers`.`id` AS `teacher_id`,
`teachers`.`name` AS `teacher_name`,
`teachers`.`surname` AS `teacher_surname` 
FROM `courses`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`name` = "Fulvio"
AND `teachers`.`surname` = "Amato";


-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
--    relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`registration_number` AS `student_id`,
`students`.`surname` AS `student_surname`,
`students`.`name` AS `student_name`,
`degrees`.`name` AS `degree_course`,
`degrees`.`level` AS `degree_level`,
`departments`.`name` AS `department`
FROM `students`
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname`, `students`.`name`;


-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS `degree_course_name`,
`courses`.`name` AS `course_name`,
`teachers`.`name` AS `teacher_name`,
`teachers`.`surname` AS `teacher_surname`
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`  
ORDER BY `degree_course_name` ASC;


-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`id` AS `teacher_id`,
`teachers`.`name` AS `teacher_name`,
`teachers`.`surname` AS `teacher_surname`,
`teachers`.`email` AS `teacher_mail`,
`departments`.`name` AS `department`
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Matematica"  


-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami