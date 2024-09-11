DELIMITER //

CREATE PROCEDURE cleanup_expired_records()
BEGIN
    -- Eliminar registros de confirmacion_usuario expirados
    DELETE FROM confirmacion_usuario
    WHERE expiracion < NOW();

    -- Eliminar registros de verificacion_dos_pasos expirados
    DELETE FROM verificacion_dos_pasos
    WHERE expiracion < NOW();
END //

DELIMITER ;

-- Crear un evento que ejecute el procedimiento cada hora
CREATE EVENT cleanup_expired_records_event
ON SCHEDULE EVERY 1 HOUR
DO CALL cleanup_expired_records();