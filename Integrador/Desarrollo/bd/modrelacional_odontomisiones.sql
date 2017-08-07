
CREATE SEQUENCE public.par_nivelesurgencias_id_nivelurgencia_seq;

CREATE TABLE public.par_nivelesurgencias (
                id_nivelurgencia VARCHAR NOT NULL DEFAULT nextval('public.par_nivelesurgencias_id_nivelurgencia_seq'),
                nombre VARCHAR NOT NULL,
                CONSTRAINT par_nivelesurgencias_pk PRIMARY KEY (id_nivelurgencia)
);


ALTER SEQUENCE public.par_nivelesurgencias_id_nivelurgencia_seq OWNED BY public.par_nivelesurgencias.id_nivelurgencia;

CREATE SEQUENCE public.par_tipostelefonos_id_tipotelefono_seq;

CREATE TABLE public.par_tipostelefonos (
                id_tipotelefono INTEGER NOT NULL DEFAULT nextval('public.par_tipostelefonos_id_tipotelefono_seq'),
                nombre VARCHAR NOT NULL,
                CONSTRAINT par_tipostelefonos_pk PRIMARY KEY (id_tipotelefono)
);


ALTER SEQUENCE public.par_tipostelefonos_id_tipotelefono_seq OWNED BY public.par_tipostelefonos.id_tipotelefono;

CREATE SEQUENCE public.par_disponibilidadescredicticias_id_disponibilidadcredictici90;

CREATE TABLE public.par_disponibilidadescredicticias (
                id_disponibilidadcredicticia INTEGER NOT NULL DEFAULT nextval('public.par_disponibilidadescredicticias_id_disponibilidadcredictici90'),
                nombre VARCHAR NOT NULL,
                b_permitefiar BOOLEAN NOT NULL,
                CONSTRAINT par_disponibilidadescredicticias_pk PRIMARY KEY (id_disponibilidadcredicticia)
);


ALTER SEQUENCE public.par_disponibilidadescredicticias_id_disponibilidadcredictici90 OWNED BY public.par_disponibilidadescredicticias.id_disponibilidadcredicticia;

CREATE SEQUENCE public.par_estadosequipos_id_estadoequipo_seq;

CREATE TABLE public.par_estadosequipos (
                id_estadoequipo INTEGER NOT NULL DEFAULT nextval('public.par_estadosequipos_id_estadoequipo_seq'),
                nombre VARCHAR NOT NULL,
                descripcion VARCHAR NOT NULL,
                CONSTRAINT par_estadosequipos_pk PRIMARY KEY (id_estadoequipo)
);


ALTER SEQUENCE public.par_estadosequipos_id_estadoequipo_seq OWNED BY public.par_estadosequipos.id_estadoequipo;

CREATE SEQUENCE public.par_tiposincidencias_id_tipoincidencia_seq;

CREATE TABLE public.par_tiposincidencias (
                id_tipoincidencia INTEGER NOT NULL DEFAULT nextval('public.par_tiposincidencias_id_tipoincidencia_seq'),
                nombre VARCHAR NOT NULL,
                CONSTRAINT par_tiposincidencias_pk PRIMARY KEY (id_tipoincidencia)
);


ALTER SEQUENCE public.par_tiposincidencias_id_tipoincidencia_seq OWNED BY public.par_tiposincidencias.id_tipoincidencia;

CREATE SEQUENCE public.par_estadosincidencias_id_estadoincidencia_seq;

CREATE TABLE public.par_estadosincidencias (
                id_estadoincidencia INTEGER NOT NULL DEFAULT nextval('public.par_estadosincidencias_id_estadoincidencia_seq'),
                nombre VARCHAR NOT NULL,
                descripcion VARCHAR NOT NULL,
                CONSTRAINT par_estadosincidencias_pk PRIMARY KEY (id_estadoincidencia)
);


ALTER SEQUENCE public.par_estadosincidencias_id_estadoincidencia_seq OWNED BY public.par_estadosincidencias.id_estadoincidencia;

CREATE SEQUENCE public.par_tiposdocumentos_id_tipodocumento_seq;

CREATE TABLE public.par_tiposdocumentos (
                id_tipodocumento INTEGER NOT NULL DEFAULT nextval('public.par_tiposdocumentos_id_tipodocumento_seq'),
                sigla VARCHAR NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT par_tiposdocumentos_pk PRIMARY KEY (id_tipodocumento)
);


ALTER SEQUENCE public.par_tiposdocumentos_id_tipodocumento_seq OWNED BY public.par_tiposdocumentos.id_tipodocumento;

CREATE SEQUENCE public.par_marcas_id_marca_seq;

CREATE TABLE public.par_marcas (
                id_marca INTEGER NOT NULL DEFAULT nextval('public.par_marcas_id_marca_seq'),
                nombre VARCHAR NOT NULL,
                CONSTRAINT par_marcas_pk PRIMARY KEY (id_marca)
);


ALTER SEQUENCE public.par_marcas_id_marca_seq OWNED BY public.par_marcas.id_marca;

CREATE SEQUENCE public.par_modelos_id_modelo_seq;

CREATE TABLE public.par_modelos (
                id_modelo INTEGER NOT NULL DEFAULT nextval('public.par_modelos_id_modelo_seq'),
                nombre VARCHAR NOT NULL,
                id_marca INTEGER NOT NULL,
                CONSTRAINT par_modelos_pk PRIMARY KEY (id_modelo)
);


ALTER SEQUENCE public.par_modelos_id_modelo_seq OWNED BY public.par_modelos.id_modelo;

CREATE UNIQUE INDEX par_modelos_idx
 ON public.par_modelos
 ( nombre, id_marca );

CREATE SEQUENCE public.par_paises_id_pais_seq;

CREATE TABLE public.par_paises (
                id_pais INTEGER NOT NULL DEFAULT nextval('public.par_paises_id_pais_seq'),
                nombre VARCHAR NOT NULL,
                CONSTRAINT par_paises_pk PRIMARY KEY (id_pais)
);


ALTER SEQUENCE public.par_paises_id_pais_seq OWNED BY public.par_paises.id_pais;

CREATE UNIQUE INDEX par_paises_idx
 ON public.par_paises
 ( nombre );

CREATE SEQUENCE public.par_provincias_id_provincia_seq;

CREATE TABLE public.par_provincias (
                id_provincia INTEGER NOT NULL DEFAULT nextval('public.par_provincias_id_provincia_seq'),
                nombre VARCHAR NOT NULL,
                id_pais INTEGER NOT NULL,
                CONSTRAINT par_provincias_pk PRIMARY KEY (id_provincia)
);


ALTER SEQUENCE public.par_provincias_id_provincia_seq OWNED BY public.par_provincias.id_provincia;

CREATE SEQUENCE public.par_localidades_id_localidad_seq;

CREATE TABLE public.par_localidades (
                id_localidad INTEGER NOT NULL DEFAULT nextval('public.par_localidades_id_localidad_seq'),
                nombre VARCHAR NOT NULL,
                CP VARCHAR NOT NULL,
                id_provincia INTEGER NOT NULL,
                CONSTRAINT par_localidades_pk PRIMARY KEY (id_localidad)
);


ALTER SEQUENCE public.par_localidades_id_localidad_seq OWNED BY public.par_localidades.id_localidad;

ALTER TABLE public.par_modelos ADD CONSTRAINT par_marcas_par_modelos_fk
FOREIGN KEY (id_marca)
REFERENCES public.par_marcas (id_marca)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.par_provincias ADD CONSTRAINT par_paises_par_provincias_fk
FOREIGN KEY (id_pais)
REFERENCES public.par_paises (id_pais)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.par_localidades ADD CONSTRAINT par_provincias_par_localidades_fk
FOREIGN KEY (id_provincia)
REFERENCES public.par_provincias (id_provincia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
