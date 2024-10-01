ALTER TABLE `tarea_labor_cultural` ADD `lote_id` INT NOT NULL;
ALTER TABLE `tarea_labor_cultural` ADD FOREIGN KEY (`lote_id`) REFERENCES `lote` (`id`);