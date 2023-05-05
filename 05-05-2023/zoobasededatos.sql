
CREATE SEQUENCE id_zoo_s;
CREATE TABLE IF NOT EXISTS zoo
(
    id_zoo int default nextval ('id_zoo_s'),
    nombre character varying NOT NULL,
	ciudad character varying NOT NULL,
	pais character varying NOT NULL,
	tamaño integer,
    CONSTRAINT pk_zoo PRIMARY KEY (id_zoo)
	
);

CREATE SEQUENCE id_especie_s;
CREATE TABLE IF NOT EXISTS especie
(
    id_especie int default nextval ('id_especie_s') NOT NULL,
    nombre_vulgar character varying NOT NULL,
	nombre_cientifico character varying NOT NULL,
	familia character varying NOT NULL,
	estincion boolean,
    CONSTRAINT pk_especie PRIMARY KEY (id_especie)
	
);

CREATE SEQUENCE id_animal_s;
CREATE TABLE IF NOT EXISTS animal 
(
    id_animal int default nextval ('id_animal_s') NOT NULL,
    id_especie integer NOT NULL,
	id_zoo integer NOT NULL,
	sexo char(1), check(sexo in ('H','M')),
	nacimiento date NOT NULL,
	origen character varying NOT NULL,	
    CONSTRAINT pk_animal PRIMARY KEY (id_animal),
	CONSTRAINT fk_especie_animal foreign key (id_especie) REFERENCES especie (id_especie),
	CONSTRAINT fk_zoo_animal foreign key (id_zoo) REFERENCES zoo (id_zoo)	
);


