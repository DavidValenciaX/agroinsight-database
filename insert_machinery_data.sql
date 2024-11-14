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