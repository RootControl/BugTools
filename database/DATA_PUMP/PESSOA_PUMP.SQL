USE projeto;

select "USE projeto;" as '-- SELECT DATABASE';

select "DELETE FROM pessoa;" as '-- DELETE RECORDS FROM pessoa';

select CONCAT("INSERT INTO pessoa VALUES ('", 
			  cod_pessoa, "','",
			  cod_suporte, "','",
			  nome, "','",
			  sobrenome, "','",
			  id_pessoa, "','",
			  login, "','",
			  senha, "','",
			  email, "','",
			  deletado, "','",
			  usuario, "');") as '-- INSERT INTO pessoa' from pessoa;