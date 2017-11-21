DROP PROCEDURE IF EXISTS cadastrar_maquina;

DELIMITER $$

CREATE PROCEDURE cadastrar_maquina(IN in_id_pc VARCHAR (25)		,
									  IN in_cod_sala INT			,
                                      IN in_cod_status INT 	
                                      )
BEGIN

	INSERT INTO pc (id_pc, cod_sala, cod_status) VALUES
	(in_id_pc, in_cod_sala, in_cod_status);

END $$

DELIMITER ;