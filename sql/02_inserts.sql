USE biblioteca_universitaria;

INSERT INTO CIUDAD (ID_CIUDAD, NOMBRE) VALUES
(1, 'Santiago'),
(2, 'Valparaíso'),
(3, 'Concepción');

INSERT INTO TIPO (ID_TIPO, TIPO_P) VALUES
(1, 'Novela'),
(2, 'Poesía'),
(3, 'Técnico / Científico');

INSERT INTO BIBLIOTECA (ID_BIBLIO, BIBLIOTECA) VALUES
(1, 'Biblioteca Central'),
(2, 'Biblioteca Campus Norte'),
(3, 'Biblioteca Tecnológica');

INSERT INTO EDITORIALES (ID_EDIT, NOMBRE, PAIS) VALUES
(1, 'Planeta', 'España'),
(2, 'Sudamericana', 'Argentina'),
(3, 'O Reilly Media', 'Estados Unidos');

INSERT INTO AUTORES (RUT_AUTOR, NOMBRES, APELLIDOS) VALUES
('11.111.111-1', 'Gabriel', 'García Márquez'),
('22.222.222-2', 'Pablo', 'Neruda'),
('33.333.333-3', 'Haruki', 'Murakami'),
('44.444.444-4', 'Jorge Luis', 'Borges');

INSERT INTO CAMPUS (ID_CAMPUS, NOMBRE, FK1_ID_CIUDAD) VALUES
(1, 'Campus San Joaquín', 1),
(2, 'Campus El Pinar', 2),
(3, 'Campus Collao', 3);

INSERT INTO CARRERAS (ID_CARRERA, NOMBRE, FK1_ID_CAMPUS) VALUES
(1, 'Ingeniería en Informática', 1),
(2, 'Licenciatura en Literatura', 2),
(3, 'Ingeniería Civil', 3);

INSERT INTO FUNCIONARIOS (RUT_FUNC, NOMBRES, APELLIDOS, EDAD, DIRECCION, SALUD, FK1_ID_CAMPUS) VALUES
('F-101', 'Carlos', 'Gómez', 45, 'Av. Vicuña Mackenna 4860', 'Buena', 1),
('F-102', 'Marta', 'Silva', 54, 'Calle Valparaíso 120', 'Regular', 2),
('F-103', 'Andrés', 'Vega', 52, 'Av. O Higgins 750', 'Mala', 3);

INSERT INTO ESTUDIANTES (RUT_EST, NOMBRES, APELLIDOS, EDAD, FONO, DIRECCION, FK1_ID_CARRERA) VALUES
('E-001', 'Juan', 'Pérez', 26, '+56911112222', 'Av. Providencia 1020', 1),
('E-002', 'María', 'López', 22, '+56933334444', 'Calle Prat 540', 2),
('E-003', 'Rodrigo', 'Fuentes', 28, '+56955556666', 'Calle Barros Arana 12', 3),
('E-004', 'Camila', 'Morales', 20, '+56977778888', 'Av. Grecia 450', 1);

INSERT INTO LIBROS (COD_LIBRO, TITULO, AGNO, FK1_ID_BIBLIO, FK2_ID_TIPO, FK3_RUT_AUTOR, FK4_ID_EDIT) VALUES
(101, 'Cien Años de Soledad', 1967, 1, 1, '11.111.111-1', 2),
(102, 'Veinte Poemas de Amor', 1924, 2, 2, '22.222.222-2', 1),
(103, 'Tokyo Blues', 1987, 1, 1, '33.333.333-3', 1),
(104, '1Q84', 2009, 1, 1, '33.333.333-3', 1),
(105, 'Ficciones', 1944, 2, 1, '44.444.444-4', 2),
(106, 'Designing Data-Intensive Applications', 2017, 3, 3, '33.333.333-3', 3),
(107, 'El Aleph (Sin prestar)', 1949, 2, 1, '44.444.444-4', 2);

-- Préstamos con fechas relativas dinámicas para que el "mes anterior" siempre tenga datos
INSERT INTO PRESTAMO (RUT_EST, RUT_FUNC, COD_LIBRO, FECHA_P, FECHA_E) VALUES
-- Préstamo del mes anterior (Día 10 del mes pasado):
('E-001', 'F-101', 101, DATE_ADD(DATE_SUB(DATE_FORMAT(CURDATE(), '%Y-%m-01'), INTERVAL 1 MONTH), INTERVAL 9 DAY), DATE_ADD(DATE_SUB(DATE_FORMAT(CURDATE(), '%Y-%m-01'), INTERVAL 1 MONTH), INTERVAL 16 DAY)),
-- Préstamo del mes anterior (Día 20 del mes pasado):
('E-002', 'F-102', 101, DATE_ADD(DATE_SUB(DATE_FORMAT(CURDATE(), '%Y-%m-01'), INTERVAL 1 MONTH), INTERVAL 19 DAY), DATE_ADD(DATE_SUB(DATE_FORMAT(CURDATE(), '%Y-%m-01'), INTERVAL 1 MONTH), INTERVAL 26 DAY)),
-- Préstamos del mes en curso:
('E-001', 'F-101', 103, CURDATE(), NULL),
('E-003', 'F-101', 101, CURDATE(), NULL),
('E-002', 'F-103', 106, CURDATE(), NULL);