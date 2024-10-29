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
('Rendimiento', 'Unidades para medir rendimiento de cultivos');


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
-- Masa
('Kilogramo', 'kg', 4),
('Gramo', 'g', 4),
('Tonelada', 't', 4),
('Libra', 'lb', 4),
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
('Kilogramos por hectárea', 'kg/ha', 9);


INSERT INTO tipo_labor_cultural (nombre, descripcion) VALUES
('Siembra', 'Proceso de colocar las semillas en el suelo en las condiciones adecuadas para su germinación y crecimiento.'),
('Fertilización', 'Aplicación de nutrientes al suelo para promover el crecimiento saludable de las plantas.'),
('Riego', 'Suministro de agua a los cultivos para mantener una adecuada humedad del suelo.'),
('Control de plagas', 'Acciones para prevenir y eliminar plagas que afectan los cultivos.'),
('Control de malezas', 'Eliminación de plantas no deseadas que compiten con los cultivos por recursos.'),
('Cosecha', 'Recolección de los cultivos maduros para su posterior procesamiento o venta.'),
('Secado', 'Reducción del contenido de humedad de los productos cosechados para prevenir la proliferación de microorganismos y facilitar el almacenamiento.'),
('Limpieza', 'Eliminación de residuos, tierra y otras impurezas de los productos cosechados para mejorar su calidad y preparar para el almacenamiento o procesamiento.'),
('Clasificación y selección', 'Separación de los productos según su calidad, tamaño o estado para asegurar una mejor presentación y valor en el mercado.'),
('Almacenamiento', 'Acondicionamiento y conservación de los productos cosechados en condiciones óptimas de temperatura, humedad y ventilación para mantener su calidad.'),
('Empaque', 'Embalaje de los productos agrícolas para protegerlos durante el transporte y mejorar su comercialización.'),
('Transporte', 'Movimiento de los productos desde el lugar de cosecha o almacenamiento hasta los mercados o lugares de procesamiento.'),
('Tratamiento post-cosecha', 'Aplicación de tratamientos específicos para prolongar la vida útil de los productos, como el uso de fungicidas, recubrimientos protectores o atmósfera controlada.'),
('Rotación de cultivos', 'Práctica de alternar diferentes tipos de cultivos en el mismo terreno para mejorar la salud del suelo.'),
('Monitoreo fitosanitario', 'Vigilancia sistemática de la salud de los cultivos, orientada a la detección temprana de plagas, enfermedades y otros factores fitosanitarios que puedan afectar a las plantas.'),
('Labranza', 'Trabajo del suelo mediante herramientas o maquinaria para prepararlo para la siembra.'),
('Arado', 'Proceso de romper y girar el suelo para facilitar la aireación y el drenaje.'),
('Rastrillado', 'Uso de herramientas para nivelar el suelo y eliminar restos de cultivos anteriores.'),
('Compactación', 'Proceso de presionar el suelo para mejorar su estructura y capacidad de retención de agua.'),
('Aplicación de fungicidas', 'Uso de productos para prevenir y tratar enfermedades fúngicas en las plantas.'),
('Control biológico de plagas', 'Uso de organismos vivos para controlar poblaciones de plagas.'),
('Análisis de suelo', 'Examen detallado de las características del suelo para mejorar su gestión.'),
('Manejo de residuos agrícolas', 'Gestión adecuada de los desechos generados en las actividades agrícolas.');

INSERT INTO estado_tarea_labor_cultural (nombre, descripcion) VALUES
('Programada', 'La tarea ha sido programada y está pendiente de inicio.'),
('En Progreso', 'La tarea está actualmente en ejecución.'),
('Completada', 'La tarea se ha completado exitosamente.'),
('Cancelada', 'La tarea ha sido cancelada y no se llevará a cabo.'),
('Pendiente', 'La tarea está pendiente de recursos o condiciones necesarias para su inicio.'),
('Retrasada', 'La tarea ha sufrido un retraso respecto a la programación original.'),
('Fallida', 'La tarea no se pudo completar debido a un error o problema.'),
('Revisada', 'La tarea ha sido revisada y aprobada para su ejecución.'),
('Aprobada', 'La tarea ha sido aprobada y está lista para ser iniciada.'),
('Postergada', 'La tarea ha sido postergada para una fecha futura.'),
('Cerrada', 'Todas las actividades asociadas a la tarea han finalizado, y la tarea está completamente cerrada.');


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
