INSERT INTO estado_usuario (nombre, descripcion) VALUES
('active', 'Usuario activo y confirmado'),
('inactive', 'Usuario inactivo'),
('locked', 'Usuario bloqueado'),
('pending', 'Usuario pendiente de confirmación');

INSERT INTO rol (nombre, descripcion) VALUES
('Superusuario', 'Rol con acceso completo al sistema y capacidad de gestión de usuarios'),
('Administrador de Finca', 'Encargado de la gestión operativa de explotaciones agrícolas con acceso a informes de alto nivel y toma de decisiones estratégicas'),
('Agrónomo', 'Profesional con formación en agronomía para análisis y asesoramiento técnico'),
('Trabajador Agrícola', 'Personal encargado de tareas operativas en las fincas'),
('Usuario', 'Rol básico para usuarios recién registrados sin acceso a fincas'),
('Usuario No Confirmado', 'Rol para usuarios recién registrados pendientes de confirmación');

-- Insertar categorías de unidades de medida
INSERT INTO categoria_unidad_medida (nombre, descripcion) VALUES
('Longitud', 'Unidades para medir distancias y dimensiones lineales'),
('Área', 'Unidades para medir superficies'),
('Volumen', 'Unidades para medir capacidad o volumen'),
('Masa', 'Unidades para medir peso o masa'),
('Tiempo', 'Unidades para medir duración'),
('Temperatura', 'Unidades para medir temperatura');

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
('Kelvin', 'K', 6);


INSERT INTO tipo_labor_cultural (nombre, descripcion) VALUES
('Preparación del suelo', 'Actividades destinadas a preparar el suelo para la siembra, incluyendo labranza, arado y nivelación.'),
('Siembra', 'Proceso de colocar las semillas en el suelo en las condiciones adecuadas para su germinación y crecimiento.'),
('Fertilización', 'Aplicación de nutrientes al suelo para promover el crecimiento saludable de las plantas.'),
('Riego', 'Suministro de agua a los cultivos para mantener una adecuada humedad del suelo.'),
('Control de plagas', 'Acciones para prevenir y eliminar plagas que afectan los cultivos.'),
('Control de malezas', 'Eliminación de plantas no deseadas que compiten con los cultivos por recursos.'),
('Cosecha', 'Recolección de los cultivos maduros para su posterior procesamiento o venta.'),
('Post-cosecha', 'Procesos realizados después de la cosecha, como secado, limpieza y almacenamiento.'),
('Mantenimiento de maquinaria', 'Actividades de revisión y reparación de equipos agrícolas para asegurar su buen funcionamiento.'),
('Rotación de cultivos', 'Práctica de alternar diferentes tipos de cultivos en el mismo terreno para mejorar la salud del suelo.'),
('Monitoreo y seguimiento', 'Vigilancia constante de las condiciones de los cultivos y del medio ambiente para tomar decisiones informadas.'),
('Labranza', 'Trabajo del suelo mediante herramientas o maquinaria para prepararlo para la siembra.'),
('Arado', 'Proceso de romper y girar el suelo para facilitar la aireación y el drenaje.'),
('Rastrillado', 'Uso de herramientas para nivelar el suelo y eliminar restos de cultivos anteriores.'),
('Compactación', 'Proceso de presionar el suelo para mejorar su estructura y capacidad de retención de agua.'),
('Aplicación de herbicidas', 'Uso de productos químicos para eliminar malezas de manera eficiente.'),
('Aplicación de pesticidas', 'Uso de sustancias para controlar y eliminar plagas que dañan los cultivos.'),
('Aplicación de fungicidas', 'Uso de productos para prevenir y tratar enfermedades fúngicas en las plantas.'),
('Fertilización orgánica', 'Uso de materiales orgánicos como compost o estiércol para enriquecer el suelo.'),
('Fertilización química', 'Aplicación de fertilizantes sintéticos para aportar nutrientes específicos al suelo.'),
('Siembra directa', 'Método de siembra sin labranza previa, conservando la estructura del suelo.'),
('Siembra manual', 'Colocación de semillas en el suelo de manera manual.'),
('Siembra mecanizada', 'Uso de maquinaria para la siembra eficiente de grandes áreas.'),
('Riego por aspersión', 'Sistema de riego que distribuye el agua en forma de lluvia sobre los cultivos.'),
('Riego por goteo', 'Método de riego que suministra agua directamente a la base de cada planta.'),
('Riego por inundación', 'Riego que inunda el terreno con agua para asegurar la humedad necesaria.'),
('Control biológico de plagas', 'Uso de organismos vivos para controlar poblaciones de plagas.'),
('Manejo integrado de plagas', 'Estrategia que combina métodos biológicos, químicos y culturales para el control de plagas.'),
('Deshierbe manual', 'Eliminación de malezas de forma manual para mantener el cultivo limpio.'),
('Deshierbe mecánico', 'Uso de maquinaria para eliminar las malezas de manera rápida y eficiente.'),
('Cosecha manual', 'Recolección de cultivos utilizando herramientas y mano de obra humana.'),
('Cosecha mecanizada', 'Recolección de cultivos mediante maquinaria especializada.'),
('Secado de granos', 'Proceso de reducir la humedad de los granos para su conservación.'),
('Almacenamiento de granos', 'Guardar los granos cosechados en condiciones adecuadas para su preservación.'),
('Transporte de granos', 'Movimiento de los granos desde el campo hasta lugares de almacenamiento o procesamiento.'),
('Monitoreo de cultivos', 'Observación regular de los cultivos para detectar problemas tempranamente.'),
('Evaluación de rendimiento', 'Medición y análisis del rendimiento de los cultivos para optimizar futuras siembras.'),
('Análisis de suelo', 'Examen detallado de las características del suelo para mejorar su gestión.'),
('Manejo de residuos agrícolas', 'Gestión adecuada de los desechos generados en las actividades agrícolas.');

INSERT INTO estado_tarea_labor_cultural (nombre, descripcion) VALUES
('Programada', 'La tarea ha sido programada y está pendiente de inicio.'),
('En Progreso', 'La tarea está actualmente en ejecución.'),
('Completada', 'La tarea se ha completado exitosamente.'),
('Cancelada', 'La tarea ha sido cancelada y no se llevará a cabo.'),
('Pendiente', 'La tarea está pendiente de recursos o condiciones necesarias para su inicio.'),
('Retrasada', 'La tarea ha sufrido un retraso respecto a la programación original.'),
('Reasignada', 'La tarea ha sido asignada a otro usuario o equipo.'),
('En Espera', 'La tarea está en espera temporalmente debido a circunstancias específicas.'),
('Fallida', 'La tarea no se pudo completar debido a un error o problema.'),
('Revisada', 'La tarea ha sido revisada y aprobada para su ejecución.'),
('Aprobada', 'La tarea ha sido aprobada y está lista para ser iniciada.'),
('Postergada', 'La tarea ha sido postergada para una fecha futura.'),
('Finalizada', 'La tarea ha sido finalizada, incluyendo todas las actividades posteriores a su ejecución.');
