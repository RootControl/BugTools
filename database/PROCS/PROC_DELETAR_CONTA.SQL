DROP PROCEDURE IF EXISTS deletar_conta;

DELIMITER $$

CREATE PROCEDURE deletar_conta
	(IN in_cod_login_atual int)
	BEGIN

	    UPDATE pessoa
		SET deletado = TRUE WHERE cod_pessoa = in_cod_login_atual;

		
	END$$
		
DELIMITER ;