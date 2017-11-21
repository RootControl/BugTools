USE projeto;

select "USE projeto" as '-- USE DATABASE projeto';

select "DELETE FROM resolvidos;" as '-- DELETE RECORDS FROM resolvidos';

select CONCAT("INSERT INTO resolvidos VALUES ('",
			  cod_resolvidos, "','",
			  data_fechamento, "','",
			  cod_pessoa, "','",
			  cod_problema, "','",
			  cod_suporte, "');") as '-- INSERT INTO resolvidos' FROM resolvidos;