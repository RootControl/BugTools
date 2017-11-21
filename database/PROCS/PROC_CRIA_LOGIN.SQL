DROP PROCEDURE IF EXISTS cria_login;

DELIMITER $$

CREATE PROCEDURE cria_login
	(IN in_login VARCHAR (20)		,
     IN in_senha VARCHAR (20)		,
     IN in_nome VARCHAR (25)		,
     IN in_sobrenome VARCHAR (50)	,
     IN in_ra VARCHAR (20)			,
     IN in_email VARCHAR	(100)	,
     IN in_usuario VARCHAR (25)
     )
     BEGIN
				
	 INSERT INTO pessoa (cod_suporte, nome, sobrenome, id_pessoa, email, login, senha, deletado, usuario) VALUES
						(FALSE, in_nome, in_sobrenome, in_ra, in_email, in_login, in_senha, FALSE, in_usuario);
	
    END$$
	
DELIMITER ;