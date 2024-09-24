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