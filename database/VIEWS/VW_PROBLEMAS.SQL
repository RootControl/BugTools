use projeto;

CREATE VIEW problemas AS
    SELECT 
        s.num_sala AS 'Número da Sala',
        pc.id_pc AS 'Identificação Máquina',
        t.tipo AS 'Tipo',
        pro.descricao AS 'Descrição',
        pe.nome AS 'Nome',
        pe.id_pessoa AS 'RA',
        pe.email AS 'E-mail'
    FROM
        sala s,
        pc pc,
        tipo t,
        problema pro,
        pessoa pe,
        resolvidos r
    WHERE
        pro.cod_pc = pc.cod_pc
            AND pc.cod_sala = s.cod_sala
            AND t.cod_tipo = pro.cod_tipo
            AND r.cod_pessoa = pe.cod_pessoa
            AND r.cod_problema = pro.cod_problema;
