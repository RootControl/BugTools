USE projeto;

DROP TABLE IF EXISTS problema;

CREATE TABLE problema ( -- OK

cod_problema INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_tipo INT NOT NULL,
descricao VARCHAR (1000) NOT NULL,
cod_pc INT NOT NULL,
data_abertura date,
cod_pessoa INT NOT NULL,
FOREIGN KEY (cod_pc) REFERENCES pc(cod_pc) ON UPDATE CASCADE,
FOREIGN KEY (cod_tipo) REFERENCES tipo(cod_tipo) ON UPDATE CASCADE,
FOREIGN KEY (cod_pessoa) REFERENCES pessoa(cod_pessoa) ON UPDATE CASCADE
);