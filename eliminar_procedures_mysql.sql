-- Eliminar procedimientos
DROP PROCEDURE IF EXISTS cleanup_expired_records;
DROP PROCEDURE IF EXISTS cleanup_pending_users;
DROP PROCEDURE IF EXISTS clean_blacklisted_tokens;

-- Eliminar eventos
DROP EVENT IF EXISTS cleanup_expired_records_event;
DROP EVENT IF EXISTS cleanup_pending_users_event;
DROP EVENT IF EXISTS daily_clean_blacklisted_tokens;
