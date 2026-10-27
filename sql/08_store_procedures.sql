USE biblioteca_universitaria;

DELIMITER //
CREATE PROCEDURE SP_REGISTRAR_PRESTAMO (
    IN p_RUT_EST VARCHAR(12),
    IN p_COD_LIBRO INT,
    IN p_RUT_FUNC VARCHAR(12),
    IN p_FECHA_P DATE
)
BEGIN
    DECLARE v_prestado INT DEFAULT 0;

    -- Opcional: verificar si el libro ya se encuentra prestado sin devolver
    SELECT COUNT(*) INTO v_prestado
    FROM PRESTAMO
    WHERE COD_LIBRO = p_COD_LIBRO AND FECHA_E IS NULL;

    IF v_prestado > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El libro ya se encuentra prestado actualmente';
    ELSE
        INSERT INTO PRESTAMO (RUT_EST, RUT_FUNC, COD_LIBRO, FECHA_P, FECHA_E)
        VALUES (p_RUT_EST, p_RUT_FUNC, p_COD_LIBRO, p_FECHA_P, DATE_ADD(p_FECHA_P, INTERVAL 7 DAY));

        SELECT 'Préstamo registrado correctamente' AS Mensaje;
    END IF;
END //
DELIMITER ;