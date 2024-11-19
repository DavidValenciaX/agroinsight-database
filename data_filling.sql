INSERT INTO estado_usuario (nombre, descripcion) VALUES
('active', 'Usuario activo y confirmado'),
('inactive', 'Usuario inactivo'),
('locked', 'Usuario bloqueado'),
('pending', 'Usuario pendiente de confirmación');

INSERT INTO rol (nombre, descripcion) VALUES
('Administrador de Finca', 'Encargado de la gestión operativa de explotaciones agrícolas con acceso a informes de alto nivel y toma de decisiones estratégicas'),
('Trabajador Agrícola', 'Personal encargado de tareas operativas en las fincas'),
('Rol no asignado', 'Rol básico para usuarios recién registrados sin acceso a fincas'),
('Rol no confirmado', 'Rol para usuarios recién registrados pendientes de confirmación');

-- Insertar categorías de unidades de medida
INSERT INTO categoria_unidad_medida (nombre, descripcion) VALUES
('Longitud', 'Unidades para medir distancias y dimensiones lineales'),
('Área', 'Unidades para medir superficies'),
('Volumen', 'Unidades para medir capacidad o volumen'),
('Masa', 'Unidades para medir peso o masa'),
('Tiempo', 'Unidades para medir duración'),
('Temperatura', 'Unidades para medir temperatura'),
('Densidad de siembra', 'Unidades para medir la densidad de semillas sembradas en un área determinada'),
('Moneda', 'Unidades para representar las divisas o monedas de transacción'),
('Rendimiento', 'Unidades para medir rendimiento de cultivos'),
('Presión', 'Unidades para medir presión atmosférica'),
('Porcentaje', 'Unidades porcentuales para diferentes mediciones'),
('Velocidad', 'Unidades para medir velocidad del viento'),
('Ángulo', 'Unidades para medir ángulos y direcciones'),
('Tasa de precipitación', 'Unidades para medir cantidad de precipitación por tiempo');


-- Insertar unidades de medida
INSERT INTO unidad_medida (nombre, abreviatura, categoria_id) VALUES
-- Longitud
('Metro', 'm', 1),
('Kilómetro', 'km', 1),
('Centímetro', 'cm', 1),
('Milímetro', 'mm', 1),
('Pulgada', 'in', 1),
('Pie', 'ft', 1),
-- Área
('Metro cuadrado', 'm²', 2),
('Kilómetro cuadrado', 'km²', 2),
('Hectárea', 'ha', 2),
('Acre', 'ac', 2),
-- Volumen
('Litro', 'L', 3),
('Mililitro', 'mL', 3),
('Metro cúbico', 'm³', 3),
('Galón', 'gal', 3),
('Bolsa 60000 semillas', 'bolsa 60k sem', 3),
-- Masa
('Kilogramo', 'kg', 4),
('Gramo', 'g', 4),
('Tonelada', 't', 4),
('Libra', 'lb', 4),
('Bulto 50 kilogramos', 'bulto 50kg', 4),
-- Tiempo
('Segundo', 's', 5),
('Minuto', 'min', 5),
('Hora', 'h', 5),
('Día', 'd', 5),
-- Temperatura
('Grado Celsius', '°C', 6),
('Grado Fahrenheit', '°F', 6),
('Kelvin', 'K', 6),
-- Densidad de siembra
('Plantas por hectárea', 'plantas/ha', 7 ),
('Semillas por hectárea', 'semillas/ha', 7 ),
('Semillas por metro cuadrado', 'semillas/m²', 7 ),
-- Moneda
('Peso Colombiano', 'COP', 8),
('Peso Mexicano', 'MXN', 8),
('Dólar Estadounidense', 'USD', 8),
('Euro', 'EUR', 8),
('Libra Esterlina', 'GBP', 8),
-- Rendimiento
('Toneladas por hectárea', 't/ha', 9),
('Kilogramos por hectárea', 'kg/ha', 9),
-- Presión 
('Hectopascal', 'hPa', 10),
('Milibar', 'mbar', 10),
-- Porcentaje
('Porcentaje', '%', 11),
-- Velocidad
('Metro por segundo', 'm/s', 12),
('Kilómetro por hora', 'km/h', 12),
('Milla por hora', 'mph', 12),
-- Ángulo
('Grado', '°', 13),
-- Tasa de precipitación
('Milímetro por hora', 'mm/h', 14);


INSERT INTO tipo_labor_cultural (nombre, descripcion, nivel) VALUES
-- Labores que son del lote
('Labranza', 'Trabajo del suelo mediante herramientas o maquinaria para prepararlo para la siembra.', 'LOTE'::nivel_labor_cultural_enum),
('Arado', 'Proceso de romper y girar el suelo para facilitar la aireación y el drenaje.', 'LOTE'::nivel_labor_cultural_enum),
('Rastrillado', 'Uso de herramientas para nivelar el suelo y eliminar restos de cultivos anteriores.', 'LOTE'::nivel_labor_cultural_enum),
('Compactación', 'Proceso de presionar el suelo para mejorar su estructura y capacidad de retención de agua.', 'LOTE'::nivel_labor_cultural_enum),
('Análisis de suelo', 'Examen detallado de las características del suelo para mejorar su gestión.', 'LOTE'::nivel_labor_cultural_enum),
('Rotación de cultivos', 'Práctica de alternar diferentes tipos de cultivos en el mismo terreno para mejorar la salud del suelo.', 'LOTE'::nivel_labor_cultural_enum),
('Manejo de residuos agrícolas', 'Gestión adecuada de los desechos generados en las actividades agrícolas.', 'LOTE'::nivel_labor_cultural_enum),
-- Labores que son de los cultivos
('Siembra', 'Proceso de colocar las semillas en el suelo en las condiciones adecuadas para su germinación y crecimiento.', 'CULTIVO'::nivel_labor_cultural_enum),
('Fertilización', 'Aplicación de nutrientes al suelo para promover el crecimiento saludable de las plantas.', 'CULTIVO'::nivel_labor_cultural_enum),
('Riego', 'Suministro de agua a los cultivos para mantener una adecuada humedad del suelo.', 'CULTIVO'::nivel_labor_cultural_enum),
('Control de plagas', 'Acciones para prevenir y eliminar plagas que afectan los cultivos.', 'CULTIVO'::nivel_labor_cultural_enum),
('Control de malezas', 'Eliminación de plantas no deseadas que compiten con los cultivos por recursos.', 'CULTIVO'::nivel_labor_cultural_enum),
('Cosecha', 'Recolección de los cultivos maduros para su posterior procesamiento o venta.', 'CULTIVO'::nivel_labor_cultural_enum),
('Secado', 'Reducción del contenido de humedad de los productos cosechados.', 'CULTIVO'::nivel_labor_cultural_enum),
('Limpieza', 'Eliminación de residuos, tierra y otras impurezas de los productos cosechados.', 'CULTIVO'::nivel_labor_cultural_enum),
('Clasificación y selección', 'Separación de los productos según su calidad, tamaño o estado.', 'CULTIVO'::nivel_labor_cultural_enum),
('Almacenamiento', 'Acondicionamiento y conservación de los productos cosechados.', 'CULTIVO'::nivel_labor_cultural_enum),
('Empaque', 'Embalaje de los productos agrícolas para protegerlos durante el transporte.', 'CULTIVO'::nivel_labor_cultural_enum),
('Transporte', 'Movimiento de los productos desde el lugar de cosecha o almacenamiento.', 'CULTIVO'::nivel_labor_cultural_enum),
('Tratamiento post-cosecha', 'Aplicación de tratamientos específicos para prolongar la vida útil.', 'CULTIVO'::nivel_labor_cultural_enum),
('Monitoreo fitosanitario', 'Vigilancia sistemática de la salud de los cultivos.', 'CULTIVO'::nivel_labor_cultural_enum),
('Aplicación de fungicidas', 'Uso de productos para prevenir y tratar enfermedades fúngicas.', 'CULTIVO'::nivel_labor_cultural_enum),
('Control biológico de plagas', 'Uso de organismos vivos para controlar poblaciones de plagas.', 'CULTIVO'::nivel_labor_cultural_enum);

INSERT INTO estado_tarea_labor_cultural (nombre, descripcion) VALUES
('Pendiente', 'La tarea está pendiente de inicio'),
('En Progreso', 'La tarea está actualmente en ejecución'),
('Completada', 'La tarea se ha completado exitosamente');


INSERT INTO "estado_cultivo" ("nombre", "descripcion")
VALUES 
('Programado', 'El cultivo está programado para su siembra.'),
('Sembrado', 'El cultivo ha sido plantado pero aún no ha germinado.'),
('Germinando', 'El cultivo está en proceso de germinación.'),
('Creciendo', 'El cultivo está en la fase de crecimiento activo.'),
('Floración', 'El cultivo ha alcanzado la etapa de floración.'),
('Maduración', 'El cultivo está madurando y acercándose a la cosecha.'),
('Cosechado', 'El cultivo ha sido cosechado.'),
('Enfermo', 'El cultivo está afectado por alguna enfermedad o plaga.'),
('Muerto', 'El cultivo ha muerto debido a condiciones adversas.'),
('Dormante', 'El cultivo está en un estado de latencia.');

-- Primero insertamos los tipos de grano identificados
INSERT INTO tipo_grano (nombre, color, descripcion) VALUES
('Cristalino Amarillo', 'Amarillo', 'Granos de textura dura y cristalina, color amarillo brillante, típicos en variedades para alimentación animal y humana'),
('Cristalino Blanco', 'Blanco', 'Granos de textura dura y cristalina, color blanco, comúnmente usados para consumo humano'),
('Semi-cristalino Amarillo', 'Amarillo', 'Granos con textura intermedia entre cristalino y dentado, color amarillo'),
('Dulce Amarillo', 'Amarillo', 'Granos con alto contenido de azúcar, textura suave cuando están frescos, ideal para consumo como elote'),
('Dulce Cremoso', 'Amarillo Cremoso', 'Granos dulces con tonalidad cremosa, textura suave cuando están frescos'),
('Cristalino Harinoso', 'Amarillo', 'Granos cristalinos con cierta proporción harinosa, textura intermedia');

-- Ahora insertamos las variedades de maíz
INSERT INTO variedad_maiz (
    nombre, 
    nombre_cientifico, 
    descripcion, 
    altura_planta_promedio,
    altura_planta_promedio_unidad_id,
    rendimiento_promedio,
    rendimiento_promedio_unidad_id,
    tipo_grano_id,
    densidad_siembra_promedio,
    densidad_siembra_promedio_unidad_id
) VALUES
-- AGROSAVIA V-117
('AGROSAVIA V-117', 'Zea Mayz L.', 'A double purpose (grain and silage) yellow corn variety that is rustic with good plant size and root system. It is also known to produce double ears 20-30% of the time. This corn is adapted to the humid Caribbean region of Colombia.', 
268.00, -- promedio entre 243-293 cm
(SELECT id FROM unidad_medida WHERE abreviatura = 'cm'),
5.80,
(SELECT id FROM unidad_medida WHERE abreviatura = 't/ha'),
(SELECT id FROM tipo_grano WHERE nombre = 'Cristalino Amarillo'),
52500.00, -- promedio entre 50000-55000
(SELECT id FROM unidad_medida WHERE abreviatura = 'plantas/ha')),

-- AGROSAVIA V-160 QPM
('AGROSAVIA V-160 QPM', 'Zea Mayz L.', 'White corn variety with high lysine content. It is especially recommended for the Sinú River Valleys and the savannas of Córdoba, Sucre, and Bolívar. It may be susceptible to fall armyworm but this pest is easily controlled with integrated pest management. It is also characterized by having less than 5% rot in ears caused by the Fusarium and Aspergillus fungi.',
224.80,
(SELECT id FROM unidad_medida WHERE abreviatura = 'cm'),
5.20,
(SELECT id FROM unidad_medida WHERE abreviatura = 't/ha'),
(SELECT id FROM tipo_grano WHERE nombre = 'Cristalino Blanco'),
61250.00, -- promedio entre 60000-62500
(SELECT id FROM unidad_medida WHERE abreviatura = 'plantas/ha')),

-- AGROSAVIA V-121
('AGROSAVIA V-121', 'Zea Mayz L.', 'A double purpose yellow corn that is adapted to the humid Caribbean region of Colombia, especially the Sinú River Valley and the savannas of Córdoba, Sucre, and Bolívar. While it has low incidence and severity of ear rot, it is very susceptible to fall armyworm.',
233.30,
(SELECT id FROM unidad_medida WHERE abreviatura = 'cm'),
4.50, -- estimado basado en variedades similares
(SELECT id FROM unidad_medida WHERE abreviatura = 't/ha'),
(SELECT id FROM tipo_grano WHERE nombre = 'Semi-cristalino Amarillo'),
62500.00,
(SELECT id FROM unidad_medida WHERE abreviatura = 'plantas/ha')),

-- AGROSAVIA V-116 HAWAII DULCE
('AGROSAVIA V-116 HAWAII DULCE', 'Zea mayz L.', 'Sweet yellow corn that is susceptible to fall armyworm and Cercospora zeae-maydis but is minimally affected by these issues.',
187.00,
(SELECT id FROM unidad_medida WHERE abreviatura = 'cm'),
5.80,
(SELECT id FROM unidad_medida WHERE abreviatura = 't/ha'),
(SELECT id FROM tipo_grano WHERE nombre = 'Dulce Amarillo'),
55000.00, -- estimado basado en variedades similares
(SELECT id FROM unidad_medida WHERE abreviatura = 'plantas/ha')),

-- CORPOICA V-114
('CORPOICA V-114', 'Zea mayz L.', 'Yellow corn variety.',
268.00, -- promedio entre 243-293 cm
(SELECT id FROM unidad_medida WHERE abreviatura = 'cm'),
4.30,
(SELECT id FROM unidad_medida WHERE abreviatura = 't/ha'),
(SELECT id FROM tipo_grano WHERE nombre = 'Cristalino Amarillo'),
52500.00, -- promedio entre 50000-55000
(SELECT id FROM unidad_medida WHERE abreviatura = 'plantas/ha')),

-- CORPOICA V-115 Dulce
('CORPOICA V-115 Dulce', 'Zea mayz L.', 'A sweet, yellow corn variety that is susceptible to fall armyworm and Cercospora zeae-maydis.',
182.00,
(SELECT id FROM unidad_medida WHERE abreviatura = 'cm'),
5.20,
(SELECT id FROM unidad_medida WHERE abreviatura = 't/ha'),
(SELECT id FROM tipo_grano WHERE nombre = 'Dulce Cremoso'),
56000.00, -- promedio entre 50000-62000
(SELECT id FROM unidad_medida WHERE abreviatura = 'plantas/ha')),

-- CORPOICA V-159
('CORPOICA V-159', 'Zea mayz L.', 'White corn variety.',
211.00,
(SELECT id FROM unidad_medida WHERE abreviatura = 'cm'),
3.27,
(SELECT id FROM unidad_medida WHERE abreviatura = 't/ha'),
(SELECT id FROM tipo_grano WHERE nombre = 'Cristalino Blanco'),
56250.00, -- promedio entre 50000-62500
(SELECT id FROM unidad_medida WHERE abreviatura = 'plantas/ha')),

-- HR-ORO
('HR-ORO', 'Zea mayz L.', 'A hybrid yellow corn that is good for both grain and silage, making an excellent fodder with high nutritional quality.',
232.50, -- promedio entre 225-240 cm
(SELECT id FROM unidad_medida WHERE abreviatura = 'cm'),
7.50, -- promedio entre 6-9 t/ha
(SELECT id FROM unidad_medida WHERE abreviatura = 't/ha'),
(SELECT id FROM tipo_grano WHERE nombre = 'Cristalino Amarillo'),
77500.00, -- promedio entre 70000-85000
(SELECT id FROM unidad_medida WHERE abreviatura = 'plantas/ha')),

-- ICA V-305
('ICA V-305', 'Zea Mayz L.', 'A hard yellow corn variety that is of medium size, uniform, with good vigor, stability, and a high yield potential. It can be intercropped with coffee (Colombia variety) and beans (Cargamantorojo variety).',
234.00,
(SELECT id FROM unidad_medida WHERE abreviatura = 'cm'),
4.00,
(SELECT id FROM unidad_medida WHERE abreviatura = 't/ha'),
(SELECT id FROM tipo_grano WHERE nombre = 'Cristalino Harinoso'),
58250.00, -- promedio entre 54000-62500
(SELECT id FROM unidad_medida WHERE abreviatura = 'plantas/ha')),

-- ICA V-109
('ICA V-109', 'Zea Mayz L.', 'Yellow corn that can be used for grain or silage.',
240.00,
(SELECT id FROM unidad_medida WHERE abreviatura = 'cm'),
5.00, -- promedio entre 4-6 t/ha
(SELECT id FROM unidad_medida WHERE abreviatura = 't/ha'),
(SELECT id FROM tipo_grano WHERE nombre = 'Cristalino Harinoso'),
49500.00, -- promedio entre 44000-55000
(SELECT id FROM unidad_medida WHERE abreviatura = 'plantas/ha')),

-- ICA-V 156
('ICA-V 156', 'Zea Mayz L.', 'A white corn variety that can be used for grain or silage.',
210.00,
(SELECT id FROM unidad_medida WHERE abreviatura = 'cm'),
5.00, -- promedio entre 4-6 t/ha
(SELECT id FROM unidad_medida WHERE abreviatura = 't/ha'),
(SELECT id FROM tipo_grano WHERE nombre = 'Cristalino Blanco'),
58250.00, -- promedio entre 54000-62500
(SELECT id FROM unidad_medida WHERE abreviatura = 'plantas/ha')),

-- SGBIOH2
('SGBIOH2', 'Zea Mayz L.', 'A biofortified hybrid corn with a high zinc content, specifically developed by the International Maize and Wheat Improvement Center (CIMMYT) to contribute to reducing malnutrition in Colombia.',
157.00,
(SELECT id FROM unidad_medida WHERE abreviatura = 'cm'),
4.50, -- estimado basado en variedades similares
(SELECT id FROM unidad_medida WHERE abreviatura = 't/ha'),
(SELECT id FROM tipo_grano WHERE nombre = 'Cristalino Amarillo'),
55000.00, -- estimado basado en variedades similares
(SELECT id FROM unidad_medida WHERE abreviatura = 'plantas/ha'));


-- Inserción de tipos de suelo

-- Inserción de colores de suelo
INSERT INTO color_suelo (nombre, descripcion) VALUES
('Marrón grisáceo', 'Color característico de suelos aluviales, indica buena aireación y drenaje'),
('Negro', 'Color oscuro característico de suelos ricos en materia orgánica'),
('Gris oscuro', 'Color típico de suelos volcánicos tipo cinder'),
('Gris', 'Color característico de suelos arcillosos'),
('Rojo', 'Color característico de suelos lateríticos, indica alto contenido de óxidos de hierro'),
('Marrón oscuro', 'Color característico de suelos tipo turba, rico en materia orgánica'),
('Amarillo', 'Color característico de suelos amarillos, indica presencia de óxidos de hierro hidratados');

-- Inserción de texturas de suelo
INSERT INTO textura_suelo (nombre, descripcion) VALUES
('Franco arenosa', 'Textura equilibrada con predominio de arena, buen drenaje'),
('Franco arcillosa', 'Textura media con buena retención de nutrientes'),
('Arenosa gruesa', 'Textura gruesa característica de suelos volcánicos'),
('Arcillosa', 'Textura fina con alta retención de agua y nutrientes'),
('Franco arcillosa roja', 'Textura característica de suelos tropicales weatherizados'),
('Fibrosa', 'Textura orgánica característica de suelos de turba'),
('Franco limosa', 'Textura media con predominio de limo');

-- Inserción de tonos Munsell
INSERT INTO tonos_munsell (tono, descripcion) VALUES
('10YR', 'Amarillo-rojizo'),
('5YR', 'Rojizo'),
('7.5YR', 'Marrón'),
('2.5Y', 'Amarillento'),
('5R', 'Rojo'),
('2.5YR', 'Rojo amarillento'),
('10Y', 'Amarillo');

-- Inserción de valores Munsell
INSERT INTO valores_munsell (tono_id, valor, croma) VALUES
(1, 4, 2),  -- Para suelo aluvial
(2, 2, 1),  -- Para suelo negro
(3, 3, 1),  -- Para suelo cinder
(4, 5, 1),  -- Para suelo arcilloso
(5, 4, 6),  -- Para suelo laterítico
(6, 2, 2),  -- Para suelo de turba
(7, 6, 6);  -- Para suelo amarillo

-- Inserción de tipos de suelo
INSERT INTO tipo_suelo (nombre, descripcion, color_id, textura_id, munsell_id, caracteristicas_generales, recomendaciones_manejo) VALUES
('Alluvial Soil', 
 'Suelos formados por depósitos de materiales transportados por agua', 
 1, 1, 1,
 'Alto contenido de minerales, buena fertilidad natural, estructura variable según el material parental',
 'Mantener cobertura vegetal para prevenir erosión, rotación de cultivos, monitoreo de drenaje'),

('Black Soil', 
 'Suelos oscuros ricos en arcilla y materia orgánica', 
 2, 2, 2,
 'Alta capacidad de retención de agua, rico en calcio y magnesio, alta fertilidad natural',
 'Manejo cuidadoso de la humedad, evitar laboreo excesivo, incorporar materia orgánica'),

('Cinder Soil', 
 'Suelos de origen volcánico formados por cenizas y escoria', 
 3, 3, 3,
 'Buen drenaje, estructura suelta, bajo contenido de nutrientes',
 'Incorporar materia orgánica, fertilización regular, mantener humedad'),

('Clay Soil', 
 'Suelos con alto contenido de arcilla', 
 4, 4, 4,
 'Alta retención de agua y nutrientes, compactación frecuente, drenaje lento',
 'Evitar trabajar cuando está muy húmedo, incorporar materia orgánica, mejorar drenaje'),

('Laterite Soil', 
 'Suelos tropicales altamente meteorizados', 
 5, 5, 5,
 'Alto contenido de hierro y aluminio, baja fertilidad natural, buen drenaje',
 'Manejo de pH, fertilización regular, conservación de materia orgánica'),

('Peat Soil', 
 'Suelos orgánicos formados por acumulación de materia vegetal', 
 6, 6, 6,
 'Alto contenido de materia orgánica, retención de agua alta, acidez natural',
 'Control de nivel freático, prevención de oxidación, manejo de acidez'),

('Yellow Soil', 
 'Suelos con alto contenido de óxidos de hierro hidratados', 
 7, 7, 7,
 'Fertilidad moderada, buen drenaje, estructura moderadamente estable',
 'Manejo de acidez, incorporación de materia orgánica, rotación de cultivos');

-- Insertar insumos agricolas

--- insumos agricolas

 -- Insertar categorías de insumos agrícolas
INSERT INTO categoria_insumo_agricola (nombre, descripcion) VALUES
('Fertilizantes', 'Insumos para nutrición y fertilización del cultivo de maíz'),
('Fungicidas', 'Insumos para control de enfermedades fúngicas'),
('Insecticidas', 'Insumos para control de plagas e insectos'),
('Herbicidas', 'Insumos para control de malezas'),
('Semillas', 'Material genético certificado para siembra'),
('Acondicionadores de Suelo', 'Insumos para mejorar las condiciones del suelo'),
('Otros Insumos', 'Insumos complementarios para el manejo del cultivo');

-- Insertar insumos agrícolas
INSERT INTO insumo_agricola (categoria_id, nombre, descripcion, unidad_medida_id, costo_unitario, stock_actual) VALUES
-- Fertilizantes
((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Fertilizantes'),
 'Urea 46-0-0',
 'Fertilizante nitrogenado granular para desarrollo vegetativo',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bulto 50kg'),
 180000,
 125),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Fertilizantes'),
 'DAP 18-46-0',
 'Fosfato Diamónico para desarrollo radicular',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bulto 50kg'),
 195000,
 125),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Fertilizantes'),
 'KCl 0-0-60',
 'Cloruro de Potasio para llenado de grano',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bulto 50kg'),
 165000,
 125),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Fertilizantes'),
 'Nutrimon 15-15-15',
 'Fertilizante compuesto NPK balanceado para etapas iniciales',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bulto 50kg'),
 160000,
 125),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Fertilizantes'),
 'Abocol Triple 15',
 'Fertilizante granular balanceado para desarrollo general',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bulto 50kg'),
 155000,
 125),

-- Fungicidas
((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Fungicidas'),
 'Mole SC325',
 'Fungicida sistémico para control de enfermedades foliares en maíz',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 180000,
 45),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Fungicidas'),
 'Nativo SC300',
 'Fungicida de amplio espectro para control de roya y tizón',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 195000,
 45),

-- Silvacur Combi EC300
((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Fungicidas'),
 'Silvacur Combi EC300',
 'Fungicida preventivo y curativo para enfermedades foliares',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 170000,
 45),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Fungicidas'),
 'Mancozeb 80 WP',
 'Controla hongos como roya, mildiu y mancha de hoja',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'kg'),
 27500,
 45),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Fungicidas'),
 'Carbendazim CRL 500 SC',
 'Fungicida sistémico preventivo y curativo',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 55000,
 45),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Fungicidas'),
 'Amistar Top',
 'Fungicida sistémico de Syngenta para control de complejo mancha de asfalto',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 280000,
 45),

-- Insecticidas
((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Insecticidas'),
 'Audax FS600',
 'Insecticida para tratamiento de semillas',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 280000,
 35),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Insecticidas'),
 'Belt SC480',
 'Control de lepidópteros en cultivos de maíz',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 320000,
 35),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Insecticidas'),
 'Connect Duo OD300',
 'Insecticida de amplio espectro para control de plagas',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 185000,
 35),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Insecticidas'),
 'Destello SC',
 'Control de gusano cogollero y barrenadores',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 145000,
 35),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Insecticidas'),
 'Dinastia EC100',
 'Insecticida piretroide para control de plagas',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 98000,
 35),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Insecticidas'),
 'Dipel WG6,4',
 'Insecticida biológico para control de orugas',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'kg'),
 125000,
 35),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Insecticidas'),
 'Lorsban 4EC',
 'Insecticida organofosforado de amplio espectro',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 65000,
 35),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Insecticidas'),
 'Lambda-cihalotrina',
 'Controla gusanos e insectos chupadores',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 25000,
 35),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Insecticidas'),
 'Engeo',
 'Insecticida de Syngenta para control de cogollero y chinches',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 195000,
 35),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Insecticidas'),
 'Fiprogent',
 'Insecticida de contacto para control de cogollero y gusanos',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 145000,
 35),

-- Herbicidas
((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Herbicidas'),
 'Roundup Activo',
 'Herbicida sistémico de amplio espectro',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 45000,
 85),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Herbicidas'),
 'Roundup Brio',
 'Herbicida post-emergente para control de malezas',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 42000,
 85),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Herbicidas'),
 'Atrazina Vecol 90 WG',
 'Herbicida selectivo pre y post emergente',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'kg'),
 45000,
 85),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Herbicidas'),
 'Glifosato Roundup 480 SL',
 'Herbicida sistémico no selectivo',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 38000,
 85),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Herbicidas'),
 'Pendimetalina Vecol 400 EC',
 'Herbicida pre-emergente, evita el crecimiento de malezas desde la semilla',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 32500,
 85),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Herbicidas'),
 'Amina 720 SL',
 'Herbicida hormonal selectivo para control de malezas de hoja ancha',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 35000,
 85),

-- Semillas
((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'AGROSAVIA V-117',
 'Maíz amarillo de doble propósito (grano y silo), rústico con buen porte y sistema radicular. Adaptado a la región Caribe húmeda',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 750000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'AGROSAVIA V-160 QPM',
 'Variedad de maíz blanco con alto contenido de lisina. Recomendado para Valles del Sinú y sabanas de Córdoba, Sucre y Bolívar',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 780000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'AGROSAVIA V-121',
 'Maíz amarillo de doble propósito adaptado a la región Caribe húmeda, especialmente Valle del Sinú y sabanas',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 750000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'AGROSAVIA V-116 HAWAII DULCE',
 'Maíz dulce amarillo, susceptible al gusano cogollero y Cercospora zeae-maydis pero mínimamente afectado',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 820000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'CORPOICA V-114',
 'Variedad de maíz amarillo',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 720000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'CORPOICA V-115 Dulce',
 'Variedad de maíz dulce amarillo, susceptible al gusano cogollero y Cercospora zeae-maydis',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 800000,
 12),

-- Continuación Semillas
((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'CORPOICA V-159',
 'Variedad de maíz blanco',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 720000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'HR-ORO',
 'Híbrido de maíz amarillo apto para grano y silo, excelente forraje con alta calidad nutricional',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 850000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'ICA V-305',
 'Variedad de maíz amarillo duro de porte medio, uniforme, con buen vigor, estabilidad y alto potencial de rendimiento',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 720000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'ICA V-109',
 'Maíz amarillo para grano o silo',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 700000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'ICA-V 156',
 'Variedad de maíz blanco para grano o silo',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 700000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'SGBIOH2',
 'Híbrido de maíz biofortificado con alto contenido de zinc, desarrollado por CIMMYT para reducir la malnutrición en Colombia',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 880000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'Pioneer P3966',
 'Híbrido de maíz amarillo de alto rendimiento para zona cafetera y valles interandinos',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 920000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'Dekalb DK7088',
 'Híbrido de maíz amarillo tecnología VT Triple Pro para control de plagas',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 980000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'DK 7088',
 'Híbrido amarillo de alto rendimiento',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 850000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'P30F35',
 'Híbrido blanco tolerante a sequía',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bolsa 60k sem'),
 820000,
 12),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Semillas'),
 'FNC 318',
 'Variedad mejorada de polinización abierta',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'kg'),
 25000,
 12),

-- Acondicionadores de Suelo
((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Acondicionadores de Suelo'),
 'Cal Agrícola Dolomita BM',
 'Ajusta el pH del suelo, mejora absorción de nutrientes',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'bulto 50kg'),
 20000,
 200),

-- Otros Insumos
((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Otros Insumos'),
 'Cosmo-Aguas',
 'Coadyuvante para aplicación de agroquímicos',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 28000,
 65),

((SELECT id FROM categoria_insumo_agricola WHERE nombre = 'Otros Insumos'),
 'Nutrifoliar Completo',
 'Fertilizante foliar multinutrientes',
 (SELECT id FROM unidad_medida WHERE abreviatura = 'L'),
 45000,
 65);

-- Insertar datos de maquinaria

INSERT INTO tipo_maquinaria_agricola (nombre, descripcion) VALUES
('Tractor', 'Vehículo principal para diversas labores agrícolas'),
('Sembradora', 'Maquinaria especializada para la siembra de precisión'),
('Fumigadora', 'Equipo para aplicación de agroquímicos y fertilizantes'),
('Cosechadora', 'Maquinaria para la recolección del cultivo'),
('Arado', 'Implemento para preparación inicial del suelo'),
('Rastra', 'Implemento para preparación secundaria del suelo'),
('Cultivadora', 'Implemento para control de malezas entre hileras'),
('Fertilizadora', 'Equipo para aplicación de fertilizantes sólidos'),
('Desgranadora', 'Máquina para separar los granos de la mazorca'),
('Remolque', 'Equipo para transporte de insumos y cosecha');

INSERT INTO maquinaria_agricola (tipo_maquinaria_id, nombre, descripcion, modelo, numero_serie, costo_hora) VALUES
-- Tractores
(1, 'Tractor John Deere 6110J', 'Tractor mediano para labores generales', '6110J', 'JD6110-2023-001', 180000.00),
(1, 'Tractor Massey Ferguson 4275', 'Tractor versátil para múltiples tareas', 'MF4275', 'MF4275-2022-102', 160000.00),
(1, 'Tractor New Holland T6.130', 'Tractor potente para labores pesadas', 'T6.130', 'NH6130-2023-034', 200000.00),

-- Sembradoras
(2, 'Sembradora John Deere 1725', 'Sembradora de precisión 8 surcos', '1725', 'JD1725-2023-056', 140000.00),
(2, 'Sembradora Massey Ferguson 555', 'Sembradora mecánica 6 surcos', 'MF555', 'MF555-2022-089', 120000.00),

-- Fumigadoras
(3, 'Fumigadora Jacto Advance 3000', 'Fumigadora de arrastre 3000L', 'Advance 3000', 'JA3000-2023-045', 100000.00),
(3, 'Fumigadora Berthoud Tracker 3200', 'Fumigadora autopropulsada', 'Tracker 3200', 'BT3200-2023-012', 160000.00),

-- Cosechadoras
(4, 'Cosechadora John Deere S780', 'Cosechadora de alta capacidad', 'S780', 'JDS780-2023-007', 480000.00),
(4, 'Cosechadora Case IH 7240', 'Cosechadora axial-flow', '7240', 'CI7240-2022-023', 440000.00),

-- Arados
(5, 'Arado de Discos Baldan', 'Arado de 4 discos para preparación profunda', 'NVCR-4', 'BD2023-078', 60000.00),
(5, 'Arado de Vertedera Kverneland', 'Arado reversible de 3 surcos', 'ES85', 'KV2023-156', 72000.00),

-- Rastras
(6, 'Rastra de Discos Tatu', 'Rastra de 28 discos', 'GAPCR', 'RT2023-234', 80000.00),
(6, 'Rastra de Dientes Baldan', 'Rastra niveladora', 'CRNL', 'RB2023-567', 60000.00),

-- Cultivadoras
(7, 'Cultivadora John Deere 2210', 'Cultivadora de campo 30 pies', '2210', 'JD2210-2023-089', 100000.00),
(7, 'Cultivadora Case IH Tiger-Mate', 'Cultivadora de precisión', '255', 'CI255-2023-123', 112000.00),

-- Fertilizadoras
(8, 'Fertilizadora Amazone ZA-M', 'Fertilizadora de doble disco', 'ZA-M 1501', 'AM2023-345', 88000.00),
(8, 'Fertilizadora Kuhn Axis', 'Fertilizadora de precisión', 'AXIS 40.2', 'KH2023-678', 100000.00),

-- Desgranadoras
(9, 'Desgranadora Vencedora', 'Desgranadora estacionaria', 'D-1000', 'VD2023-890', 72000.00),
(9, 'Desgranadora Nogueira', 'Desgranadora con motor eléctrico', 'DM-50', 'ND2023-234', 60000.00),

-- Remolques
(10, 'Remolque JF', 'Remolque de volteo 12 toneladas', 'CarretaJF12000', 'JF2023-456', 48000.00),
(10, 'Remolque Metalfor', 'Remolque granelero 15 toneladas', 'Gran15000', 'MF2023-789', 60000.00);

-- Inserts para logs

-- Inserción de tipos de acciones
INSERT INTO tipo_accion_log (nombre, descripcion) VALUES
('CREAR', 'Acción de crear un nuevo registro en el sistema'),
('ACTUALIZAR', 'Acción de modificar un registro existente'),
('ELIMINAR', 'Acción de eliminar un registro del sistema'),
('INICIAR_SESION', 'Acción de inicio de sesión en el sistema'),
('CERRAR_SESION', 'Acción de cierre de sesión en el sistema'),
('VISUALIZAR', 'Acción de consultar o ver información'),
('EXPORTAR', 'Acción de exportar datos del sistema'),
('IMPORTAR', 'Acción de importar datos al sistema'),
('GENERAR_REPORTE', 'Acción de generar un reporte'),
('REGISTRAR_COSTOS', 'Acción de registrar costos de una tarea'),
('REGISTRAR_COSECHA', 'Acción de registrar datos de cosecha'),
('REGISTRAR_ANALISIS_SUELO', 'Acción de registrar un análisis de suelo'),
('REGISTRAR_CLIMA', 'Acción de registrar datos climáticos'),
('ASIGNAR_ROL', 'Acción de asignar un rol a un usuario'),
('CAMBIAR_ESTADO', 'Acción de cambiar el estado de un registro'),
('REGISTRAR_TAREA', 'Acción de registrar una tarea cultural'),
('REGISTRAR_PLAGA', 'Acción de registrar una plaga o enfermedad'),
('REGISTRAR_MONITOREO', 'Acción de registrar un monitoreo'),
('ASIGNAR_TAREA', 'Acción de asignar una tarea a un usuario'),
('COMPLETAR_TAREA', 'Acción de marcar una tarea como completada'),
('REGISTRAR_FINCA', 'Acción de registrar una nueva finca'),
('REGISTRAR_LOTE', 'Acción de registrar un nuevo lote'),
('ASIGNAR_USUARIO_FINCA', 'Acción de asignar un usuario a una finca'),
('REGISTRAR_USUARIO', 'Acción de registrar un nuevo usuario'),
('ACTUALIZAR_PERFIL', 'Acción de actualizar perfil de usuario'),
('CAMBIAR_CONTRASEÑA', 'Acción de cambiar contraseña de usuario'),
('CONFIRM_REGISTRATION', 'Acción de confirmar el registro de usuario'),
('VERIFY_2FA', 'Acción de verificar autenticación de dos factores'),
('PASSWORD_RECOVERY', 'Acción de iniciar recuperación de contraseña'),
('CONFIRM_RECOVERY', 'Acción de confirmar PIN de recuperación'),
('RESEND_PIN', 'Acción de reenviar PIN'),
('ANALIZAR_GUSANO_COGOLLERO', 'Acción de analizar imágenes para detectar gusano cogollero'),
('VERIFICAR_CONEXION', 'Acción de verificar conexión a internet');