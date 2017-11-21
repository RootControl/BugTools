USE projeto;

select "USE projeto" as '-- USE DATABASE projeto';

select "DELETE FROM pc;" as '-- DELETE RECORDS FROM pc';

select CONCAT("INSERT INTO pc VALUES ('",
			  cod_pc, "','",
			  id_pc, "','",
			  cod_sala, "','",
			  cod_status, "');") as '-- INSERT INTO pc' FROM pc;