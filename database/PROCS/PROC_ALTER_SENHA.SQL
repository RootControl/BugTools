DROP PROCEDURE IF EXISTS alter_senha;

DELIMITER $$

CREATE PROCEDURE alter_senha
	(IN in_cod_pessoa_atual int				,
	IN in_senha_antiga VARCHAR (20)		,
	IN in_senha_nova VARCHAR (20)	
	)
	BEGIN
	
	DECLARE var_senha_antiga VARCHAR (20);
     
	SELECT 
		p.senha
	INTO var_senha_antiga FROM
		pessoa p
	WHERE
		p.cod_pessoa = in_cod_pessoa_atual;
     

	UPDATE pessoa 
	SET 
		senha = in_senha_nova
	WHERE
		var_senha_antiga = in_senha_antiga
			AND cod_pessoa = in_cod_pessoa_atual;

	
    END$$
	
DELIMITER ;