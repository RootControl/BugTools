USE projeto;

CREATE VIEW maquinas_arrumadas AS
    SELECT 
        p.cod_problema AS 'Numero Pedido',
        pc.id_pc 'Identificação Maquina',
        DATE_FORMAT(r.data_fechamento, '%d/%m/%y') 'Data de Fechamento',
        p2.nome 'Suporte'
    FROM
        resolvidos r,
        pessoa p2,
        problema p,
        pc
    WHERE
        r.cod_resolvidos = p.cod_problema
            AND p2.cod_pessoa = r.cod_suporte
            AND p.cod_problema = r.cod_problema
            AND pc.cod_pc = p.cod_pc;
            
 