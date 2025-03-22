/*1. Listado de todos los profesores y sus departamentos */
SELECT d.nombre AS nombre_departamento, p.apellido1, p.apellido2, p.nombre
FROM profesor p
LEFT JOIN departamento d ON p.id_departamento = d.id
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

/*2. Profesores sin departamento*/
SELECT p.*
FROM profesor p
WHERE p.id_departamento IS NULL;

/*3. Departamentos sin profesores asociados*/
SELECT d.*
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
WHERE p.id IS NULL;

/* 4. Profesores que no imparten ninguna asignatura*/
SELECT p.*
FROM profesor p
LEFT JOIN asignatura a ON p.id = a.id_profesor
WHERE a.id IS NULL;

/*5. Asignaturas sin profesor asignado*/
SELECT a.*
FROM asignatura a
WHERE a.id_profesor IS NULL;

/*6. Departamentos con alguna asignatura nunca impartida*/
SELECT d.nombre AS nombre_departamento, a.nombre AS nombre_asignatura
FROM asignatura a
JOIN profesor p ON a.id_profesor = p.id
JOIN departamento d ON p.id_departamento = d.id
LEFT JOIN alumno_se_matricula_asignatura m ON a.id = m.id_asignatura
WHERE m.id_asignatura IS NULL;

/*7. Total de alumnas*/
SELECT COUNT(*) AS total_alumnas
FROM alumno
WHERE sexo = 'M';
;

/* 8. Alumnos nacidos en 1999*/
SELECT COUNT(*) AS total_nacidos_1999
FROM alumno
WHERE YEAR(fecha_nacimiento) = 1999;

/*9. Profesores por departamento */
SELECT d.nombre, COUNT(p.id) AS total_profesores
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.id
ORDER BY total_profesores DESC;

/*10. Todos los departamentos y el número de profesores */
SELECT d.nombre, COUNT(p.id) AS total_profesores
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.id;

/*11. Grados y número de asignaturas */
SELECT g.nombre, COUNT(a.id) AS total_asignaturas
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.id
ORDER BY total_asignaturas DESC;

/*12. Grados con más de 40 asignaturas*/
SELECT g.nombre, COUNT(a.id) AS total_asignaturas
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.id
HAVING total_asignaturas > 40;

/*13. Créditos por tipo de asignatura y grado*/
SELECT g.nombre AS nombre_grado, a.tipo, SUM(a.credito) AS total_creditos
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.id, a.tipo
ORDER BY total_creditos DESC;

/*14. Alumnos matriculados por curso escolar*/
SELECT c.anyo_inicio, COUNT(DISTINCT m.id_alumno) AS total_alumnos
FROM curso_escolar c
LEFT JOIN alumno_se_matricula_asignatura m ON c.id = m.id_curso_escolar
GROUP BY c.id;

/*15. Número de asignaturas que imparte cada profesor*/
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS total_asignaturas
FROM profesor p
LEFT JOIN asignatura a ON p.id = a.id_profesor
GROUP BY p.id
ORDER BY total_asignaturas DESC;

/*16. Alumno más joven*/
SELECT *
FROM alumno
ORDER BY fecha_nacimiento DESC
LIMIT 1;

/*17. Profesores sin departamento*/
SELECT p.*
FROM profesor p
WHERE p.id_departamento IS NULL;

/*18. Departamentos sin profesores asociados */
SELECT d.*
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
WHERE p.id IS NULL;

/*19. Profesores con departamento pero sin impartir asignaturas*/
SELECT p.*
FROM profesor p
LEFT JOIN asignatura a ON p.id = a.id_profesor
WHERE p.id_departamento IS NOT NULL AND a.id IS NULL;

/*20. Asignaturas sin profesor asignado (repetida)*/
SELECT a.*
FROM asignatura a
WHERE a.id_profesor IS NULL;