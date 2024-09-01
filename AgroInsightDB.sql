CREATE TABLE `usuario` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `fecha_registro` DATETIME NOT NULL,
  `rol_id` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `rol` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `permisos` JSON NOT NULL,
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
  `ubicacion` VARCHAR(255) NOT NULL,
  `area_total` DECIMAL(10,2) NOT NULL,
  `latitud` DECIMAL(10,8),
  `longitud` DECIMAL(11,8),
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `usuario_finca_rol` (
  `usuario_id` INT NOT NULL,
  `finca_id` INT NOT NULL,
  `rol_id` INT NOT NULL,
  `fecha_asignacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP',
  PRIMARY KEY (`usuario_id`, `finca_id`, `rol_id`)
);

CREATE TABLE `lote` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `area` DECIMAL(10,2) NOT NULL,
  `ubicacion` VARCHAR(255),
  `latitud` DECIMAL(10,8),
  `longitud` DECIMAL(11,8),
  `id_finca` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `variedad_maiz` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `dias_maduracion` INT(3) NOT NULL,
  `resistencia_sequia` ENUM(baja,media,alta) NOT NULL,
  `resistencia_plagas` ENUM(baja,media,alta) NOT NULL,
  `rendimiento_promedio` DECIMAL(5,2) NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `cultivo` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  `id_variedad_maiz` INT NOT NULL,
  `fecha_siembra` DATE NOT NULL,
  `area_sembrada` DECIMAL(10,2) NOT NULL,
  `densidad_siembra` INT NOT NULL,
  `estado_id` INT NOT NULL,
  `fecha_cosecha` DATE NOT NULL,
  `produccion_total` INT NOT NULL,
  `precio_venta_unitario` DECIMAL(10,2) NOT NULL,
  `cantidad_vendida` INT NOT NULL,
  `ingreso_total` DECIMAL(15,2) NOT NULL,
  `costo_produccion` DECIMAL(15,2) NOT NULL,
  `ganancia_bruta` DECIMAL(15,2) NOT NULL,
  `fecha_venta` DATE NOT NULL,
  `observaciones` TEXT,
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
  `id_tipo_labor` INT NOT NULL,
  `fecha_programada` DATE NOT NULL,
  `descripcion` TEXT,
  `costo_mano_obra` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `estado_id` INT NOT NULL,
  `observaciones` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_completada` DATE,
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `tipo_insumo_agricola` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `unidad_medida` VARCHAR(20) NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `etapa_fenologica` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_variedad_maiz` INT NOT NULL,
  `nombre_etapa` VARCHAR(50) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `caracteristicas_fenotipicas` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_cultivo` INT NOT NULL,
  `fecha_registro` DATE NOT NULL,
  `altura_planta` DECIMAL(5,2) NOT NULL,
  `diametro_tallo` DECIMAL(4,2) NOT NULL,
  `numero_hojas` INT(3) NOT NULL,
  `observaciones` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `notificacion_alerta` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_cultivo` INT NOT NULL,
  `tipo_alerta` VARCHAR(50) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fecha_generacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `nivel_urgencia` ENUM(Baja,Media,Alta) NOT NULL,
  `estado_id` INT NOT NULL,
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `recomendacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  `tipo_recomendacion` VARCHAR(50) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fecha_generacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `prioridad` ENUM(Baja,Media,Alta) NOT NULL,
  `estado_id` INT NOT NULL,
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `accion_mitigacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_recomendacion` INT,
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
  `id_tarea_labor` INT NOT NULL,
  `insumo_id` INT,
  `fecha_aplicacion` DATE NOT NULL,
  `cantidad` DECIMAL(10,2) NOT NULL,
  `costo_unitario` DECIMAL(10,2) NOT NULL,
  `costo_total` DECIMAL(10,2) NOT NULL,
  `observaciones` TEXT,
  `fecha_creacion` DATETIME DEFAULT (CURRENT_TIMESTAMP),
  `fecha_actualizacion` DATETIME DEFAULT (CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
);

CREATE TABLE `uso_maquinaria` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `id_tarea_labor` INT NOT NULL,
  `maquinaria_id` INT,
  `fecha_uso` DATE NOT NULL,
  `horas_uso` DECIMAL(5,2) NOT NULL,
  `costo_total` DECIMAL(10,2) NOT NULL,
  `fecha_creacion` DATETIME DEFAULT (CURRENT_TIMESTAMP),
  `fecha_actualizacion` DATETIME DEFAULT (CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
);

CREATE TABLE `tipo_maquinaria_agricola` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  `costo_hora` DECIMAL(10,2) NOT NULL,
  `fecha_creacion` DATETIME DEFAULT (CURRENT_TIMESTAMP),
  `fecha_actualizacion` DATETIME DEFAULT (CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
);

CREATE TABLE `asignacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `tarea_labor_cultural_id` INT NOT NULL,
  `fecha_asignacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `estado_id` INT NOT NULL,
  `notas` TEXT,
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
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

CREATE TABLE `estado_notificacion_alerta` (
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

CREATE TABLE `estado_asignacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `registro_meteorologico` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `temperatura_min` DECIMAL(4,2) NOT NULL,
  `temperatura_max` DECIMAL(4,2) NOT NULL,
  `temperatura_promedio` DECIMAL(4,2) NOT NULL,
  `presion_atmosferica` DECIMAL(6,2) NOT NULL,
  `humedad_relativa` DECIMAL(5,2) NOT NULL,
  `precipitacion` DECIMAL(6,2) NOT NULL,
  `indice_uv` DECIMAL(3,1) NOT NULL,
  `horas_sol` DECIMAL(4,2) NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `tipo_suelo` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `color` VARCHAR(50) NOT NULL,
  `textura` VARCHAR(50) NOT NULL,
  `valor_munsell` VARCHAR(20) NOT NULL,
  `caracteristicas_generales` TEXT,
  `recomendaciones_manejo` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `analisis_suelo` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  `id_tipo_suelo` INT NOT NULL,
  `fecha_analisis` DATE NOT NULL,
  `imagen_suelo` MEDIUMBLOB NOT NULL,
  `confianza_clasificacion` DECIMAL(5,2) NOT NULL,
  `observaciones` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `deteccion_gusano_cogollero` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  `fecha_deteccion` TIMESTAMP NOT NULL,
  `imagen_planta` MEDIUMBLOB NOT NULL,
  `resultado_deteccion` ENUM(Detectado,No Detectado,Indeterminado) NOT NULL,
  `confianza_deteccion` DECIMAL(5,2) NOT NULL,
  `latitud` DECIMAL(10,8),
  `longitud` DECIMAL(11,8),
  `observaciones` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `estado_informe` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `informe` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tipo_informe` VARCHAR(50) NOT NULL,
  `id_lote` INT,
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

ALTER TABLE `rol_permiso` ADD FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);

ALTER TABLE `rol_permiso` ADD FOREIGN KEY (`permiso_id`) REFERENCES `permiso` (`id`);

ALTER TABLE `usuario_finca_rol` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `usuario_finca_rol` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

ALTER TABLE `usuario_finca_rol` ADD FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);

ALTER TABLE `lote` ADD FOREIGN KEY (`id_finca`) REFERENCES `finca` (`id`);

ALTER TABLE `cultivo` ADD FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id`);

ALTER TABLE `cultivo` ADD FOREIGN KEY (`id_variedad_maiz`) REFERENCES `variedad_maiz` (`id`);

ALTER TABLE `cultivo` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_cultivo` (`id`);

ALTER TABLE `tarea_labor_cultural` ADD FOREIGN KEY (`id_tipo_labor`) REFERENCES `tipo_labor_cultural` (`id`);

ALTER TABLE `tarea_labor_cultural` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_tarea_labor_cultural` (`id`);

ALTER TABLE `etapa_fenologica` ADD FOREIGN KEY (`id_variedad_maiz`) REFERENCES `variedad_maiz` (`id`);

ALTER TABLE `caracteristicas_fenotipicas` ADD FOREIGN KEY (`id_cultivo`) REFERENCES `cultivo` (`id`);

ALTER TABLE `notificacion_alerta` ADD FOREIGN KEY (`id_cultivo`) REFERENCES `cultivo` (`id`);

ALTER TABLE `notificacion_alerta` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_notificacion_alerta` (`id`);

ALTER TABLE `recomendacion` ADD FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id`);

ALTER TABLE `recomendacion` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_recomendacion` (`id`);

ALTER TABLE `accion_mitigacion` ADD FOREIGN KEY (`id_recomendacion`) REFERENCES `recomendacion` (`id`);

ALTER TABLE `accion_mitigacion` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_accion_mitigacion` (`id`);

ALTER TABLE `aplicacion_insumo` ADD FOREIGN KEY (`id_tarea_labor`) REFERENCES `tarea_labor_cultural` (`id`);

ALTER TABLE `aplicacion_insumo` ADD FOREIGN KEY (`insumo_id`) REFERENCES `tipo_insumo_agricola` (`id`);

ALTER TABLE `uso_maquinaria` ADD FOREIGN KEY (`id_tarea_labor`) REFERENCES `tarea_labor_cultural` (`id`);

ALTER TABLE `uso_maquinaria` ADD FOREIGN KEY (`maquinaria_id`) REFERENCES `tipo_maquinaria_agricola` (`id`);

ALTER TABLE `asignacion` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `asignacion` ADD FOREIGN KEY (`tarea_labor_cultural_id`) REFERENCES `tarea_labor_cultural` (`id`);

ALTER TABLE `asignacion` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_asignacion` (`id`);

ALTER TABLE `registro_meteorologico` ADD FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id`);

ALTER TABLE `analisis_suelo` ADD FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id`);

ALTER TABLE `analisis_suelo` ADD FOREIGN KEY (`id_tipo_suelo`) REFERENCES `tipo_suelo` (`id`);

ALTER TABLE `deteccion_gusano_cogollero` ADD FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id`);

ALTER TABLE `informe` ADD FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id`);

ALTER TABLE `informe` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_informe` (`id`);
