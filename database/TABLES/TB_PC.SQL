USE projeto;

DROP TABLE IF EXISTS pc;

CREATE TABLE pc ( -- OK

cod_pc INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_pc VARCHAR (25) NOT NULL,
cod_sala INT NOT NULL,
cod_status INT NOT NULL,
FOREIGN KEY (cod_status) REFERENCES statuspc(cod_status) ON UPDATE CASCADE,
FOREIGN KEY (cod_sala) REFERENCES sala(cod_sala) ON UPDATE CASCADE 
);