USE projeto;

select "USE projeto" as '-- USE DATABASE projeto';

select "DELETE FROM sala;" as '-- DELETE RECORDS FROM sala';

select CONCAT("INSERT INTO sala VALUES ('",
			  cod_sala, "','",
			  num_sala, "');") as '-- INSERT INTO sala' FROM sala;