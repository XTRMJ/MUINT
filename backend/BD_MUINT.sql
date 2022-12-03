-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.7.0
-- PostgreSQL version: 9.3
-- Project Site: pgmodeler.com.br
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE new_database;
-- CREATE DATABASE new_database
-- ;
-- -- ddl-end --
-- 

-- object: muint | type: SCHEMA --
-- DROP SCHEMA muint;
CREATE SCHEMA muint;
ALTER SCHEMA muint OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,muint;
-- ddl-end --

-- object: muint.estado_civil | type: TABLE --
-- DROP TABLE muint.estado_civil;
CREATE TABLE muint.estado_civil(
	id_ec smallint,
	estado_civil varchar(20) NOT NULL,
	CONSTRAINT id_ec_pk PRIMARY KEY (id_ec)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.estado_civil OWNER TO postgres;
-- ddl-end --

-- object: muint.escolaridad | type: TABLE --
-- DROP TABLE muint.escolaridad;
CREATE TABLE muint.escolaridad(
	id_escolaridad smallint NOT NULL,
	escolaridad varchar(15) NOT NULL,
	CONSTRAINT id_escolaridad_pk PRIMARY KEY (id_escolaridad)

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.escolaridad OWNER TO postgres;
-- ddl-end --

-- object: muint.adicciones | type: TABLE --
-- DROP TABLE muint.adicciones;
CREATE TABLE muint.adicciones(
	id_adicciones smallint,
	adicciones varchar(100),
	CONSTRAINT id_adicciones_pk PRIMARY KEY (id_adicciones)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.adicciones OWNER TO postgres;
-- ddl-end --

-- object: muint.unidad | type: TABLE --
-- DROP TABLE muint.unidad;
CREATE TABLE muint.unidad(
	id_unidad integer NOT NULL,
	unidad varchar(100) NOT NULL,
	CONSTRAINT id_unidad_pk PRIMARY KEY (id_unidad)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.unidad OWNER TO postgres;
-- ddl-end --

-- object: muint.sector | type: TABLE --
-- DROP TABLE muint.sector;
CREATE TABLE muint.sector(
	id_sector smallint,
	sector varchar(20) NOT NULL,
	CONSTRAINT id_sector_pk PRIMARY KEY (id_sector)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.sector OWNER TO postgres;
-- ddl-end --

-- object: muint.informacion | type: TABLE --
-- DROP TABLE muint.informacion;
CREATE TABLE muint.informacion(
	id_personas integer,
	id_ec smallint,
	id_pref_sexual smallint,
	id_escolaridad smallint,
	id_adicciones smallint,
	id_nacionalidad integer,
	id_municipio integer,
	id_calle integer,
	id_usuario integer,
	id_tatuaje integer,
	id_foto integer,
	CONSTRAINT informacion_pk PRIMARY KEY (id_personas)

)
TABLESPACE pg_default;
-- ddl-end --
COMMENT ON COLUMN muint.informacion.id_municipio IS 'Identificador del municipio';
ALTER TABLE muint.informacion OWNER TO postgres;
-- ddl-end --

-- object: muint.estados | type: TABLE --
-- DROP TABLE muint.estados;
CREATE TABLE muint.estados(
	id_estado integer,
	estado varchar(60) NOT NULL,
	CONSTRAINT id_estado_pk PRIMARY KEY (id_estado)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.estados OWNER TO postgres;
-- ddl-end --

-- object: muint.nacionalidad | type: TABLE --
-- DROP TABLE muint.nacionalidad;
CREATE TABLE muint.nacionalidad(
	id_nacionalidad integer,
	nacionalidad varchar(30) NOT NULL,
	CONSTRAINT id_nacionalidad_pk PRIMARY KEY (id_nacionalidad)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.nacionalidad OWNER TO postgres;
-- ddl-end --

-- object: muint.pref_sexual | type: TABLE --
-- DROP TABLE muint.pref_sexual;
CREATE TABLE muint.pref_sexual(
	id_pref_sexual smallint NOT NULL,
	pref_sexual varchar(20) NOT NULL,
	CONSTRAINT id_pref_sexual_pk PRIMARY KEY (id_pref_sexual)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.pref_sexual OWNER TO postgres;
-- ddl-end --

-- object: muint.municipios | type: TABLE --
-- DROP TABLE muint.municipios;
CREATE TABLE muint.municipios(
	id_estado integer NOT NULL,
	municipio varchar NOT NULL,
	id_municipio integer NOT NULL,
	CONSTRAINT id_municipio_pk PRIMARY KEY (id_municipio)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
COMMENT ON COLUMN muint.municipios.municipio IS 'Nombre del municipio';
COMMENT ON COLUMN muint.municipios.id_municipio IS 'Identificador del municipio';
ALTER TABLE muint.municipios OWNER TO postgres;
-- ddl-end --

-- object: estados_fk | type: CONSTRAINT --
-- ALTER TABLE muint.municipios DROP CONSTRAINT estados_fk;
ALTER TABLE muint.municipios ADD CONSTRAINT estados_fk FOREIGN KEY (id_estado)
REFERENCES muint.estados (id_estado) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: estado_civil_fk | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT estado_civil_fk;
ALTER TABLE muint.informacion ADD CONSTRAINT estado_civil_fk FOREIGN KEY (id_ec)
REFERENCES muint.estado_civil (id_ec) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: pref_sexual_fk | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT pref_sexual_fk;
ALTER TABLE muint.informacion ADD CONSTRAINT pref_sexual_fk FOREIGN KEY (id_pref_sexual)
REFERENCES muint.pref_sexual (id_pref_sexual) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: escolaridad_fk | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT escolaridad_fk;
ALTER TABLE muint.informacion ADD CONSTRAINT escolaridad_fk FOREIGN KEY (id_escolaridad)
REFERENCES muint.escolaridad (id_escolaridad) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: adicciones_fk | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT adicciones_fk;
ALTER TABLE muint.informacion ADD CONSTRAINT adicciones_fk FOREIGN KEY (id_adicciones)
REFERENCES muint.adicciones (id_adicciones) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: nacionalidad_fk | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT nacionalidad_fk;
ALTER TABLE muint.informacion ADD CONSTRAINT nacionalidad_fk FOREIGN KEY (id_nacionalidad)
REFERENCES muint.nacionalidad (id_nacionalidad) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: municipios_fk | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT municipios_fk;
ALTER TABLE muint.informacion ADD CONSTRAINT municipios_fk FOREIGN KEY (id_municipio)
REFERENCES muint.municipios (id_municipio) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: muint.calles | type: TABLE --
-- DROP TABLE muint.calles;
CREATE TABLE muint.calles(
	id_sector smallint,
	calle varchar(150),
	id_calle integer,
	CONSTRAINT id_calle_pk PRIMARY KEY (id_calle)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.calles OWNER TO postgres;
-- ddl-end --

-- object: sector_fk | type: CONSTRAINT --
-- ALTER TABLE muint.calles DROP CONSTRAINT sector_fk;
ALTER TABLE muint.calles ADD CONSTRAINT sector_fk FOREIGN KEY (id_sector)
REFERENCES muint.sector (id_sector) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: calles_fk | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT calles_fk;
ALTER TABLE muint.informacion ADD CONSTRAINT calles_fk FOREIGN KEY (id_calle)
REFERENCES muint.calles (id_calle) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: muint.motivo | type: TABLE --
-- DROP TABLE muint.motivo;
CREATE TABLE muint.motivo(
	id_motivo integer,
	id_unidad integer,
	fecha date,
	hora time,
	motivo varchar(100) NOT NULL,
	CONSTRAINT id_motivo_pk PRIMARY KEY (id_motivo)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.motivo OWNER TO postgres;
-- ddl-end --

-- object: muint.geo | type: TABLE --
-- DROP TABLE muint.geo;
CREATE TABLE muint.geo(
	id_geo integer NOT NULL,
	longitud double precision NOT NULL,
	latitud double precision NOT NULL,
	CONSTRAINT id_geo_pk PRIMARY KEY (id_geo)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.geo OWNER TO postgres;
-- ddl-end --

-- object: muint.aprehension | type: TABLE --
-- DROP TABLE muint.aprehension;
CREATE TABLE muint.aprehension(
	id_personas integer,
	id_motivo integer,
	id_geo integer,
	observaciones varchar(500)
)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.aprehension OWNER TO postgres;
-- ddl-end --

-- object: unidad_fk | type: CONSTRAINT --
-- ALTER TABLE muint.motivo DROP CONSTRAINT unidad_fk;
ALTER TABLE muint.motivo ADD CONSTRAINT unidad_fk FOREIGN KEY (id_unidad)
REFERENCES muint.unidad (id_unidad) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: muint.usuario | type: TABLE --
-- DROP TABLE muint.usuario;
CREATE TABLE muint.usuario(
	id_usuario integer NOT NULL,
	id_nivel smallint,
	"password" varchar(50) NOT NULL,
	"user" varchar(50) NOT NULL,
	CONSTRAINT id_usuarios_pk PRIMARY KEY (id_usuario)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.usuario OWNER TO postgres;
-- ddl-end --

-- object: muint.nivel | type: TABLE --
-- DROP TABLE muint.nivel;
CREATE TABLE muint.nivel(
	id_nivel smallint NOT NULL,
	nivel varchar(20) NOT NULL,
	CONSTRAINT id_nivel_pk PRIMARY KEY (id_nivel)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.nivel OWNER TO postgres;
-- ddl-end --

-- object: usuario_fk | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT usuario_fk;
ALTER TABLE muint.informacion ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario)
REFERENCES muint.usuario (id_usuario) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: informacion_uq | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT informacion_uq;
ALTER TABLE muint.informacion ADD CONSTRAINT informacion_uq UNIQUE (id_usuario);
-- ddl-end --


-- object: muint.colores | type: TABLE --
-- DROP TABLE muint.colores;
CREATE TABLE muint.colores(
	id_color integer NOT NULL,
	color varchar(20) NOT NULL,
	CONSTRAINT id_color PRIMARY KEY (id_color)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.colores OWNER TO postgres;
-- ddl-end --

-- object: muint.vehiculo | type: TABLE --
-- DROP TABLE muint.vehiculo;
CREATE TABLE muint.vehiculo(
	id_vehiculo integer NOT NULL,
	serie char(17),
	placas varchar(10),
	id_marca_vehiculo integer,
	id_tipo_vehiculo integer,
	id_personas integer,
	id_motor integer,
	id_color integer,
	CONSTRAINT id_vehiculo_pk PRIMARY KEY (id_vehiculo)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.vehiculo OWNER TO postgres;
-- ddl-end --

-- object: muint.motor | type: TABLE --
-- DROP TABLE muint.motor;
CREATE TABLE muint.motor(
	id_motor integer NOT NULL,
	motor varchar(20) NOT NULL,
	id_modelos_motores smallint,
	CONSTRAINT id_motor_pk PRIMARY KEY (id_motor)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.motor OWNER TO postgres;
-- ddl-end --

-- object: muint.modelos_motores | type: TABLE --
-- DROP TABLE muint.modelos_motores;
CREATE TABLE muint.modelos_motores(
	id_modelos_motores smallint NOT NULL,
	modelos_motores varchar(20) NOT NULL,
	CONSTRAINT id_modelos_motores_pk PRIMARY KEY (id_modelos_motores)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.modelos_motores OWNER TO postgres;
-- ddl-end --

-- object: modelos_motores_fk | type: CONSTRAINT --
-- ALTER TABLE muint.motor DROP CONSTRAINT modelos_motores_fk;
ALTER TABLE muint.motor ADD CONSTRAINT modelos_motores_fk FOREIGN KEY (id_modelos_motores)
REFERENCES muint.modelos_motores (id_modelos_motores) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: muint.tipo_vehiculo | type: TABLE --
-- DROP TABLE muint.tipo_vehiculo;
CREATE TABLE muint.tipo_vehiculo(
	id_tipo_vehiculo integer NOT NULL,
	tipo_vehiculo varchar(20) NOT NULL,
	CONSTRAINT id_tipo_vehiculo_pk PRIMARY KEY (id_tipo_vehiculo)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.tipo_vehiculo OWNER TO postgres;
-- ddl-end --

-- object: muint.marca_vehiculo | type: TABLE --
-- DROP TABLE muint.marca_vehiculo;
CREATE TABLE muint.marca_vehiculo(
	id_marca_vehiculo integer NOT NULL,
	marca_vehiculo varchar(20) NOT NULL,
	id_sub_marca_vehiculo integer,
	CONSTRAINT id_marca_vehiculo_pk PRIMARY KEY (id_marca_vehiculo)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.marca_vehiculo OWNER TO postgres;
-- ddl-end --

-- object: muint.sub_marca_vehiculo | type: TABLE --
-- DROP TABLE muint.sub_marca_vehiculo;
CREATE TABLE muint.sub_marca_vehiculo(
	id_sub_marca_vehiculo integer NOT NULL,
	sub_marca_vehiculo varchar(20) NOT NULL,
	CONSTRAINT id_sub_marca_vehiculo_pk PRIMARY KEY (id_sub_marca_vehiculo)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.sub_marca_vehiculo OWNER TO postgres;
-- ddl-end --

-- object: sub_marca_vehiculo_fk | type: CONSTRAINT --
-- ALTER TABLE muint.marca_vehiculo DROP CONSTRAINT sub_marca_vehiculo_fk;
ALTER TABLE muint.marca_vehiculo ADD CONSTRAINT sub_marca_vehiculo_fk FOREIGN KEY (id_sub_marca_vehiculo)
REFERENCES muint.sub_marca_vehiculo (id_sub_marca_vehiculo) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: marca_vehiculo_fk | type: CONSTRAINT --
-- ALTER TABLE muint.vehiculo DROP CONSTRAINT marca_vehiculo_fk;
ALTER TABLE muint.vehiculo ADD CONSTRAINT marca_vehiculo_fk FOREIGN KEY (id_marca_vehiculo)
REFERENCES muint.marca_vehiculo (id_marca_vehiculo) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: muint.arma | type: TABLE --
-- DROP TABLE muint.arma;
CREATE TABLE muint.arma(
	id_arma integer NOT NULL,
	tipo_arma bool,
	CONSTRAINT id_arma_pk PRIMARY KEY (id_arma)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
COMMENT ON COLUMN muint.arma.tipo_arma IS '1.-Corta / 2.-Larga / NULL - No posee arma';
ALTER TABLE muint.arma OWNER TO postgres;
-- ddl-end --

-- object: muint.tatuajes | type: TABLE --
-- DROP TABLE muint.tatuajes;
CREATE TABLE muint.tatuajes(
	id_tatuaje integer NOT NULL,
	tatuaje varchar(30) NOT NULL,
	id_cuerpo smallint,
	id_lado smallint,
	CONSTRAINT id_tatuaje_pk PRIMARY KEY (id_tatuaje)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
COMMENT ON COLUMN muint.tatuajes.tatuaje IS 'Descripción del tatuaje';
ALTER TABLE muint.tatuajes OWNER TO postgres;
-- ddl-end --

-- object: muint.lado | type: TABLE --
-- DROP TABLE muint.lado;
CREATE TABLE muint.lado(
	id_lado smallint NOT NULL,
	lado varchar(15),
	CONSTRAINT id_lado_pk PRIMARY KEY (id_lado)

)
TABLESPACE pg_default;
-- ddl-end --
COMMENT ON COLUMN muint.lado.lado IS 'izquierda, derecha, centro';
ALTER TABLE muint.lado OWNER TO postgres;
-- ddl-end --

-- object: muint.cuerpo | type: TABLE --
-- DROP TABLE muint.cuerpo;
CREATE TABLE muint.cuerpo(
	id_cuerpo smallint NOT NULL,
	cuerpo varchar(10) NOT NULL,
	CONSTRAINT id_cuerpo_pk PRIMARY KEY (id_cuerpo)

)
TABLESPACE pg_default;
-- ddl-end --
COMMENT ON TABLE muint.cuerpo IS 'Catalogo de las partes del cuerpo ej. brazo, pierna, pecho, torso, etc';
COMMENT ON COLUMN muint.cuerpo.cuerpo IS 'brazo, pierna, etc';
ALTER TABLE muint.cuerpo OWNER TO postgres;
-- ddl-end --

-- object: muint.oxxo | type: TABLE --
-- DROP TABLE muint.oxxo;
CREATE TABLE muint.oxxo(
	id_oxxo integer NOT NULL,
	oxxo varchar(100) NOT NULL,
	total_robos integer NOT NULL,
	CONSTRAINT id_oxxo_pk PRIMARY KEY (id_oxxo)

)
TABLESPACE pg_default;
-- ddl-end --
COMMENT ON COLUMN muint.oxxo.oxxo IS 'nomre del oxxo';
COMMENT ON COLUMN muint.oxxo.total_robos IS 'cantidad de veces que fue asaltado el establecimiento';
ALTER TABLE muint.oxxo OWNER TO postgres;
-- ddl-end --

-- object: muint.registro_detenciones | type: TABLE --
-- DROP TABLE muint.registro_detenciones;
CREATE TABLE muint.registro_detenciones(
	id_registro integer NOT NULL,
	registro_propiedad varchar NOT NULL,
	id_arma integer,
	CONSTRAINT id_registro_pk PRIMARY KEY (id_registro)

)
TABLESPACE pg_default;
-- ddl-end --
COMMENT ON TABLE muint.registro_detenciones IS 'propiedad del detenido';
ALTER TABLE muint.registro_detenciones OWNER TO postgres;
-- ddl-end --

-- object: muint.discapacidades | type: TABLE --
-- DROP TABLE muint.discapacidades;
CREATE TABLE muint.discapacidades(
	id_discapacidades smallint NOT NULL,
	discapacidad varchar(30) NOT NULL,
	id_personas integer,
	CONSTRAINT id_discapacidad_pk PRIMARY KEY (id_discapacidades)

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.discapacidades OWNER TO postgres;
-- ddl-end --

-- object: muint.robo | type: TABLE --
-- DROP TABLE muint.robo;
CREATE TABLE muint.robo(
	id_robo integer NOT NULL,
	caracteristicas varchar(100) NOT NULL,
	fecha timestamp,
	id_oxxo integer,
	id_registro integer,
	id_personas integer,
	CONSTRAINT id_robo_pk PRIMARY KEY (id_robo)

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.robo OWNER TO postgres;
-- ddl-end --

-- object: tatuajes_fk | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT tatuajes_fk;
ALTER TABLE muint.informacion ADD CONSTRAINT tatuajes_fk FOREIGN KEY (id_tatuaje)
REFERENCES muint.tatuajes (id_tatuaje) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: informacion_uq1 | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT informacion_uq1;
ALTER TABLE muint.informacion ADD CONSTRAINT informacion_uq1 UNIQUE (id_tatuaje);
-- ddl-end --


-- object: tipo_vehiculo_fk | type: CONSTRAINT --
-- ALTER TABLE muint.vehiculo DROP CONSTRAINT tipo_vehiculo_fk;
ALTER TABLE muint.vehiculo ADD CONSTRAINT tipo_vehiculo_fk FOREIGN KEY (id_tipo_vehiculo)
REFERENCES muint.tipo_vehiculo (id_tipo_vehiculo) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: oxxo_fk | type: CONSTRAINT --
-- ALTER TABLE muint.robo DROP CONSTRAINT oxxo_fk;
ALTER TABLE muint.robo ADD CONSTRAINT oxxo_fk FOREIGN KEY (id_oxxo)
REFERENCES muint.oxxo (id_oxxo) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: muint.personas | type: TABLE --
-- DROP TABLE muint.personas;
CREATE TABLE muint.personas(
	id_personas integer NOT NULL,
	nombre varchar(30),
	ap varchar(20),
	am varchar(20),
	fec_nac date,
	peso float,
	ocupacion varchar(50),
	genero char,
	cp integer,
	num_ext integer,
	num_int integer,
	CONSTRAINT id_personas_pk PRIMARY KEY (id_personas)

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.personas OWNER TO postgres;
-- ddl-end --

-- object: arma_fk | type: CONSTRAINT --
-- ALTER TABLE muint.registro_detenciones DROP CONSTRAINT arma_fk;
ALTER TABLE muint.registro_detenciones ADD CONSTRAINT arma_fk FOREIGN KEY (id_arma)
REFERENCES muint.arma (id_arma) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: registro_detenciones_fk | type: CONSTRAINT --
-- ALTER TABLE muint.robo DROP CONSTRAINT registro_detenciones_fk;
ALTER TABLE muint.robo ADD CONSTRAINT registro_detenciones_fk FOREIGN KEY (id_registro)
REFERENCES muint.registro_detenciones (id_registro) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: muint.fotos | type: TABLE --
-- DROP TABLE muint.fotos;
CREATE TABLE muint.fotos(
	id_foto integer NOT NULL,
	foto integer NOT NULL,
	CONSTRAINT id_foto_pk PRIMARY KEY (id_foto)
	WITH (FILLFACTOR = 10)
	USING INDEX TABLESPACE pg_default

)
TABLESPACE pg_default;
-- ddl-end --
ALTER TABLE muint.fotos OWNER TO postgres;
-- ddl-end --

-- object: fotos_fk | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT fotos_fk;
ALTER TABLE muint.informacion ADD CONSTRAINT fotos_fk FOREIGN KEY (id_foto)
REFERENCES muint.fotos (id_foto) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: nivel_fk | type: CONSTRAINT --
-- ALTER TABLE muint.usuario DROP CONSTRAINT nivel_fk;
ALTER TABLE muint.usuario ADD CONSTRAINT nivel_fk FOREIGN KEY (id_nivel)
REFERENCES muint.nivel (id_nivel) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: cuerpo_fk | type: CONSTRAINT --
-- ALTER TABLE muint.tatuajes DROP CONSTRAINT cuerpo_fk;
ALTER TABLE muint.tatuajes ADD CONSTRAINT cuerpo_fk FOREIGN KEY (id_cuerpo)
REFERENCES muint.cuerpo (id_cuerpo) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: lado_fk | type: CONSTRAINT --
-- ALTER TABLE muint.tatuajes DROP CONSTRAINT lado_fk;
ALTER TABLE muint.tatuajes ADD CONSTRAINT lado_fk FOREIGN KEY (id_lado)
REFERENCES muint.lado (id_lado) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: geo_fk | type: CONSTRAINT --
-- ALTER TABLE muint.aprehension DROP CONSTRAINT geo_fk;
ALTER TABLE muint.aprehension ADD CONSTRAINT geo_fk FOREIGN KEY (id_geo)
REFERENCES muint.geo (id_geo) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: motivo_fk | type: CONSTRAINT --
-- ALTER TABLE muint.aprehension DROP CONSTRAINT motivo_fk;
ALTER TABLE muint.aprehension ADD CONSTRAINT motivo_fk FOREIGN KEY (id_motivo)
REFERENCES muint.motivo (id_motivo) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: personas_fk | type: CONSTRAINT --
-- ALTER TABLE muint.informacion DROP CONSTRAINT personas_fk;
ALTER TABLE muint.informacion ADD CONSTRAINT personas_fk FOREIGN KEY (id_personas)
REFERENCES muint.personas (id_personas) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --


-- object: informacion_fk | type: CONSTRAINT --
-- ALTER TABLE muint.discapacidades DROP CONSTRAINT informacion_fk;
ALTER TABLE muint.discapacidades ADD CONSTRAINT informacion_fk FOREIGN KEY (id_personas)
REFERENCES muint.informacion (id_personas) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: informacion_fk | type: CONSTRAINT --
-- ALTER TABLE muint.vehiculo DROP CONSTRAINT informacion_fk;
ALTER TABLE muint.vehiculo ADD CONSTRAINT informacion_fk FOREIGN KEY (id_personas)
REFERENCES muint.informacion (id_personas) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: informacion_fk | type: CONSTRAINT --
-- ALTER TABLE muint.aprehension DROP CONSTRAINT informacion_fk;
ALTER TABLE muint.aprehension ADD CONSTRAINT informacion_fk FOREIGN KEY (id_personas)
REFERENCES muint.informacion (id_personas) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: informacion_fk | type: CONSTRAINT --
-- ALTER TABLE muint.robo DROP CONSTRAINT informacion_fk;
ALTER TABLE muint.robo ADD CONSTRAINT informacion_fk FOREIGN KEY (id_personas)
REFERENCES muint.informacion (id_personas) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: motor_fk | type: CONSTRAINT --
-- ALTER TABLE muint.vehiculo DROP CONSTRAINT motor_fk;
ALTER TABLE muint.vehiculo ADD CONSTRAINT motor_fk FOREIGN KEY (id_motor)
REFERENCES muint.motor (id_motor) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: colores_fk | type: CONSTRAINT --
-- ALTER TABLE muint.vehiculo DROP CONSTRAINT colores_fk;
ALTER TABLE muint.vehiculo ADD CONSTRAINT colores_fk FOREIGN KEY (id_color)
REFERENCES muint.colores (id_color) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --