
-- Table: par_tipo_error

-- DROP TABLE par_tipo_error;

CREATE TABLE public.par_tipo_error(
  idtipo_error serial NOT NULL PRIMARY KEY,
  descripcion character varying
);

-- Index: idx_tipo_error_descripcion

-- DROP INDEX idx_tipo_error_descripcion;

CREATE UNIQUE INDEX idx_tipo_error_descripcion
  ON public.par_tipo_error
  USING btree (descripcion);

INSERT INTO public.par_tipo_error (idtipo_error, descripcion) VALUES (1, 'info');
INSERT INTO public.par_tipo_error (idtipo_error, descripcion) VALUES (2, 'error');

-- Table: par_error

-- DROP TABLE par_error;

CREATE TABLE public.par_error(
  id_error serial NOT NULL,
  cod_error character varying(50),
  descripcion character varying(100),
  idtipo_error integer NOT NULL
    REFERENCES public.par_tipo_error(idtipo_error),
  b_mostrarmensajeerror BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT par_error_pkey PRIMARY KEY (id_error)
);

-- Index: idx_error_cod_error

-- DROP INDEX idx_error_cod_error;

CREATE UNIQUE INDEX idx_error_cod_error
  ON public.par_error
  USING btree (cod_error);

-- Index: idx_error_descripcion

-- DROP INDEX idx_error_descripcion;

CREATE UNIQUE INDEX idx_error_descripcion
  ON public.par_error
  USING btree (descripcion);

INSERT INTO public.par_error (id_error, cod_error, descripcion, idtipo_error, b_mostrarmensajeerror) VALUES (1, 'db_23505', 'ya existe', 2, FALSE);
INSERT INTO public.par_error (id_error, cod_error, descripcion, idtipo_error, b_mostrarmensajeerror) VALUES (2, 'db_23503', 'no se puede eliminar porque esta siendo referenciada/o', 2, FALSE);
INSERT INTO public.par_error (id_error, cod_error, descripcion, idtipo_error, b_mostrarmensajeerror) VALUES (3, 'db_22001', 'el texto es demasiado largo', 2, FALSE);
INSERT INTO public.par_error (id_error, cod_error, descripcion, idtipo_error, b_mostrarmensajeerror) VALUES (4, 'db_23502', 'no tiene cargado algún campo obligatorio', 2, FALSE);
INSERT INTO public.par_error (id_error, cod_error, descripcion, idtipo_error, b_mostrarmensajeerror) VALUES (5, 'db_P0001', 'Los cambios rompen alguna/s regla/s de negocio', 2, FALSE);
