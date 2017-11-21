DROP FUNCTION IF EXISTS compare_login;

DELIMITER $$

CREATE FUNCTION compare_login (in_login VARCHAR(20)		,
								   in_senha VARCHAR(20)
                                   )
RETURNS INT
BEGIN
	
    DECLARE out_id_pessoa INT;
	
    IF (SELECT p.cod_pessoa FROM pessoa p WHERE p.login = in_login AND p.senha = in_senha) 
		THEN
		SELECT 
			p.cod_pessoa
		INTO out_id_pessoa FROM
			pessoa p
		WHERE
			p.login = in_login
				AND p.senha = in_senha;
		
		RETURN out_id_pessoa;
		
		ELSE
		RETURN -1;
    END IF;
    
END$$

DELIMITER ; 