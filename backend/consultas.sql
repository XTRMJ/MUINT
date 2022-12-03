INSERT INTO muint.nivel VALUES ('0','admin');
INSERT INTO muint.usuario VALUES (0,'0','admin','admin');
INSERT INTO muint.personas(id_personas,nombre) VALUES (0,'Luis');
INSERT INTO muint.informacion(id_informacion,id_personas,id_usuario) VALUES (0,0,0);
--consulta para pruebas
SELECT u."user", lvl.nivel, q.nombre
FROM muint.informacion as i,muint.personas as q, muint.usuario as u, muint.nivel as lvl
WHERE i.id_personas = q.id_personas AND i.id_usuario = u.id_usuario AND u.id_nivel = lvl.id_nivel;
--tablas: usuario, nivel, personas, informacion.

--consulta basica para la aprehension
SELECT CONCAT(p.ap,', ',p.nombre) as nombre, CONCAT(g.longitud,', ',g.latitud) as lugar, m.motivo as motivo
FROM muint.personas as p, muint.geo as g, muint.motivo as m, muint.informacion as i, muint.aprehension as a
WHERE p.id_personas=i.id_personas AND a.id_personas=p.id_personas AND a.id_geo=g.id_geo AND
a.id_motivo=m.id_motivo ORDER BY 1 DESC LIMIT 1;
--Creacion de vista para la aprehension basica
CREATE OR REPLACE VIEW muint.aprehension_basica AS SELECT a.id_aprehension as ap, CONCAT(p.ap,', ',p.nombre) as nombre, CONCAT(g.longitud,', ',g.latitud) as lugar, m.motivo as motivo
FROM muint.personas as p, muint.geo as g, muint.motivo as m, muint.informacion as i, muint.aprehension as a
WHERE p.id_personas=i.id_personas AND a.id_personas=p.id_personas AND a.id_geo=g.id_geo AND
a.id_motivo=m.id_motivo;
--consulta en la vista
SELECT nombre,lugar,motivo FROM muint.aprehension_basica ORDER BY 1 DESC LIMIT 1;
