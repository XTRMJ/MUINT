CREATE OR REPLACE VIEW muint.vista_rapida AS SELECT m.id_motivo, m.motivo, CONCAT(p.nombre,' ',p.ap,' ',p.am) AS nombre, CONCAT(m.fecha,', ', m.hora) AS fecha,
u.unidad FROM muint.aprehension AS a, muint.personas AS p, muint.motivo AS m, muint.unidad AS u
WHERE a.id_personas = p.id_personas AND a.id_motivo=m.id_motivo AND m.id_unidad=u.id_unidad;

SELECT * FROM muint.vista_rapida ORDER BY 1 DESC LIMIT 3;

CREATE OR REPLACE VIEW muint.vista_rapida_oxxo AS SELECT r.id_robo, o.oxxo, CONCAT(p.nombre,' ',p.ap,' ',p.am) AS nombre, r.fecha
FROM muint.robo AS r, muint.personas AS p, muint.oxxo AS o
WHERE r.id_personas = p.id_personas AND o.id_oxxo=r.id_oxxo AND m.id_unidad=u.id_unidad;

SELECT * FROM muint.vista_rapida_oxxo ORDER BY 1 DESC LIMIT 3;