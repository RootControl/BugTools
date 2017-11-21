USE projeto;

CREATE VIEW quantidade_problema_por_sala AS
    SELECT 
        COUNT(pr.cod_problema) AS 'Quantidade',
        sl.num_sala AS 'Sala'
    FROM
        sala sl
            NATURAL JOIN
        pc
            NATURAL JOIN
        problema pr
    GROUP BY sl.cod_sala;