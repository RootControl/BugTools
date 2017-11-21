DROP PROCEDURE IF EXISTS maquinas_sala;

DELIMITER $$

CREATE PROCEDURE maquinas_sala(in in_sala int)
BEGIN

	SELECT 
		p.cod_problema 'Numero Pedido',
		pc.id_pc 'Identificação Maquina',
		DATE_FORMAT(r.data_fechamento, '%d/%m/%y') 'Data de Fechamento',
		p2.nome 'Suporte',
		s.num_sala
	FROM
		resolvidos r,
		pessoa p2,
		problema p,
		pc pc,
		sala s
	WHERE
		r.cod_resolvidos = p.cod_problema
			AND p2.cod_pessoa = r.cod_suporte
			AND p.cod_problema = r.cod_problema
			AND pc.cod_pc = p.cod_pc
			AND s.cod_sala = pc.cod_sala
			AND s.num_sala = in_sala;

END $$

DELIMITER ;