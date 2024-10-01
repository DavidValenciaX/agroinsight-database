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

CREATE TABLE `estado_asignacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);


CREATE TABLE `asignacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `tarea_labor_cultural_id` INT NOT NULL,
  `lote_id` INT NOT NULL,
  `fecha_asignacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `estado_id` INT NOT NULL,
  `notas` TEXT,
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `tarea_labor_cultural` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tipo_labor_id` INT NOT NULL,
  `fecha_programada` DATE NOT NULL,
  `descripcion` TEXT,
  `costo_mano_obra` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `estado_id` INT NOT NULL,
  `observaciones` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_completada` DATE,
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
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

ALTER TABLE `asignacion` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `asignacion` ADD FOREIGN KEY (`tarea_labor_cultural_id`) REFERENCES `tarea_labor_cultural` (`id`);

ALTER TABLE `asignacion` ADD FOREIGN KEY (`estado_id`) REFERENCES `estado_asignacion` (`id`);

ALTER TABLE `asignacion` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);