-- =====================================================================
--  GUÍA DE PRÁCTICA PARA EL PARCIAL - biblioteca_universitaria
-- =====================================================================
--  Cómo usarla:
--   1. Abrí este archivo en DBeaver (o copiá los enunciados a un script SQL).
--   2. Escribí tu consulta debajo de cada enunciado.
--   3. Ejecutá con Ctrl+Enter (sentencia actual) y compará con soluciones.sql
--      (¡intentalo primero sin mirar!).
--
--  MODELO (tablas y relaciones):
--   CIUDAD(ID_CIUDAD, NOMBRE)
--   CAMPUS(ID_CAMPUS, NOMBRE, FK1_ID_CIUDAD -> CIUDAD)
--   CARRERAS(ID_CARRERA, NOMBRE, FK1_ID_CAMPUS -> CAMPUS)
--   ESTUDIANTES(RUT_EST, NOMBRES, APELLIDOS, EDAD, FONO, DIRECCION, FK1_ID_CARRERA -> CARRERAS)
--   FUNCIONARIOS(RUT_FUNC, NOMBRES, APELLIDOS, EDAD, DIRECCION, SALUD, FK1_ID_CAMPUS -> CAMPUS)
--   BIBLIOTECA(ID_BIBLIO, BIBLIOTECA)
--   TIPO(ID_TIPO, TIPO_P)
--   EDITORIALES(ID_EDIT, NOMBRE, PAIS)
--   AUTORES(RUT_AUTOR, NOMBRES, APELLIDOS)
--   LIBROS(COD_LIBRO, TITULO, AGNO, FK1_ID_BIBLIO, FK2_ID_TIPO, FK3_RUT_AUTOR, FK4_ID_EDIT)
--   PRESTAMO(RUT_EST, RUT_FUNC, COD_LIBRO, FECHA_P, FECHA_E)   -- FECHA_E NULL = no devuelto
-- =====================================================================

USE biblioteca_universitaria;

-- =====================================================================
-- NIVEL 1: SELECT, WHERE, ORDER BY, DISTINCT, LIKE, IN, BETWEEN, NULL
-- =====================================================================

-- 1.1 Mostrá título y año de los libros publicados entre 1940 y 2000 (inclusive).


-- 1.2 Mostrá nombre y apellido de los estudiantes cuyo apellido termine en "z".


-- 1.3 Listá los funcionarios ordenados por edad de mayor a menor.


-- 1.4 Mostrá los países de las editoriales sin repetir.


-- 1.5 Mostrá los libros cuyo tipo sea 1 o 3 (usá IN).


-- 1.6 Mostrá los préstamos que todavía NO fueron devueltos.


-- 1.7 Mostrá las editoriales que NO sean de España.


-- 1.8 Mostrá los estudiantes de entre 20 y 25 años cuyo nombre contenga la letra "a".


-- =====================================================================
-- NIVEL 2: FUNCIONES (agregación, texto, fechas) y alias
-- =====================================================================

-- 2.1 ¿Cuántos estudiantes hay en total? (columna: TOTAL_ESTUDIANTES)


-- 2.2 Mostrá la edad mínima, máxima y promedio (redondeado a 1 decimal) de los funcionarios.


-- 2.3 Mostrá cada libro con su antigüedad en años (año actual - AGNO), del más antiguo al más nuevo.


-- 2.4 Mostrá el nombre completo de cada autor en MAYÚSCULAS en una sola columna (AUTOR).


-- 2.5 Para los préstamos devueltos, mostrá cuántos días duró cada uno (DATEDIFF).


-- 2.6 Mostrá el título y la cantidad de caracteres del título de cada libro,
--     solo para los títulos de más de 15 caracteres.


-- =====================================================================
-- NIVEL 3: JOINS (INNER y LEFT)
-- =====================================================================

-- 3.1 Mostrá título, tipo, nombre completo del autor y editorial de cada libro.


-- 3.2 Mostrá cada funcionario con el nombre de su campus y la ciudad.


-- 3.3 Préstamos pendientes: estudiante, libro y cuántos días lleva prestado.


-- 3.4 Mostrá TODAS las editoriales con los títulos de sus libros
--     (si una editorial no tiene libros, igual debe aparecer).


-- 3.5 Mostrá todas las carreras con la cantidad de estudiantes (incluso las que tengan 0).


-- 3.6 Mostrá qué funcionario atendió cada préstamo y en qué campus trabaja ese funcionario.


-- =====================================================================
-- NIVEL 4: GROUP BY y HAVING
-- =====================================================================

-- 4.1 Cantidad de libros por biblioteca, de mayor a menor.


-- 4.2 Cantidad de préstamos por estudiante, mostrando solo los que tengan más de 1.


-- 4.3 Editoriales con más de 2 libros publicados.


-- 4.4 Edad promedio de los funcionarios agrupada por estado de SALUD.


-- 4.5 Por cada autor: cantidad de libros y el año de su libro más reciente.


-- 4.6 Cantidad de préstamos por mes (formato 'AAAA-MM').


-- =====================================================================
-- NIVEL 5: SUBCONSULTAS (IN, NOT IN, EXISTS, NOT EXISTS, escalares)
-- =====================================================================

-- 5.1 Libros publicados después del año promedio de todos los libros.


-- 5.2 Estudiantes mayores que el promedio de edad de los estudiantes.


-- 5.3 Libros del mismo autor que 'Tokyo Blues' (sin incluir 'Tokyo Blues').


-- 5.4 Estudiantes que pidieron prestado 'Cien Años de Soledad' (usá IN).


-- 5.5 Autores que NO tienen ningún libro prestado (usá NOT EXISTS).


-- 5.6 El funcionario que realizó más préstamos (nombre y cantidad).


-- 5.7 Libros cuyo año es el más antiguo de su propio tipo (subconsulta correlacionada).


-- =====================================================================
-- NIVEL 6: DML (INSERT / UPDATE / DELETE) dentro de una transacción
--  Ejecutá cada bloque completo. El ROLLBACK deshace los cambios,
--  así podés practicar sin romper la base.
-- =====================================================================

-- 6.1 Insertá un nuevo autor y un libro suyo. Verificá con un SELECT. Luego ROLLBACK.
START TRANSACTION;
-- tu INSERT acá

-- tu SELECT de verificación acá

ROLLBACK;

-- 6.2 Marcá como devueltos HOY todos los préstamos pendientes. Verificá. ROLLBACK.
START TRANSACTION;
-- tu UPDATE acá

ROLLBACK;

-- 6.3 Intentá borrar el libro 101. ¿Qué error da y por qué? (pensalo: claves foráneas)


-- 6.4 Intentá insertar un estudiante de 15 años. ¿Qué pasa y por qué? (pista: 07_triggers.sql)


-- =====================================================================
-- NIVEL 7: DESAFÍO (tipo parcial)
-- =====================================================================

-- 7.1 Por cada ciudad: cantidad de estudiantes y cantidad de préstamos que hicieron
--     sus estudiantes (incluí ciudades con 0).


-- 7.2 Ranking de libros por cantidad de préstamos, mostrando también los que
--     nunca se prestaron (con 0).


-- 7.3 Creá una vista VW_PENDIENTES con estudiante, fono, libro y días de atraso
--     (considerá atraso si lleva más de 7 días). Consultala y después borrala (DROP VIEW).
