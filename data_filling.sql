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

INSERT INTO finca (nombre, ubicacion, area_total, latitud, longitud) VALUES
('Finca Los Pinos', 'Valle del Cauca, Colombia', 150.75, 3.451647, -76.531985),
('Finca El Roble', 'Antioquia, Colombia', 200.50, 6.244203, -75.581212),
('Finca Las Flores', 'Cundinamarca, Colombia', 120.00, 4.710989, -74.072092),
('Finca La Esperanza', 'Nariño, Colombia', 300.00, 1.208926, -77.277210),
('Finca San Rafael', 'Boyacá, Colombia', 250.25, 5.535278, -73.367778);