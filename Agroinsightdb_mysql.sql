CREATE TABLE `estado_usuario` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `usuario` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `failed_attempts` INT NOT NULL DEFAULT 0,
  `locked_until` DATETIME DEFAULT null,
  `state_id` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `confirmacion_usuario` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `pin` VARCHAR(64) NOT NULL,
  `expiracion` TIMESTAMP NOT NULL,
  `intentos` INT DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `resends` INT DEFAULT 0
);

CREATE TABLE `verificacion_dos_pasos` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `pin` VARCHAR(64) NOT NULL,
  `expiracion` TIMESTAMP NOT NULL,
  `intentos` INT DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `resends` INT DEFAULT 0
);

CREATE TABLE `recuperacion_contrasena` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `pin` VARCHAR(64) NOT NULL,
  `expiracion` TIMESTAMP NOT NULL,
  `intentos` INT DEFAULT 0,
  `pin_confirmado` BOOLEAN NOT NULL DEFAULT false,
  `created_at` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `resends` INT DEFAULT 0
);

CREATE TABLE `rol` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `permiso` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `accion` VARCHAR(100) NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `rol_permiso` (
  `rol_id` INT NOT NULL,
  `permiso_id` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP',
  PRIMARY KEY (`rol_id`, `permiso_id`)
);

CREATE TABLE `finca` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `ubicacion` VARCHAR(255),
  `area_total` DECIMAL(10,2) NOT NULL,
  `unidad_area_id` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `usuario_finca_rol` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `finca_id` INT NOT NULL,
  `rol_id` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `blacklisted_tokens` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `token` VARCHAR(500) UNIQUE NOT NULL,
  `usuario_id` INT NOT NULL,
  `blacklisted_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `lote` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `area` DECIMAL(10,2) NOT NULL,
  `unidad_area_id` INT NOT NULL,
  `latitud` DECIMAL(10,8) NOT NULL,
  `longitud` DECIMAL(11,8) NOT NULL,
  `finca_id` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `tipo_grano` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `color` VARCHAR(50),
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `variedad_maiz` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) UNIQUE NOT NULL,
  `nombre_cientifico` VARCHAR(100),
  `descripcion` TEXT,
  `altura_planta` DECIMAL(5,2),
  `altura_planta_unidad_id` INT,
  `rendimiento_promedio` DECIMAL(5,2) NOT NULL,
  `rendimiento_promedio_unidad_id` INT,
  `tipo_grano_id` INT NOT NULL,
  `densidad_siembra` DECIMAL(7,2),
  `densidad_siembra_unidad_id` INT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `cultivo` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lote_id` INT NOT NULL,
  `variedad_maiz_id` INT NOT NULL,
  `fecha_siembra` DATE NOT NULL,
  `area_sembrada` DECIMAL(10,2) NOT NULL,
  `area_sembrada_unidad_id` INT,
  `densidad_siembra` INT NOT NULL,
  `densidad_siembra_unidad_id` INT,
  `estado_id` INT NOT NULL,
  `fecha_cosecha` DATE NOT NULL,
  `produccion_total` INT NOT NULL,
  `produccion_total_unidad_id` INT,
  `precio_venta_unitario` DECIMAL(10,2) NOT NULL,
  `precio_venta_unitario_unidad_id` INT,
  `cantidad_vendida` INT NOT NULL,
  `ingreso_total` DECIMAL(15,2) NOT NULL,
  `costo_produccion` DECIMAL(15,2) NOT NULL,
  `fecha_venta` DATE NOT NULL,
  `observaciones` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `unidad_medida` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `abreviatura` VARCHAR(10) UNIQUE NOT NULL,
  `categoria_id` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `categoria_unidad_medida` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `tipo_labor_cultural` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `tarea_labor_cultural` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `tipo_labor_id` INT NOT NULL,
  `fecha_inicio_estimada` DATE NOT NULL,
  `fecha_finalizacion` DATE,
  `descripcion` TEXT,
  `estado_id` INT NOT NULL,
  `lote_id` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `tipo_insumo_agricola` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `unidad_medida_id` INT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `etapa_fenologica` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `variedad_maiz_id` INT NOT NULL,
  `nombre_etapa` VARCHAR(50) NOT NULL,
  `duracion` INT NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `caracteristicas_fenotipicas` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cultivo_id` INT NOT NULL,
  `altura_planta` DECIMAL(5,2) NOT NULL,
  `altura_planta_unidad_id` INT,
  `diametro_tallo` DECIMAL(4,2) NOT NULL,
  `diametro_tallo_unidad_id` INT,
  `numero_hojas` INT NOT NULL,
  `observaciones` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `tipo_alerta` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `estado_alerta` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `alerta` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lote_id` INT NOT NULL,
  `tipo_alerta` INT NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fecha_generacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `nivel_urgencia` ENUM ('Baja', 'Media', 'Alta') NOT NULL,
  `estado_id` INT NOT NULL,
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `tipo_notificacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `estado_notificacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `notificacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `tipo_notificacion` INT NOT NULL,
  `mensaje` TEXT NOT NULL,
  `leido` BOOLEAN NOT NULL DEFAULT (false),
  `fecha_generacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `estado_id` INT NOT NULL,
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `tipo_recomendacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `recomendacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lote_id` INT NOT NULL,
  `tipo_recomendacion_id` INT NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fecha_generacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `prioridad` ENUM ('Baja', 'Media', 'Alta') NOT NULL,
  `estado_id` INT NOT NULL,
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `accion_mitigacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `recomendacion_id` INT,
  `descripcion` TEXT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE,
  `estado_id` INT NOT NULL,
  `resultado` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `aplicacion_insumo` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `tarea_labor_id` INT NOT NULL,
  `insumo_id` INT,
  `fecha_aplicacion` DATE NOT NULL,
  `cantidad` DECIMAL(10,2) NOT NULL,
  `costo_unitario` DECIMAL(10,2) NOT NULL,
  `costo_total` DECIMAL(10,2) NOT NULL,
  `observaciones` TEXT,
  `fecha_creacion` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `uso_maquinaria` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `tarea_labor_id` INT NOT NULL,
  `maquinaria_id` INT,
  `fecha_uso` DATE NOT NULL,
  `horas_uso` DECIMAL(5,2) NOT NULL,
  `costo_total` DECIMAL(10,2) NOT NULL,
  `fecha_creacion` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `tipo_maquinaria_agricola` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  `costo_hora` DECIMAL(10,2) NOT NULL,
  `fecha_creacion` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `asignacion` (
  `usuario_id` INT NOT NULL,
  `tarea_labor_cultural_id` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP',
  PRIMARY KEY (`usuario_id`, `tarea_labor_cultural_id`)
);

CREATE TABLE `estado_cultivo` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `estado_tarea_labor_cultural` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `estado_recomendacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `estado_accion_mitigacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `registro_meteorologico` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lote_id` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `temperatura_min` DECIMAL(4,2) NOT NULL,
  `temperatura_max` DECIMAL(4,2) NOT NULL,
  `temperatura_promedio` DECIMAL(4,2) NOT NULL,
  `temperatura_unidad_id` INT,
  `presion_atmosferica` DECIMAL(6,2) NOT NULL,
  `presion_unidad_id` INT,
  `humedad_relativa` DECIMAL(5,2) NOT NULL,
  `humedad_unidad_id` INT,
  `precipitacion` DECIMAL(6,2) NOT NULL,
  `precipitacion_unidad_id` INT,
  `indice_uv` DECIMAL(3,1) NOT NULL,
  `horas_sol` DECIMAL(4,2) NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `color_suelo` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `textura_suelo` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `tonos_munsell` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tono` VARCHAR(5) UNIQUE NOT NULL,
  `descripcion` TEXT
);

CREATE TABLE `valores_munsell` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tono_id` INT NOT NULL,
  `valor` INT NOT NULL,
  `croma` INT NOT NULL
);

CREATE TABLE `tipo_suelo` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `color_id` INT NOT NULL,
  `textura_id` INT NOT NULL,
  `munsell_id` INT,
  `caracteristicas_generales` TEXT,
  `recomendaciones_manejo` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `analisis_suelo` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lote_id` INT NOT NULL,
  `tipo_suelo_id` INT NOT NULL,
  `fecha_analisis` DATE NOT NULL,
  `imagen_suelo` MEDIUMBLOB NOT NULL,
  `confianza_clasificacion` DECIMAL(5,2) NOT NULL,
  `observaciones` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `deteccion_gusano_cogollero` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lote_id` INT NOT NULL,
  `fecha_deteccion` TIMESTAMP NOT NULL,
  `imagen_planta` MEDIUMBLOB NOT NULL,
  `resultado_deteccion` ENUM ('Detectado', 'No Detectado', 'Indeterminado') NOT NULL,
  `confianza_deteccion` DECIMAL(5,2) NOT NULL,
  `latitud` DECIMAL(10,8),
  `longitud` DECIMAL(11,8),
  `observaciones` TEXT,
  `fecha_creacion` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `estado_informe` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `tipo_informe` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `informe` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tipo_informe_id` INT NOT NULL,
  `lote_id` INT,
  `fecha_generacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `periodo_inicio` DATE NOT NULL,
  `periodo_fin` DATE NOT NULL,
  `contenido` JSON NOT NULL,
  `estado_id` INT NOT NULL,
  `fecha_revision` TIMESTAMP,
  `observaciones` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE UNIQUE INDEX `idx_pin` ON `confirmacion_usuario` (`pin`);

CREATE UNIQUE INDEX `idx_verificacion_pin` ON `verificacion_dos_pasos` (`pin`);

CREATE UNIQUE INDEX `idx_recuperacion_pin` ON `recuperacion_contrasena` (`pin`);

CREATE UNIQUE INDEX `usuario_finca_rol_unique` ON `usuario_finca_rol` (`usuario_id`, `finca_id`, `rol_id`);

ALTER TABLE `usuario_finca_rol` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `usuario_finca_rol` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

ALTER TABLE `usuario_finca_rol` ADD FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);

ALTER TABLE `asignacion` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `asignacion` ADD FOREIGN KEY (`tarea_labor_cultural_id`) REFERENCES `tarea_labor_cultural` (`id`);

ALTER TABLE `verificacion_dos_pasos` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

ALTER TABLE `confirmacion_usuario` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

ALTER TABLE `recuperacion_contrasena` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

ALTER TABLE `usuario` ADD FOREIGN KEY (`state_id`) REFERENCES `estado_usuario` (`id`);

ALTER TABLE `blacklisted_tokens` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `rol_permiso` ADD FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);

ALTER TABLE `rol_permiso` ADD FOREIGN KEY (`permiso_id`) REFERENCES `permiso` (`id`);

ALTER TABLE `finca` ADD FOREIGN KEY (`unidad_area_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `lote` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

ALTER TABLE `lote` ADD FOREIGN KEY (`unidad_area_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `variedad_maiz` ADD FOREIGN KEY (`altura_planta_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `variedad_maiz` ADD FOREIGN KEY (`rendimiento_promedio_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `variedad_maiz` ADD FOREIGN KEY (`tipo_grano_id`) REFERENCES `tipo_grano` (`id`);

ALTER TABLE `variedad_maiz` ADD FOREIGN KEY (`densidad_siembra_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `cultivo` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

ALTER TABLE `cultivo` ADD FOREIGN KEY (`variedad_maiz_id`) REFERENCES `variedad_maiz` (`id`);

ALTER TABLE `cultivo` ADD FOREIGN KEY (`area_sembrada_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `cultivo` ADD FOREIGN KEY (`densidad_siembra_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `cultivo` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_cultivo` (`id`);

ALTER TABLE `cultivo` ADD FOREIGN KEY (`produccion_total_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `cultivo` ADD FOREIGN KEY (`precio_venta_unitario_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `unidad_medida` ADD FOREIGN KEY (`categoria_id`) REFERENCES `categoria_unidad_medida` (`id`);

ALTER TABLE `tarea_labor_cultural` ADD FOREIGN KEY (`tipo_labor_id`) REFERENCES `tipo_labor_cultural` (`id`);

ALTER TABLE `tarea_labor_cultural` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_tarea_labor_cultural` (`id`);

ALTER TABLE `tarea_labor_cultural` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

ALTER TABLE `tipo_insumo_agricola` ADD FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `etapa_fenologica` ADD FOREIGN KEY (`variedad_maiz_id`) REFERENCES `variedad_maiz` (`id`);

ALTER TABLE `caracteristicas_fenotipicas` ADD FOREIGN KEY (`cultivo_id`) REFERENCES `cultivo` (`id`);

ALTER TABLE `caracteristicas_fenotipicas` ADD FOREIGN KEY (`altura_planta_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `caracteristicas_fenotipicas` ADD FOREIGN KEY (`diametro_tallo_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `alerta` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

ALTER TABLE `alerta` ADD FOREIGN KEY (`tipo_alerta`) REFERENCES `tipo_alerta` (`id`);

ALTER TABLE `alerta` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_alerta` (`id`);

ALTER TABLE `notificacion` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `notificacion` ADD FOREIGN KEY (`tipo_notificacion`) REFERENCES `tipo_notificacion` (`id`);

ALTER TABLE `notificacion` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_notificacion` (`id`);

ALTER TABLE `recomendacion` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

ALTER TABLE `recomendacion` ADD FOREIGN KEY (`tipo_recomendacion_id`) REFERENCES `tipo_recomendacion` (`id`);

ALTER TABLE `recomendacion` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_recomendacion` (`id`);

ALTER TABLE `accion_mitigacion` ADD FOREIGN KEY (`recomendacion_id`) REFERENCES `recomendacion` (`id`);

ALTER TABLE `accion_mitigacion` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_accion_mitigacion` (`id`);

ALTER TABLE `aplicacion_insumo` ADD FOREIGN KEY (`tarea_labor_id`) REFERENCES `tarea_labor_cultural` (`id`);

ALTER TABLE `aplicacion_insumo` ADD FOREIGN KEY (`insumo_id`) REFERENCES `tipo_insumo_agricola` (`id`);

ALTER TABLE `uso_maquinaria` ADD FOREIGN KEY (`tarea_labor_id`) REFERENCES `tarea_labor_cultural` (`id`);

ALTER TABLE `uso_maquinaria` ADD FOREIGN KEY (`maquinaria_id`) REFERENCES `tipo_maquinaria_agricola` (`id`);

ALTER TABLE `registro_meteorologico` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

ALTER TABLE `registro_meteorologico` ADD FOREIGN KEY (`temperatura_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `registro_meteorologico` ADD FOREIGN KEY (`presion_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `registro_meteorologico` ADD FOREIGN KEY (`humedad_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `registro_meteorologico` ADD FOREIGN KEY (`precipitacion_unidad_id`) REFERENCES `unidad_medida` (`id`);

ALTER TABLE `valores_munsell` ADD FOREIGN KEY (`tono_id`) REFERENCES `tonos_munsell` (`id`);

ALTER TABLE `tipo_suelo` ADD FOREIGN KEY (`color_id`) REFERENCES `color_suelo` (`id`);

ALTER TABLE `tipo_suelo` ADD FOREIGN KEY (`textura_id`) REFERENCES `textura_suelo` (`id`);

ALTER TABLE `tipo_suelo` ADD FOREIGN KEY (`munsell_id`) REFERENCES `valores_munsell` (`id`);

ALTER TABLE `analisis_suelo` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

ALTER TABLE `analisis_suelo` ADD FOREIGN KEY (`tipo_suelo_id`) REFERENCES `tipo_suelo` (`id`);

ALTER TABLE `deteccion_gusano_cogollero` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

ALTER TABLE `informe` ADD FOREIGN KEY (`tipo_informe_id`) REFERENCES `tipo_informe` (`id`);

ALTER TABLE `informe` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

ALTER TABLE `informe` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_informe` (`id`);
