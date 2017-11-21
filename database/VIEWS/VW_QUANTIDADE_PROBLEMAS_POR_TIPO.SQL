USE projeto;

CREATE VIEW quantidade_problemas_por_tipo AS
    SELECT 
        COUNT(pr.cod_problema) AS 'Quantidade', tp.tipo AS 'Tipo'
    FROM
        tipo tp
            NATURAL JOIN
        problema pr
    GROUP BY tp.cod_tipo;