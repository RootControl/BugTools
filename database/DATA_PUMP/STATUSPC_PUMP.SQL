USE projeto;

select "USE projeto" as '-- USE DATABASE projeto';

select "DELETE FROM statuspc;" as '-- DELETE RECORDS FROM statuspc';

select CONCAT("INSERT INTO statuspc VALUES ('",
			  cod_status, "','",
			  tipo, "');") as '-- INSERT INTO statuspc' FROM statuspc;