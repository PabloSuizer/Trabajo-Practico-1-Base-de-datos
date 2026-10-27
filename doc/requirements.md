# Especificación y Requisitos del Sistema de Biblioteca

## 1. Descripción del Modelo de Datos
El modelo representa la gestión académica y bibliotecaria de una red universitaria distribuida en múltiples campus y ciudades. Modela el control de sedes, carreras, estudiantes, funcionarios y el catálogo de libros (autores, editoriales, tipos de publicación y bibliotecas físicas), registrando las transacciones de préstamo de material bibliográfico realizadas entre estudiantes y personal administrativo.

## 2. Cardinalidades y Relaciones Inversas
* **CIUDAD - CAMPUS (1:N):** Una ciudad alberga uno o más campus; cada campus se emplaza en una única ciudad.
* **CAMPUS - CARRERAS (1:N):** En un campus se dictan varias carreras; cada carrera está radicada en un campus determinado.
* **CAMPUS - FUNCIONARIOS (1:N):** Un campus cuenta con múltiples funcionarios; cada funcionario está asignado a un campus.
* **CARRERAS - ESTUDIANTES (1:N):** Una carrera agrupa a varios estudiantes; cada estudiante pertenece a una carrera.
* **AUTORES - LIBROS (1:N):** Un autor puede haber escrito varios libros; cada libro tiene registrado un autor principal.
* **EDITORIALES - LIBROS (1:N):** Una editorial publica múltiples libros; un libro corresponde a una editorial.
* **BIBLIOTECA - LIBROS (1:N):** Una biblioteca almacena múltiples libros; cada ejemplar pertenece al inventario de una biblioteca física.
* **TIPO - LIBROS (1:N):** Una categoría o tipo clasifica a múltiples libros; un libro pertenece a una sola categoría.
* **ESTUDIANTES, FUNCIONARIOS, LIBROS - PRESTAMO (N:M compuesto):** Representa la transacción donde un estudiante recibe un libro atendido por un funcionario en una fecha determinada.

## 3. Requerimientos Funcionales
* **RF-01 (Gestión de Préstamos):** Registrar préstamos asociando estudiante, funcionario y libro con fecha de inicio y devolución.
* **RF-02 (Consultas de Disponibilidad y Estado):** Generar reportes de libros más solicitados, libros sin prestar y estudiantes sin actividad.
* **RF-03 (Auditoría Automática):** Registrar cada préstamo de forma automática en una bitácora de auditoría.
* **RF-04 (Validación de Ingreso):** Impedir el alta de estudiantes menores de 17 años mediante reglas de negocio a nivel de motor.
* **RF-05 (Seguridad y Privilegios):** Proveer roles diferenciados: solo lectura de catálogos y gestión de préstamos para bibliotecarios, y control total para administradores.

## 4. Requerimientos No Funcionales
* **RNF-01 (Integridad Referencial):** Mantener restricciones de clave foránea activas en el motor relacional.
* **RNF-02 (Portabilidad):** Contenedorización mediante Docker y Docker Compose para garantizar compatibilidad de despliegue.
* **RNF-03 (Performance):** Indexación estratégica sobre campos de consulta frecuente (años, títulos, claves foráneas).
