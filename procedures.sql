-- Procedimiento limpiar registros de confirmacion de usuario, verificacion en 2 pasos y recuperacion contrasena

DELIMITER //

CREATE PROCEDURE cleanup_expired_records()
BEGIN
    -- Eliminar registros de confirmacion_usuario expirados
    DELETE FROM confirmacion_usuario
    WHERE expiracion < UTC_TIMESTAMP();

    -- Eliminar registros de verificacion_dos_pasos expirados
    DELETE FROM verificacion_dos_pasos
    WHERE expiracion < UTC_TIMESTAMP();

    -- Eliminar registros de recuperacion_contrasena expirados
    DELETE FROM recuperacion_contrasena
    WHERE expiracion < UTC_TIMESTAMP();
END //

DELIMITER ;

-- Eliminar evento si existe
DROP EVENT IF EXISTS cleanup_expired_records_event;

-- Asegúrate de que el Event Scheduler esté habilitado
SET GLOBAL event_scheduler = ON;

-- Crear un evento que ejecute el procedimiento cada 10 minutos
CREATE EVENT cleanup_expired_records_event
ON SCHEDULE EVERY 10 MINUTE
DO CALL cleanup_expired_records();


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

-- Asegúrate de que el Event Scheduler esté habilitado
SET GLOBAL event_scheduler = ON;

-- Crear un evento que ejecute el procedimiento cada 10 minutos
CREATE EVENT cleanup_pending_users_event
ON SCHEDULE EVERY 10 MINUTE
DO CALL cleanup_pending_users();

-- Procedimiento para limpiar tokens blacklisteados
DELIMITER //

CREATE PROCEDURE clean_blacklisted_tokens()
BEGIN
    -- Eliminamos los tokens blacklisteados hace más de un día
    DELETE FROM blacklisted_tokens 
    WHERE blacklisted_at < (UTC_TIMESTAMP() - INTERVAL 1 DAY);
END //

DELIMITER ;

-- Eliminar evento si existe
DROP EVENT IF EXISTS daily_clean_blacklisted_tokens;

-- Habilitar Event Scheduler
SET GLOBAL event_scheduler = ON;

-- Crear el Evento Programado
CREATE EVENT daily_clean_blacklisted_tokens
ON SCHEDULE EVERY 1 DAY
STARTS (CURRENT_TIMESTAMP + INTERVAL 1 DAY) -- Empieza dentro de 1 día desde ahora
DO CALL clean_blacklisted_tokens();
