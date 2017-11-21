-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: projeto
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `maquinas_arrumadas`
--

DROP DATABASE IF EXISTS projeto;

CREATE DATABASE projeto;

USE projeto;

DROP TABLE IF EXISTS `maquinas_arrumadas`;
/*!50001 DROP VIEW IF EXISTS `maquinas_arrumadas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `maquinas_arrumadas` AS SELECT 
 1 AS `Numero Pedido`,
 1 AS `Identificação Maquina`,
 1 AS `Data de Fechamento`,
 1 AS `Suporte`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pc`
--

DROP TABLE IF EXISTS `pc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc` (
  `cod_pc` int(11) NOT NULL AUTO_INCREMENT,
  `id_pc` varchar(25) NOT NULL,
  `cod_sala` int(11) NOT NULL,
  `cod_status` int(11) NOT NULL,
  PRIMARY KEY (`cod_pc`),
  KEY `cod_status` (`cod_status`),
  KEY `cod_sala` (`cod_sala`),
  CONSTRAINT `pc_ibfk_1` FOREIGN KEY (`cod_status`) REFERENCES `statuspc` (`cod_status`) ON UPDATE CASCADE,
  CONSTRAINT `pc_ibfk_2` FOREIGN KEY (`cod_sala`) REFERENCES `sala` (`cod_sala`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc`
--

LOCK TABLES `pc` WRITE;
/*!40000 ALTER TABLE `pc` DISABLE KEYS */;
INSERT INTO `pc` VALUES (1,'1',1,1),(2,'2',4,3),(3,'3',2,2),(4,'4',3,3),(5,'5',1,1),(6,'6',2,3);
/*!40000 ALTER TABLE `pc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `cod_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `cod_suporte` tinyint(1) DEFAULT NULL,
  `nome` varchar(25) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `id_pessoa` varchar(20) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `deletado` tinyint(1) NOT NULL DEFAULT '0',
  `usuario` varchar(25) NOT NULL,
  PRIMARY KEY (`cod_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,1,'Roberto','Do Proerd','150042-4','robProd','Roberto123','Roberto@gmail.com',0,'Suporte'),(2,1,'Jorge','Da Esquina','130041-2','JorEsqui','Jorge123','Jorge@gmail.com',0,'Suporte'),(3,0,'Kaique','Futemma','160046-X','KFutemma','Kaique123','Kaique@gmail.com',0,'Aluno'),(4,0,'Luiz','Henrique','160046-7','Acelera','Luiz123','Luiz@gmail.com',0,'Aluno'),(5,0,'Guilherme','Gonçalves','160043-5','AlahuAkbar','Gui123','Gui@gmail.com',0,'Aluno'),(6,0,'Carlos','Beluzo','160073-X','Beluga','Beluzo123','Beluzo@gmail.com',0,'Professor'),(7,0,'Bruno','Bogarin','160016-6','CARALHONOVINHA','Bogarin123','Bogarin@gmail.com',1,'Aluno');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problema`
--

DROP TABLE IF EXISTS `problema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problema` (
  `cod_problema` int(11) NOT NULL AUTO_INCREMENT,
  `cod_tipo` int(11) NOT NULL,
  `descricao` varchar(1000) NOT NULL,
  `cod_pc` int(11) NOT NULL,
  `data_abertura` date DEFAULT NULL,
  `cod_pessoa` int(11) NOT NULL,
  PRIMARY KEY (`cod_problema`),
  KEY `cod_pc` (`cod_pc`),
  KEY `cod_tipo` (`cod_tipo`),
  KEY `cod_pessoa` (`cod_pessoa`),
  CONSTRAINT `problema_ibfk_1` FOREIGN KEY (`cod_pc`) REFERENCES `pc` (`cod_pc`) ON UPDATE CASCADE,
  CONSTRAINT `problema_ibfk_2` FOREIGN KEY (`cod_tipo`) REFERENCES `tipo` (`cod_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `problema_ibfk_3` FOREIGN KEY (`cod_pessoa`) REFERENCES `pessoa` (`cod_pessoa`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problema`
--

LOCK TABLES `problema` WRITE;
/*!40000 ALTER TABLE `problema` DISABLE KEYS */;
INSERT INTO `problema` VALUES (1,1,'Botão direito do mouse nao funciona no lab 3 maquina BRJ40928',1,'2017-05-13',3),(2,3,'Monitor do lab 1 não está ligando, maquina JRC31948',2,'2017-05-15',4),(3,4,'Teclado com problema no lab 1 maquina GRT80238',3,'2017-03-01',3),(4,5,'Software ASTAH não esta funcionando no lab 4 maquina IOU56912',4,'2017-03-04',6),(5,2,'CPU não está ligando no lab 2 maquina RTW58701',5,'2017-05-10',5),(6,6,'Cabo está com mau contato e o pc está desligando',5,'2017-05-15',6);
/*!40000 ALTER TABLE `problema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `problemas`
--

DROP TABLE IF EXISTS `problemas`;
/*!50001 DROP VIEW IF EXISTS `problemas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `problemas` AS SELECT 
 1 AS `Número da Sala`,
 1 AS `Identificação Máquina`,
 1 AS `Tipo`,
 1 AS `Descrição`,
 1 AS `Nome`,
 1 AS `RA`,
 1 AS `E-mail`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `quantidade_problema_por_sala`
--

DROP TABLE IF EXISTS `quantidade_problema_por_sala`;
/*!50001 DROP VIEW IF EXISTS `quantidade_problema_por_sala`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `quantidade_problema_por_sala` AS SELECT 
 1 AS `Quantidade`,
 1 AS `Sala`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `quantidade_problemas_por_tipo`
--

DROP TABLE IF EXISTS `quantidade_problemas_por_tipo`;
/*!50001 DROP VIEW IF EXISTS `quantidade_problemas_por_tipo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `quantidade_problemas_por_tipo` AS SELECT 
 1 AS `Quantidade`,
 1 AS `Tipo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `resolvidos`
--

DROP TABLE IF EXISTS `resolvidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resolvidos` (
  `cod_resolvidos` int(11) NOT NULL AUTO_INCREMENT,
  `data_fechamento` date DEFAULT NULL,
  `cod_pessoa` int(11) NOT NULL,
  `cod_problema` int(11) NOT NULL,
  `cod_suporte` int(11) NOT NULL,
  PRIMARY KEY (`cod_resolvidos`),
  KEY `cod_suporte` (`cod_suporte`),
  KEY `cod_problema` (`cod_problema`),
  KEY `cod_pessoa` (`cod_pessoa`),
  CONSTRAINT `resolvidos_ibfk_1` FOREIGN KEY (`cod_suporte`) REFERENCES `pessoa` (`cod_pessoa`) ON UPDATE CASCADE,
  CONSTRAINT `resolvidos_ibfk_2` FOREIGN KEY (`cod_problema`) REFERENCES `problema` (`cod_problema`) ON UPDATE CASCADE,
  CONSTRAINT `resolvidos_ibfk_3` FOREIGN KEY (`cod_pessoa`) REFERENCES `pessoa` (`cod_pessoa`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resolvidos`
--

LOCK TABLES `resolvidos` WRITE;
/*!40000 ALTER TABLE `resolvidos` DISABLE KEYS */;
INSERT INTO `resolvidos` VALUES (1,'2017-05-14',3,1,1),(2,'2017-05-16',4,2,1),(3,'2017-05-12',5,3,2),(4,'2017-05-11',6,4,2);
/*!40000 ALTER TABLE `resolvidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sala` (
  `cod_sala` int(11) NOT NULL AUTO_INCREMENT,
  `num_sala` int(11) NOT NULL,
  PRIMARY KEY (`cod_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuspc`
--

DROP TABLE IF EXISTS `statuspc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuspc` (
  `cod_status` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuspc`
--

LOCK TABLES `statuspc` WRITE;
/*!40000 ALTER TABLE `statuspc` DISABLE KEYS */;
INSERT INTO `statuspc` VALUES (1,'QUEBRADO'),(2,'MANUTENCAO'),(3,'OPERANTE');
/*!40000 ALTER TABLE `statuspc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `cod_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(25) NOT NULL,
  PRIMARY KEY (`cod_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Mouse'),(2,'CPU'),(3,'Monitor'),(4,'Teclado'),(5,'Software'),(6,'Outros');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'projeto'
--
/*!50003 DROP FUNCTION IF EXISTS `compare_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `compare_login`(in_login VARCHAR(20)		,
								   in_senha VARCHAR(20)
                                   ) RETURNS int(11)
BEGIN
	
    DECLARE out_id_pessoa INT;
	
    IF (SELECT p.cod_pessoa FROM pessoa p WHERE p.login = in_login AND p.senha = in_senha) 
		THEN
		SELECT 
			p.cod_pessoa
		INTO out_id_pessoa FROM
			pessoa p
		WHERE
			p.login = in_login
				AND p.senha = in_senha;
		
		RETURN out_id_pessoa;
		
		ELSE
		RETURN -1;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alter_email_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alter_email_log`(IN in_cod_pessoa_atual int				,
		IN in_email_antiga VARCHAR (100)	,
		IN in_email_novo VARCHAR (100)	
	)
BEGIN
		 
		DECLARE var_email_antiga VARCHAR (100);
		 
		SELECT 
			p.email
		INTO var_email_antiga FROM
			pessoa p
		WHERE
			p.cod_pessoa = in_cod_pessoa_atual;
		

		UPDATE pessoa 
		SET 
			email = in_email_novo
		WHERE
			var_email_antiga = in_email_antiga
				AND cod_pessoa = in_cod_pessoa_atual;

		
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alter_senha_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alter_senha_log`(IN in_cod_pessoa_atual int				,
	IN in_senha_antiga VARCHAR (20)		,
	IN in_senha_nova VARCHAR (20)	
	)
BEGIN
	
	DECLARE var_senha_antiga VARCHAR (20);
     
	SELECT 
		p.senha
	INTO var_senha_antiga FROM
		pessoa p
	WHERE
		p.cod_pessoa = in_cod_pessoa_atual;
     

	UPDATE pessoa 
	SET 
		senha = in_senha_nova
	WHERE
		var_senha_antiga = in_senha_antiga
			AND cod_pessoa = in_cod_pessoa_atual;

	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualizar_resolvidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_resolvidos`(IN in_cod_problema INT (11)		,
     IN in_cod_suporte INT (11)			,
     IN in_cod_status INT (11)
     )
BEGIN
    
	DECLARE var_data_fechamento date;
    DECLARE var_cod_pessoa INT;
    
    SELECT 
		pro.cod_pessoa
	INTO var_cod_pessoa FROM
		problema pro
			NATURAL JOIN
		pessoa p
	WHERE
		pro.cod_pessoa = p.cod_pessoa
			AND cod_problema = in_cod_problema;
    
    SELECT CURDATE() INTO var_data_fechamento;
    
    INSERT INTO resolvidos (data_fechamento, cod_pessoa, cod_problema, cod_suporte) VALUES
						 (var_data_fechamento, var_cod_pessoa, in_cod_problema, in_cod_suporte);
	
    UPDATE pc
    SET cod_status = in_cod_status;
    
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cadastrar_maquina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastrar_maquina`(IN in_id_pc VARCHAR (25)		,
									  IN in_cod_sala INT			,
                                      IN in_cod_status INT 	
                                      )
BEGIN

	INSERT INTO pc (id_pc, cod_sala, cod_status) VALUES
	(in_id_pc, in_cod_sala, in_cod_status);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cria_login_normal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cria_login_normal`(IN in_login VARCHAR (20)		,
     IN in_senha VARCHAR (20)		,
     IN in_nome VARCHAR (25)		,
     IN in_sobrenome VARCHAR (50)	,
     IN in_ra VARCHAR (20)			,
     IN in_email VARCHAR	(100)	,
     IN in_usuario VARCHAR (25)
     )
BEGIN
				
	 INSERT INTO pessoa (cod_suporte, nome, sobrenome, id_pessoa, email, login, senha, deletado, usuario) VALUES
						(FALSE, in_nome, in_sobrenome, in_ra, in_email, in_login, in_senha, FALSE, in_usuario);
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletar_conta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletar_conta`(IN in_cod_login_atual int)
BEGIN

	    UPDATE pessoa
		SET deletado = TRUE WHERE cod_pessoa = in_cod_login_atual;

		
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insere_problema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insere_problema`(IN in_cod_tipo INT (11)		,
     IN in_descricao VARCHAR (1000) ,
     IN in_cod_pc INT (11)			
     )
BEGIN
    
	DECLARE in_data_abertura date;
    SELECT CURDATE() INTO in_data_abertura;
    
    INSERT INTO problema (cod_tipo, descricao, cod_pc, data_abertura) VALUES
						 (in_cod_tipo, in_descricao, in_cod_pc, in_data_abertura);
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `maquinas_sala` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `maquinas_sala`(in in_sala int)
BEGIN

	SELECT 
		p.cod_problema 'Numero Pedido',
		pc.id_pc 'Identificação Maquina',
		DATE_FORMAT(r.data_fechamento, '%d/%m/%y') 'Data de Fechamento',
		p2.nome 'Suporte',
		s.num_sala
	FROM
		resolvidos r,
		pessoa p2,
		problema p,
		pc pc,
		sala s
	WHERE
		r.cod_resolvidos = p.cod_problema
			AND p2.cod_pessoa = r.cod_suporte
			AND p.cod_problema = r.cod_problema
			AND pc.cod_pc = p.cod_pc
			AND s.cod_sala = pc.cod_sala
			AND s.num_sala = in_sala;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `maquinas_arrumadas`
--

/*!50001 DROP VIEW IF EXISTS `maquinas_arrumadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maquinas_arrumadas` AS select `p`.`cod_problema` AS `Numero Pedido`,`pc`.`id_pc` AS `Identificação Maquina`,date_format(`r`.`data_fechamento`,'%d/%m/%y') AS `Data de Fechamento`,`p2`.`nome` AS `Suporte` from (((`resolvidos` `r` join `pessoa` `p2`) join `problema` `p`) join `pc`) where ((`r`.`cod_resolvidos` = `p`.`cod_problema`) and (`p2`.`cod_pessoa` = `r`.`cod_suporte`) and (`p`.`cod_problema` = `r`.`cod_problema`) and (`pc`.`cod_pc` = `p`.`cod_pc`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `problemas`
--

/*!50001 DROP VIEW IF EXISTS `problemas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `problemas` AS select `s`.`num_sala` AS `Número da Sala`,`pc`.`id_pc` AS `Identificação Máquina`,`t`.`tipo` AS `Tipo`,`pro`.`descricao` AS `Descrição`,`pe`.`nome` AS `Nome`,`pe`.`id_pessoa` AS `RA`,`pe`.`email` AS `E-mail` from (((((`sala` `s` join `pc`) join `tipo` `t`) join `problema` `pro`) join `pessoa` `pe`) join `resolvidos` `r`) where ((`pro`.`cod_pc` = `pc`.`cod_pc`) and (`pc`.`cod_sala` = `s`.`cod_sala`) and (`t`.`cod_tipo` = `pro`.`cod_tipo`) and (`r`.`cod_pessoa` = `pe`.`cod_pessoa`) and (`r`.`cod_problema` = `pro`.`cod_problema`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quantidade_problema_por_sala`
--

/*!50001 DROP VIEW IF EXISTS `quantidade_problema_por_sala`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quantidade_problema_por_sala` AS select count(`pr`.`cod_problema`) AS `Quantidade`,`sl`.`num_sala` AS `Sala` from ((`sala` `sl` join `pc` on((`sl`.`cod_sala` = `pc`.`cod_sala`))) join `problema` `pr` on((`pc`.`cod_pc` = `pr`.`cod_pc`))) group by `sl`.`cod_sala` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quantidade_problemas_por_tipo`
--

/*!50001 DROP VIEW IF EXISTS `quantidade_problemas_por_tipo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quantidade_problemas_por_tipo` AS select count(`pr`.`cod_problema`) AS `Quantidade`,`tp`.`tipo` AS `Tipo` from (`tipo` `tp` join `problema` `pr` on((`tp`.`cod_tipo` = `pr`.`cod_tipo`))) group by `tp`.`cod_tipo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-15 20:18:06
