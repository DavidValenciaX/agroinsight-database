UPDATE "cultivo" 
SET 
    "fecha_siembra" = '2024-01-15',
    "fecha_cosecha" = '2024-05-15',
    "produccion_total" = 8500,           -- 8.5 toneladas
    "produccion_total_unidad_id" = 15,   -- kilogramos
    "precio_venta_unitario" = 3500.00,   -- $3,500 COP por kg
    "cantidad_vendida" = 8000,           -- 8000 kg vendidos
    "cantidad_vendida_unidad_id" = 15,   -- kilogramos
    "ingreso_total" = 28000000.00,       -- 8000 kg * $3,500 COP = $28,000,000 COP
    "costo_produccion" = 15000000.00,    -- $15,000,000 COP costos totales
    "moneda_id" = 29,                    -- Peso colombiano (COP)
    "fecha_venta" = '2024-05-20',        -- 5 días después de la cosecha
    "fecha_modificacion" = CURRENT_TIMESTAMP AT TIME ZONE 'UTC'
WHERE "id" = 2;

-- Insertar tareas de labor cultural para el ciclo completo del cultivo
INSERT INTO tarea_labor_cultural 
(nombre, tipo_labor_id, fecha_inicio_estimada, fecha_finalizacion, descripcion, estado_id, lote_id) 
VALUES
-- Preparación y siembra
('Análisis inicial de suelo', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Análisis de suelo'), 
 '2024-01-10', '2024-01-12', 
 'Análisis completo de suelo para determinar necesidades de fertilización', 3, 1),

('Preparación del terreno', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Labranza'), 
 '2024-01-13', '2024-01-14', 
 'Labranza y preparación del suelo para siembra', 3, 1),

('Siembra de maíz', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Siembra'), 
 '2024-01-15', '2024-01-15', 
 'Siembra del cultivo según densidad recomendada', 3, 1),

-- Fertilización y control inicial
('Primera fertilización', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Fertilización'), 
 '2024-01-30', '2024-01-30', 
 'Aplicación de fertilizante base 15 días después de siembra', 3, 1),

('Primer control de malezas', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de malezas'), 
 '2024-02-05', '2024-02-06', 
 'Control de malezas temprano', 3, 1),

-- Monitoreo y controles
('Primer monitoreo fitosanitario', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Monitoreo fitosanitario'), 
 '2024-02-15', '2024-02-15', 
 'Monitoreo para detectar presencia temprana de plagas', 3, 1),

('Segunda fertilización', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Fertilización'), 
 '2024-02-28', '2024-02-28', 
 'Aplicación de fertilizante en etapa V6', 3, 1),

('Control preventivo de plagas', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de plagas'), 
 '2024-03-10', '2024-03-10', 
 'Aplicación preventiva de control de plagas', 3, 1),

-- Manejo medio ciclo
('Segundo monitoreo fitosanitario', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Monitoreo fitosanitario'), 
 '2024-03-20', '2024-03-20', 
 'Monitoreo en etapa pre-floración', 3, 1),

('Tercer fertilización', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Fertilización'), 
 '2024-03-30', '2024-03-30', 
 'Aplicación de fertilizante en pre-floración', 3, 1),

-- Preparación cosecha
('Control pre-cosecha', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de plagas'), 
 '2024-04-30', '2024-04-30', 
 'Control final de plagas y enfermedades', 3, 1),

('Monitoreo de madurez', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Monitoreo fitosanitario'), 
 '2024-05-10', '2024-05-10', 
 'Evaluación de madurez para determinar momento óptimo de cosecha', 3, 1),

('Cosecha', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Cosecha'), 
 '2024-05-15', '2024-05-15', 
 'Cosecha del cultivo', 3, 1),

-- Post-cosecha
('Secado de grano', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Secado'), 
 '2024-05-16', '2024-05-18', 
 'Proceso de secado del grano cosechado', 3, 1),

('Limpieza y clasificación', 
 (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Limpieza'), 
 '2024-05-19', '2024-05-19', 
 'Limpieza y clasificación del grano para venta', 3, 1);



-- 1. Costos de mano de obra
-- Primero eliminamos los registros existentes para este lote
DELETE FROM costo_mano_obra 
WHERE tarea_labor_id IN (
    SELECT id FROM tarea_labor_cultural WHERE lote_id = 1
);

-- Luego insertamos los nuevos registros
INSERT INTO costo_mano_obra 
(tarea_labor_id, cantidad_trabajadores, horas_trabajadas, costo_hora, costo_total, observaciones)
SELECT 
    tlc.id,
    CASE 
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Análisis de suelo') THEN 2
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Labranza') THEN 3
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Siembra') THEN 4
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Fertilización') THEN 3
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de malezas') THEN 3
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Monitoreo fitosanitario') THEN 2
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de plagas') THEN 3
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Cosecha') THEN 6
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Secado') THEN 3
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Limpieza') THEN 4
        ELSE 2
    END as cantidad_trabajadores,
    CASE 
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Análisis de suelo') THEN 4
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Labranza') THEN 8
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Siembra') THEN 8
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Fertilización') THEN 6
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de malezas') THEN 6
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Monitoreo fitosanitario') THEN 4
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de plagas') THEN 6
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Cosecha') THEN 10
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Secado') THEN 8
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Limpieza') THEN 8
        ELSE 4
    END as horas_trabajadas,
    5000.00 as costo_hora,
    CASE 
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Análisis de suelo') THEN 40000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Labranza') THEN 120000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Siembra') THEN 160000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Fertilización') THEN 90000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de malezas') THEN 90000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Monitoreo fitosanitario') THEN 40000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de plagas') THEN 90000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Cosecha') THEN 300000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Secado') THEN 120000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Limpieza') THEN 160000.00
        ELSE 40000.00
    END as costo_total,
    'Trabajo realizado según cronograma' as observaciones
FROM tarea_labor_cultural tlc
WHERE tlc.lote_id = 1;

-- 2. Insumos utilizados
-- Primero eliminamos los registros existentes para este lote
DELETE FROM tarea_insumo 
WHERE tarea_labor_id IN (
    SELECT id FROM tarea_labor_cultural WHERE lote_id = 1
);

-- Luego insertamos los nuevos registros
INSERT INTO tarea_insumo 
(tarea_labor_id, insumo_id, cantidad_utilizada, costo_total, fecha_aplicacion, observaciones)
SELECT 
    tlc.id,
    CASE 
        WHEN tlc.nombre = 'Primera fertilización' THEN 
            (SELECT id FROM insumo_agricola WHERE nombre = 'Nutrimon 15-15-15')
        WHEN tlc.nombre = 'Segunda fertilización' THEN 
            (SELECT id FROM insumo_agricola WHERE nombre = 'Urea 46-0-0')
        WHEN tlc.nombre = 'Tercer fertilización' THEN 
            (SELECT id FROM insumo_agricola WHERE nombre = 'KCl 0-0-60')
        WHEN tlc.nombre = 'Primer control de malezas' THEN 
            (SELECT id FROM insumo_agricola WHERE nombre = 'Atrazina Vecol 90 WG')
        WHEN tlc.nombre = 'Control preventivo de plagas' THEN 
            (SELECT id FROM insumo_agricola WHERE nombre = 'Belt SC480')
        WHEN tlc.nombre = 'Control pre-cosecha' THEN 
            (SELECT id FROM insumo_agricola WHERE nombre = 'Engeo')
        WHEN tlc.nombre = 'Siembra de maíz' THEN 
            (SELECT id FROM insumo_agricola WHERE nombre = 'AGROSAVIA V-117')
    END as insumo_id,
    CASE 
        WHEN tlc.nombre LIKE '%fertilización%' THEN 4
        WHEN tlc.nombre LIKE '%control de malezas%' THEN 2
        WHEN tlc.nombre LIKE '%Control preventivo%' THEN 1
        WHEN tlc.nombre = 'Control pre-cosecha' THEN 1
        WHEN tlc.nombre = 'Siembra de maíz' THEN 1
    END as cantidad_utilizada,
    CASE 
        WHEN tlc.nombre = 'Primera fertilización' THEN 640000.00
        WHEN tlc.nombre = 'Segunda fertilización' THEN 720000.00
        WHEN tlc.nombre = 'Tercer fertilización' THEN 660000.00
        WHEN tlc.nombre = 'Primer control de malezas' THEN 90000.00
        WHEN tlc.nombre = 'Control preventivo de plagas' THEN 320000.00
        WHEN tlc.nombre = 'Control pre-cosecha' THEN 195000.00
        WHEN tlc.nombre = 'Siembra de maíz' THEN 750000.00
    END as costo_total,
    tlc.fecha_inicio_estimada as fecha_aplicacion,
    'Aplicación realizada según recomendaciones técnicas' as observaciones
FROM tarea_labor_cultural tlc
WHERE tlc.lote_id = 1 
AND tlc.nombre IN (
    'Primera fertilización', 'Segunda fertilización', 'Tercer fertilización',
    'Primer control de malezas', 'Control preventivo de plagas', 
    'Control pre-cosecha', 'Siembra de maíz'
)
AND CASE 
    WHEN tlc.nombre = 'Primera fertilización' THEN 
        (SELECT id FROM insumo_agricola WHERE nombre = 'Nutrimon 15-15-15')
    WHEN tlc.nombre = 'Segunda fertilización' THEN 
        (SELECT id FROM insumo_agricola WHERE nombre = 'Urea 46-0-0')
    WHEN tlc.nombre = 'Tercer fertilización' THEN 
        (SELECT id FROM insumo_agricola WHERE nombre = 'KCl 0-0-60')
    WHEN tlc.nombre = 'Primer control de malezas' THEN 
        (SELECT id FROM insumo_agricola WHERE nombre = 'Atrazina Vecol 90 WG')
    WHEN tlc.nombre = 'Control preventivo de plagas' THEN 
        (SELECT id FROM insumo_agricola WHERE nombre = 'Belt SC480')
    WHEN tlc.nombre = 'Control pre-cosecha' THEN 
        (SELECT id FROM insumo_agricola WHERE nombre = 'Engeo')
    WHEN tlc.nombre = 'Siembra de maíz' THEN 
        (SELECT id FROM insumo_agricola WHERE nombre = 'AGROSAVIA V-117')
END IS NOT NULL;

-- 3. Uso de maquinaria
-- Primero eliminamos los registros existentes para este lote
DELETE FROM tarea_maquinaria 
WHERE tarea_labor_id IN (
    SELECT id FROM tarea_labor_cultural WHERE lote_id = 1
);

-- Luego insertamos los nuevos registros
INSERT INTO tarea_maquinaria 
(tarea_labor_id, maquinaria_id, fecha_uso, horas_uso, costo_total, observaciones)
SELECT 
    tlc.id,
    CASE 
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Labranza') THEN 
            (SELECT id FROM maquinaria_agricola WHERE nombre = 'Tractor John Deere 6110J')
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Siembra') THEN 
            (SELECT id FROM maquinaria_agricola WHERE nombre = 'Sembradora John Deere 1725')
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Fertilización') THEN 
            (SELECT id FROM maquinaria_agricola WHERE nombre = 'Fertilizadora Amazone ZA-M')
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de malezas') THEN 
            (SELECT id FROM maquinaria_agricola WHERE nombre = 'Fumigadora Jacto Advance 3000')
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de plagas') THEN 
            (SELECT id FROM maquinaria_agricola WHERE nombre = 'Fumigadora Jacto Advance 3000')
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Cosecha') THEN 
            (SELECT id FROM maquinaria_agricola WHERE nombre = 'Cosechadora John Deere S780')
    END as maquinaria_id,
    tlc.fecha_inicio_estimada as fecha_uso,
    CASE 
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Labranza') THEN 8
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Siembra') THEN 6
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Fertilización') THEN 4
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de malezas') THEN 4
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de plagas') THEN 4
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Cosecha') THEN 8
    END as horas_uso,
    CASE 
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Labranza') THEN 1440000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Siembra') THEN 840000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Fertilización') THEN 352000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de malezas') THEN 400000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de plagas') THEN 400000.00
        WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Cosecha') THEN 3840000.00
    END as costo_total,
    'Maquinaria operada según especificaciones técnicas' as observaciones
FROM tarea_labor_cultural tlc
WHERE tlc.lote_id = 1
AND tlc.tipo_labor_id IN (
    SELECT id FROM tipo_labor_cultural 
    WHERE nombre IN ('Labranza', 'Siembra', 'Fertilización', 'Control de malezas', 'Control de plagas', 'Cosecha')
)
AND CASE 
    WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Labranza') THEN 
        (SELECT id FROM maquinaria_agricola WHERE nombre = 'Tractor John Deere 6110J')
    WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Siembra') THEN 
        (SELECT id FROM maquinaria_agricola WHERE nombre = 'Sembradora John Deere 1725')
    WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Fertilización') THEN 
        (SELECT id FROM maquinaria_agricola WHERE nombre = 'Fertilizadora Amazone ZA-M')
    WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de malezas') THEN 
        (SELECT id FROM maquinaria_agricola WHERE nombre = 'Fumigadora Jacto Advance 3000')
    WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Control de plagas') THEN 
        (SELECT id FROM maquinaria_agricola WHERE nombre = 'Fumigadora Jacto Advance 3000')
    WHEN tlc.tipo_labor_id = (SELECT id FROM tipo_labor_cultural WHERE nombre = 'Cosecha') THEN 
        (SELECT id FROM maquinaria_agricola WHERE nombre = 'Cosechadora John Deere S780')
END IS NOT NULL;