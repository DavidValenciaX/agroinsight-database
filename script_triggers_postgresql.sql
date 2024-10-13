-- Función para actualizar el campo fecha_modificacion
CREATE OR REPLACE FUNCTION actualizar_fecha_modificacion()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_modificacion = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Script para generar los triggers automáticamente
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT table_name
        FROM information_schema.columns
        WHERE column_name = 'fecha_modificacion'
        AND table_schema = 'public'
    LOOP
        EXECUTE format('
            CREATE TRIGGER actualizar_fecha_modificacion_%I
            BEFORE UPDATE ON %I
            FOR EACH ROW
            EXECUTE FUNCTION actualizar_fecha_modificacion();', rec.table_name, rec.table_name);
    END LOOP;
END;
$$;
