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

ALTER TABLE `cultivo` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

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

ALTER TABLE `alerta` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

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

ALTER TABLE `recomendacion` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

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

ALTER TABLE `registro_meteorologico` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

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

ALTER TABLE `analisis_suelo` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

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
  `fecha_actualizacion` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

ALTER TABLE `deteccion_gusano_cogollero` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

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

ALTER TABLE `informe` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);

CREATE TABLE `finca` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `ubicacion` VARCHAR(255) NULL,
  `area_total` DECIMAL(10,2) NOT NULL,
  `unidad_area_id` INT NOT NULL,
  `latitud` DECIMAL(10,8) NOT NULL,
  `longitud` DECIMAL(11,8) NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

ALTER TABLE `lote` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

CREATE TABLE `unidad_medida` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `abreviatura` VARCHAR(10) UNIQUE NOT NULL,
  `categoria_id` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

ALTER TABLE `lote` ADD FOREIGN KEY (`unidad_area_id`) REFERENCES `unidad_medida`(`id`);