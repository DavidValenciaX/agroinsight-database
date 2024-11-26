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
        SELECT DISTINCT t.table_name
        FROM information_schema.columns t
        WHERE t.column_name = 'fecha_modificacion'
        AND t.table_schema = 'public'
        AND NOT EXISTS (
            SELECT 1
            FROM information_schema.triggers tr
            WHERE tr.trigger_name = 'actualizar_fecha_modificacion_' || t.table_name
            AND tr.event_object_schema = t.table_schema
            AND tr.event_object_table = t.table_name
        )
    LOOP
        EXECUTE format('
            CREATE TRIGGER actualizar_fecha_modificacion_%I
            BEFORE UPDATE ON %I
            FOR EACH ROW
            EXECUTE FUNCTION actualizar_fecha_modificacion();', rec.table_name, rec.table_name);
        RAISE NOTICE 'Trigger creado para la tabla: %', rec.table_name;
    END LOOP;
END;
$$;
