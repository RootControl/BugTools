USE projeto;

select "USE projeto" as '-- USE DATABASE projeto';

select "DELETE FROM tipo;" as '-- DELETE RECORDS FROM tipo';

select CONCAT("INSERT INTO tipo VALUES ('",
			  cod_tipo, "','",
			  tipo, "');") as '-- INSERT INTO tipo' FROM tipo;