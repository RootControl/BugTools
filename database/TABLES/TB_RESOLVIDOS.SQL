USE projeto;

DROP TABLE IF EXISTS resolvidos;

CREATE TABLE resolvidos ( -- OK

cod_resolvidos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
data_fechamento date,
cod_pessoa INT NOT NULL,
cod_problema INT NOT NULL,
cod_suporte INT NOT NULL ,
FOREIGN KEY (cod_suporte) REFERENCES pessoa(cod_pessoa) ON UPDATE CASCADE,
FOREIGN KEY (cod_problema) REFERENCES problema(cod_problema) ON UPDATE CASCADE,
FOREIGN KEY (cod_pessoa) REFERENCES pessoa(cod_pessoa) ON UPDATE CASCADE
);