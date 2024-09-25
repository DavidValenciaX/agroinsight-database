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

ALTER TABLE `usuario` ADD FOREIGN KEY (`state_id`) REFERENCES `estado_usuario` (`id`);

CREATE TABLE `confirmacion_usuario` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `pin` VARCHAR(64) NOT NULL,
  `expiracion` TIMESTAMP NOT NULL,
  `intentos` INT DEFAULT 0
);

ALTER TABLE `confirmacion_usuario` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

CREATE UNIQUE INDEX `idx_pin` ON `confirmacion_usuario` (`pin`);

CREATE TABLE `verificacion_dos_pasos` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `pin` VARCHAR(64) NOT NULL,
  `expiracion` TIMESTAMP NOT NULL,
  `intentos` INT DEFAULT 0
);

ALTER TABLE `verificacion_dos_pasos` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

CREATE TABLE `recuperacion_contrasena` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `pin` VARCHAR(64) NOT NULL,
  `expiracion` TIMESTAMP NOT NULL,
  `intentos` INT DEFAULT 0,
  `pin_confirmado` BOOLEAN NOT NULL DEFAULT FALSE
);

ALTER TABLE `recuperacion_contrasena` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

CREATE TABLE `usuario_rol` (
  `usuario_id` INT NOT NULL,
  `rol_id` INT NOT NULL,
  `fecha_asignacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP',
  PRIMARY KEY (`usuario_id`, `rol_id`)
);

ALTER TABLE `usuario_rol` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

CREATE TABLE `rol` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) UNIQUE NOT NULL,
  `descripcion` TEXT,
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

ALTER TABLE `usuario_rol` ADD FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);

CREATE TABLE `usuario_finca` (
  `usuario_id` INT NOT NULL,
  `finca_id` INT NOT NULL,
  `fecha_asignacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `fecha_modificacion` TIMESTAMP DEFAULT null COMMENT 'ON UPDATE CURRENT_TIMESTAMP',
  PRIMARY KEY (`usuario_id`, `finca_id`)
);

ALTER TABLE `usuario_finca` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

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

ALTER TABLE `usuario_finca` ADD FOREIGN KEY (`finca_id`) REFERENCES `finca` (`id`);

CREATE TABLE `blacklisted_tokens` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `token` VARCHAR(500) UNIQUE NOT NULL,
  `usuario_id` INT NOT NULL,
  `blacklisted_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

ALTER TABLE `blacklisted_tokens` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

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

ALTER TABLE `notificacion` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

CREATE TABLE `asignacion` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `tarea_labor_cultural_id` INT NOT NULL,
  `fecha_asignacion` TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `estado_id` INT NOT NULL,
  `notas` TEXT,
  `fecha_modificacion` TIMESTAMP DEFAULT (NULL) COMMENT 'ON UPDATE CURRENT_TIMESTAMP'
);

ALTER TABLE `asignacion` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
