DROP PROCEDURE IF EXISTS insere_problema;

DELIMITER $$

CREATE PROCEDURE insere_problema
	(IN in_cod_tipo INT (11)		,
     IN in_descricao VARCHAR (1000) ,
     IN in_cod_pc INT (11)			
     )
BEGIN
    
	DECLARE in_data_abertura date;
    SELECT CURDATE() INTO in_data_abertura;
    
    INSERT INTO problema (cod_tipo, descricao, cod_pc, data_abertura) VALUES
						 (in_cod_tipo, in_descricao, in_cod_pc, in_data_abertura);
	
END$$
	
DELIMITER ;