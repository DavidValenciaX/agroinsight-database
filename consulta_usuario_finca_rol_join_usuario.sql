select 

ufr.usuario_id, ufr.finca_id, ufr.rol_id, u.email

from usuario_finca_rol ufr

JOIN 

usuario u

ON ufr.usuario_id = u.id