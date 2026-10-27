USE biblioteca_universitaria;

-- 1. Nuevo estudiante asignado a carrera existente
INSERT INTO ESTUDIANTES (RUT_EST, NOMBRES, APELLIDOS, EDAD, FONO, DIRECCION, FK1_ID_CARRERA)
VALUES ('E-099', 'Lucas', 'Fernández', 21, '+56999998888', 'Pasaje Las Flores 300', 1);

-- 2. Actualizar salud a "Excelente" para funcionarios mayores de 50 años
UPDATE FUNCIONARIOS
SET SALUD = 'Excelente'
WHERE EDAD > 50;

-- 3. Borrar un libro que no tenga préstamos asociados
DELETE FROM LIBROS
WHERE COD_LIBRO = 107;

-- 4. Modificar ID_EDIT de un libro específico
UPDATE LIBROS
SET FK4_ID_EDIT = 1
WHERE COD_LIBRO = 105;