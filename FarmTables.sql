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

CREATE TABLE `usuario_finca` (
  `usuario_id` INT NOT NULL,
  `finca_id` INT NOT NULL,
  `fecha_asignacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP',
  PRIMARY KEY (`usuario_id`, `finca_id`)
);

ALTER TABLE `usuario_finca` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

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

ALTER TABLE `usuario_finca` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

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

ALTER TABLE `lote` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

CREATE TABLE `unidad_medida` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `abreviatura` VARCHAR(10) UNIQUE NOT NULL,
  `categoria_id` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

ALTER TABLE `finca` ADD FOREIGN KEY (`unidad_area_id`) REFERENCES `unidad_medida`(`id`);