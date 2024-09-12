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