Create table person (
	id serial,
	name VARCHAR(64) NOT NULL,
	phone VARCHAR(16),
	email VARCHAR(64),
	text_desc TEXT,
	photo VARCHAR(256),
	CONSTRAINT person_id_pkey PRIMARY KEY (id)
);

Create table expert (
	id integer,
	area_of_expertice VARCHAR(64),
	title VARCHAR(64),
	CONSTRAINT person_id_fkey FOREIGN KEY (id) REFERENCES person (id) on delete cascade 
);

Create table legislator (
	id integer,
	party VARCHAR(64),
	district_num integer,
	day_elected date,
	sname VARCHAR(64),
	CONSTRAINT legislator_id_fkey FOREIGN KEY (id) REFERENCES person (id) on delete cascade,
	CONSTRAINT state_name_fkey FOREIGN KEY (sname) REFERENCES state (name) on delete restrict
);

Create table affiliation (
	name VARCHAR(256),
	phone VARCHAR(16),
	street VARCHAR(64),
	city VARCHAR(64),
	state VARCHAR(64),
	zipcode CHAR(5),
	CONSTRAINT affiliation_name_pkey PRIMARY KEY (name)
);

Create table member_of (
	id integer,
	aname VARCHAR(256),
	CONSTRAINT person_id_pkey FOREIGN KEY (id) REFERENCES person (id) on delete restrict,
	CONSTRAINT affiliation_name_fkey FOREIGN KEY (aname) REFERENCES affiliation (name) on delete restrict
);
