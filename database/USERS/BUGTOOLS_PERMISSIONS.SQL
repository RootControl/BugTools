-- USERS & PERMISSIONS

DROP USER IF EXISTS 'aluno'@'localhost';
CREATE USER 'aluno'@'localhost';

GRANT SELECT, UPDATE (nome, email)
ON projeto.pessoa TO 'aluno'@'localhost';
GRANT SELECT (id_pessoa)
ON projeto.pessoa TO 'aluno'@'localhost';
GRANT INSERT, SELECT (descricao)
ON projeto.problema TO 'aluno'@'localhost';
GRANT SELECT (cod_problema, cod_tipo, cod_pc, data_abertura)
ON projeto.problema TO 'aluno'@'localhost';
GRANT SELECT (id_pc, cod_sala)
ON projeto.pc TO 'aluno'@'localhost';



DROP USER IF EXISTS 'professor'@'localhost';
CREATE USER 'professor'@'localhost';

GRANT SELECT, UPDATE (nome, email)
ON projeto.pessoa TO 'professor'@'localhost';
GRANT SELECT (id_pessoa)
ON projeto.pessoa TO 'professor'@'localhost';
GRANT INSERT, SELECT (descricao)
ON projeto.problema TO 'professor'@'localhost';
GRANT SELECT (cod_problema, cod_tipo, cod_pc, data_abertura)
ON projeto.problema TO 'professor'@'localhost';
GRANT SELECT (id_pc, cod_sala)
ON projeto.pc TO 'aluno'@'localhost';



DROP USER IF EXISTS 'suporte'@'localhost';
CREATE USER 'suporte'@'localhost';

GRANT SELECT, UPDATE (nome, email)
ON projeto.pessoa TO 'suporte'@'localhost';
GRANT SELECT, UPDATE, INSERT (tipo)
ON projeto.tipo TO 'suporte'@'localhost';
GRANT SELECT, UPDATE, INSERT (num_sala)
ON projeto.sala TO 'suporte'@'localhost';
GRANT SELECT (cod_problema, cod_tipo, cod_pc, data_abertura)
ON projeto.problema TO 'suporte'@'localhost';
GRANT SELECT (tipo)
ON projeto.statuspc TO 'suporte'@'localhost';
GRANT SELECT, INSERT, UPDATE (id_pc, cod_sala, cod_status)
ON projeto.pc TO 'suporte'@'localhost';
GRANT SELECT (data_fechamento)
ON projeto.resolvidos TO 'suporte'@'localhost';