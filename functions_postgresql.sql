-- Procedimiento para limpiar registros de confirmación de usuario, verificación en dos pasos y recuperación de contraseña

CREATE OR REPLACE FUNCTION cleanup_expired_records() RETURNS void LANGUAGE plpgsql AS $$
BEGIN
    -- Eliminar registros de confirmacion_usuario expirados
    DELETE FROM confirmacion_usuario
    WHERE expiracion < CURRENT_TIMESTAMP;

    -- Eliminar registros de verificacion_dos_pasos expirados
    DELETE FROM verificacion_dos_pasos
    WHERE expiracion < CURRENT_TIMESTAMP;

    -- Eliminar registros de recuperacion_contrasena expirados
    DELETE FROM recuperacion_contrasena
    WHERE expiracion < CURRENT_TIMESTAMP;
END;
$$;


--  Procedimiento para eliminación de usuarios no confirmados

CREATE OR REPLACE FUNCTION cleanup_pending_users() RETURNS void LANGUAGE plpgsql AS $$
BEGIN
    -- Eliminar los registros de usuario_finca_rol asociados con usuarios que tienen state_id = el ID de estado 'pending'
    DELETE FROM usuario_finca_rol
    WHERE usuario_id IN (
        SELECT id FROM usuario 
        WHERE state_id = (SELECT id FROM estado_usuario WHERE nombre = 'pending')
    );

    -- Eliminar los usuarios con state_id = el ID de estado 'pending'
    DELETE FROM usuario
    WHERE state_id = (SELECT id FROM estado_usuario WHERE nombre = 'pending');
END;
$$;

-- Procedimiento para limpiar tokens en lista negra

CREATE OR REPLACE FUNCTION clean_blacklisted_tokens() RETURNS void LANGUAGE plpgsql AS $$
BEGIN
    -- Eliminamos los tokens blacklisteados hace más de un día
    DELETE FROM blacklisted_tokens 
    WHERE blacklisted_at < (CURRENT_TIMESTAMP - INTERVAL '1 day');
END;
$$;
