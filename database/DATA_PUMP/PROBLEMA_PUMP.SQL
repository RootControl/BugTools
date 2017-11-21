USE projeto;

select "USE projeto" as '-- USE DATABASE projeto';

select "DELETE FROM problema;" as '-- DELETE RECORDS FROM problema';

select CONCAT("INSERT INTO problema VALUES ('",
			  cod_problema, "','",
			  cod_tipo, "','",
			  descricao, "','",
			  cod_pc, "','",
			  data_abertura, "','",
			  cod_pessoa, "');") as '-- INSERT INTO problema' FROM problema;