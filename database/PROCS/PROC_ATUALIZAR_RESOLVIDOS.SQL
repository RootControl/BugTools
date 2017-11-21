DROP PROCEDURE IF EXISTS atualizar_resolvidos;

DELIMITER $$

CREATE PROCEDURE atualizar_resolvidos
	(IN in_cod_problema INT (11)		,
     IN in_cod_suporte INT (11)			,
     IN in_cod_status INT (11)
     )
     BEGIN
    
	DECLARE var_data_fechamento date;
    DECLARE var_cod_pessoa INT;
    
    SELECT 
		pro.cod_pessoa
	INTO var_cod_pessoa FROM
		problema pro
			NATURAL JOIN
		pessoa p
	WHERE
		pro.cod_pessoa = p.cod_pessoa
			AND cod_problema = in_cod_problema;
    
    SELECT CURDATE() INTO var_data_fechamento;
    
    INSERT INTO resolvidos (data_fechamento, cod_pessoa, cod_problema, cod_suporte) VALUES
						 (var_data_fechamento, var_cod_pessoa, in_cod_problema, in_cod_suporte);
	
    UPDATE pc
    SET cod_status = in_cod_status;
    
    END$$
	
DELIMITER ;