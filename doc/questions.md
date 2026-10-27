# Respuestas Teóricas - Trabajo Práctico Nº 1

### 1. ¿Por qué la tabla PRESTAMO tiene una clave primaria compuesta (PK, FK1, FK2, FK3)? ¿Qué pasaría si un estudiante quisiera pedir el mismo libro dos veces? ¿Cómo se maneja esa situación en la vida real vs. en este modelo?
* **Motivo:** En el diseño del modelo, la clave primaria compuesta por `(RUT_EST, RUT_FUNC, COD_LIBRO)` busca identificar unívocamente el evento de préstamo vinculando al estudiante, al funcionario emisor y al ejemplar prestado.
* **Consecuencia:** Si un estudiante devuelve el libro y posteriormente desea pedir el mismo libro atendido por el mismo funcionario, el motor rechazará la operación con un error de clave duplicada (`Duplicate entry for key 'PRIMARY'`), imposibilitando registrar un segundo préstamo idéntico.
* **Manejo en la vida real:** Se suele emplear una clave primaria subrogada autoincremental (por ejemplo, `ID_PRESTAMO INT AUTO_INCREMENT PRIMARY KEY`) o incluir un atributo temporal con precisión de segundos (como `FECHA_P`) dentro de la clave compuesta. De este modo, un estudiante puede retirar el mismo libro tantas veces como lo necesite a lo largo del tiempo.

### 2. Si intentamos borrar una CARRERA que tiene estudiantes asociados, ¿qué debería hacer la base de datos? ¿Por qué?
* La base de datos debe rechazar la eliminación arrojando una violación de restricción de integridad referencial (`Integrity constraint violation / Cannot delete or update a parent row: a foreign key constraint fails`).
* Esto previene la existencia de registros "huérfanos" (estudiantes asociados a un identificador de carrera inexistente) y asegura la consistencia de los datos en el sistema.

### 3. Observando la tabla LIBROS, ¿por qué crees que el autor está en una tabla separada (AUTORES) y no directamente en la tabla de libros?
* Responde a los principios de normalización (Segunda y Tercera Forma Normal - 2FN y 3FN).
* **Beneficios:**
  1. **Evita redundancia:** Si un autor publica 20 libros, sus nombres y apellidos se registran una única vez en `AUTORES`, en lugar de repetirse 20 veces en `LIBROS`.
  2. **Consistencia de datos:** Permite modificar o corregir el nombre de un autor en un único lugar sin riesgo de discrepancias o inconsistencias.
  3. **Escalabilidad:** Permite una eventual transición a una relación muchos a muchos si los libros fuesen de coautoría múltiple.

### 4. ¿Qué tipo de relación existe entre CAMPUS y CIUDAD? (Uno a Muchos, Muchos a Muchos, etc.). Justifica.
* Es una relación **Uno a Muchos (1:N)** desde `CIUDAD` hacia `CAMPUS`.
* **Justificación:** Una ciudad puede contener múltiples campus o sedes universitarias, pero cada registro de `CAMPUS` contiene una única clave foránea `FK1 ID_CIUDAD`, lo que restringe cada campus a estar ubicado en exactamente una sola ciudad.