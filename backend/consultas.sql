INSERT INTO muint.nivel VALUES ('0','admin');
INSERT INTO muint.usuario VALUES (0,'0','admin','admin');
INSERT INTO muint.personas(id_personas,nombre) VALUES (0,'Luis');
INSERT INTO muint.informacion(id_informacion,id_personas,id_usuario) VALUES (0,0,0);

SELECT u."user", lvl.nivel, q.nombre
FROM muint.informacion as i,muint.personas as q, muint.usuario as u, muint.nivel as lvl
WHERE i.id_personas = q.id_personas AND i.id_usuario = u.id_usuario AND u.id_nivel = lvl.id_nivel;

--tablas: usuario, nivel, personas, informacion.