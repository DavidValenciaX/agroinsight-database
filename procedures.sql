-- Procedimiento limpiar registros de confirmacion de usuario y verificacion en 2 pasos

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

-- Eliminar evento si existe
DROP EVENT IF EXISTS cleanup_expired_records_event;

-- Crear un evento que ejecute el procedimiento cada 10 minutos
CREATE EVENT cleanup_expired_records_event
ON SCHEDULE EVERY 10 MINUTE
DO CALL cleanup_expired_records()


-- Procedimiento y evento de eliminación de usuarios no confirmados

DELIMITER //

CREATE PROCEDURE cleanup_pending_users()
BEGIN
    -- Eliminar los registros de usuario_rol asociados con usuarios que tienen state_id = el ID de estado 'pending'
    DELETE FROM usuario_rol
    WHERE usuario_id IN (
        SELECT id FROM usuario 
        WHERE state_id = (SELECT id FROM estado_usuario WHERE nombre = 'pending')
    );

    -- Eliminar los usuarios con state_id = el ID de estado 'pending'
    DELETE FROM usuario
    WHERE state_id = (SELECT id FROM estado_usuario WHERE nombre = 'pending');
END //

DELIMITER ;

-- Eliminar evento si existe
DROP EVENT IF EXISTS cleanup_pending_users_event;

-- Crear un evento que ejecute el procedimiento cada 10 minutos
CREATE EVENT cleanup_pending_users_event
ON SCHEDULE EVERY 10 MINUTE
DO CALL cleanup_pending_users();