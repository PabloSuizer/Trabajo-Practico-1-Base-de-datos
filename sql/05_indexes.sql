USE biblioteca_universitaria;

-- Optimizar filtros por año y búsqueda por editorial
CREATE INDEX idx_libros_agno ON LIBROS(AGNO);
CREATE INDEX idx_libros_edit ON LIBROS(FK4_ID_EDIT);

-- Optimizar búsquedas y ordenamientos de préstamos por fecha
CREATE INDEX idx_prestamo_fecha ON PRESTAMO(FECHA_P);

-- Optimizar búsqueda alfabética por apellido de autores
CREATE INDEX idx_autores_apellido ON AUTORES(APELLIDOS);