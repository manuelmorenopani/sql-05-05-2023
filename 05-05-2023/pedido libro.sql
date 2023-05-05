

CREATE TABLE IF NOT EXISTS almacen
(
    id_almacen serial ,
    id_provincia integer NOT NULL,
	fecha_apertura date NOT NULL,
	CONSTRAINT pk_almacen PRIMARY KEY (id_almacen)
);

CREATE TABLE IF NOT EXISTS collecion
(
    id_collecion serial ,
   	cantidad int not null,
	CONSTRAINT pk_collecion PRIMARY KEY (id_collecion)
);

CREATE TABLE IF NOT EXISTS provincia
(
    id_provincia serial ,
	id_almacen integer NOT NULL,
	exten int not null,
    CONSTRAINT pk_provincia PRIMARY KEY (id_provincia )

);
CREATE TABLE IF NOT EXISTS poblacion
(
    id_poblacion serial,
	id_provincia integer NOT NULL,
	num_habitantes int not null,
    CONSTRAINT pk_poblacion PRIMARY KEY (id_poblacion )

);
CREATE TABLE IF NOT EXISTS socio
(
    id_socio serial ,
	dni character varying Not NULL, 
    nombre character varying NOT NULL,
	avalista character varying NOT NULL,
	id_poblacion integer NOT NULL,
    CONSTRAINT pk_socio PRIMARY KEY (id_socio)
	
);


CREATE TABLE IF NOT EXISTS pedido
(
    id_pedido serial ,
    id_socio integer NOT NULL,
	forma_de_pago character varying NOT NULL,
	forma_de_envio character varying NOT NULL,
    CONSTRAINT pk_pedido PRIMARY KEY (id_pedido)
	
);

CREATE TABLE IF NOT EXISTS detalle
(
    id_detalle serial ,
    id_pedido integer NOT NULL,
	id_libro integer NOT NULL,
	cantidad int,
    CONSTRAINT pk_detalle PRIMARY KEY (id_detalle )
	

);

CREATE TABLE IF NOT EXISTS libro
(
    id_libro serial ,
    id_collecion integer NOT NULL,
	titulo character varying NOT NULL,
	editorial character varying NOT NULL,
	autor character varying NOT NULL,
    CONSTRAINT pk_libro PRIMARY KEY (id_libro )

);

CREATE TABLE IF NOT EXISTS libro_almacen
(
    id_libro_almacen serial ,
    id_libro integer NOT NULL,
	id_almacen integer NOT NULL,
    CONSTRAINT pk_libro_almacen PRIMARY KEY (id_libro_almacen )
);


ALTER TABLE IF EXISTS public. socio
    ADD CONSTRAINT fk_socio_poblacion FOREIGN KEY (id_poblacion)
    REFERENCES public."poblacion" ("id_poblacion") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
ALTER TABLE IF EXISTS public. pedido
    ADD CONSTRAINT fk_pedido_socio FOREIGN KEY (id_socio)
    REFERENCES public."socio" ("id_socio") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public. detalle
    ADD CONSTRAINT fk_detalle_libro FOREIGN KEY (id_libro)
    REFERENCES public."libro" ("id_libro") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public. detalle
    ADD CONSTRAINT fk_detalle_pedido FOREIGN KEY (id_pedido)
    REFERENCES public."pedido" ("id_pedido") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
ALTER TABLE IF EXISTS public. libro
    ADD CONSTRAINT fk_libro_collecion FOREIGN KEY (id_collecion)
    REFERENCES public."collecion" ("id_collecion") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
ALTER TABLE IF EXISTS public. libro_almacen
    ADD CONSTRAINT fk_libro_almacen_libro FOREIGN KEY (id_libro)
    REFERENCES public."libro" ("id_libro") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
ALTER TABLE IF EXISTS public. libro_almacen
    ADD CONSTRAINT fk_libro_almacen_almacen FOREIGN KEY (id_almacen)
    REFERENCES public."almacen" ("id_almacen") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
ALTER TABLE IF EXISTS public. provincia
    ADD CONSTRAINT fk_provincia_almacen FOREIGN KEY (id_almacen)
    REFERENCES public."almacen" ("id_almacen") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
ALTER TABLE IF EXISTS public. poblacion
    ADD CONSTRAINT fk_poblacion_provincia FOREIGN KEY (id_provincia)
    REFERENCES public."provincia" ("id_provincia") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;














