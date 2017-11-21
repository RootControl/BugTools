DROP PROCEDURE IF EXISTS alter_email;

DELIMITER $$

CREATE PROCEDURE alter_email
	(IN in_cod_pessoa_atual int				,
		IN in_email_antiga VARCHAR (100)	,
		IN in_email_novo VARCHAR (100)	
	)
		BEGIN
		 
		DECLARE var_email_antiga VARCHAR (100);
		 
		SELECT 
			p.email
		INTO var_email_antiga FROM
			pessoa p
		WHERE
			p.cod_pessoa = in_cod_pessoa_atual;
		

		UPDATE pessoa 
		SET 
			email = in_email_novo
		WHERE
			var_email_antiga = in_email_antiga
				AND cod_pessoa = in_cod_pessoa_atual;

		
	END$$
		
DELIMITER ;