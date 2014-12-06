-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.19 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para clinica2
CREATE DATABASE IF NOT EXISTS `clinica2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `clinica2`;


-- Volcando estructura para tabla clinica2.citas
CREATE TABLE IF NOT EXISTS `citas` (
  `IDCita` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `IDExpedientePaciente` int(11) NOT NULL,
  `IDUsuario` varchar(45) NOT NULL,
  `IDTipocita` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`IDCita`),
  KEY `fk_citas_expedientespacientes1_idx` (`IDExpedientePaciente`),
  KEY `fk_citas_usuarios1_idx` (`IDUsuario`),
  KEY `fk_citas_tiposcitas1_idx` (`IDTipocita`),
  CONSTRAINT `fk_citas_expedientespacientes1` FOREIGN KEY (`IDExpedientePaciente`) REFERENCES `expedientespacientes` (`IDExpedientePaciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_citas_tiposcitas1` FOREIGN KEY (`IDTipocita`) REFERENCES `tiposcitas` (`IDTipocita`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_citas_usuarios1` FOREIGN KEY (`IDUsuario`) REFERENCES `usuarios` (`IDUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.citas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` (`IDCita`, `fecha`, `IDExpedientePaciente`, `IDUsuario`, `IDTipocita`, `estado`) VALUES
	(1, '2014-10-20 22:52:50', 1, 'admin', 1, 'terminado'),
	(2, '2014-10-22 00:00:00', 1, 'admin', 2, 'terminada'),
	(5, '2014-10-25 00:00:00', 1, 'admin', 2, 'pendiente'),
	(25, '2014-12-02 00:00:00', 1, 'admin', 2, 'terminada'),
	(26, '2014-12-04 14:23:07', 23, 'admin', 3, 'terminado');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.consultas
CREATE TABLE IF NOT EXISTS `consultas` (
  `IDConsulta` int(11) NOT NULL AUTO_INCREMENT,
  `fechaConsulta` datetime NOT NULL,
  `IDDoctor` int(11) NOT NULL,
  `sintomas` varchar(100) NOT NULL,
  `diagnostico` varchar(100) NOT NULL,
  `medicamento` varchar(100) NOT NULL,
  `IDCita` int(11) NOT NULL,
  PRIMARY KEY (`IDConsulta`),
  UNIQUE KEY `idConsulta_UNIQUE` (`IDConsulta`),
  KEY `fk_Consulta_Doctores1_idx` (`IDDoctor`),
  KEY `fk_consultas_citas1_idx` (`IDCita`),
  CONSTRAINT `fk_consultas_citas1` FOREIGN KEY (`IDCita`) REFERENCES `citas` (`IDCita`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Consulta_Doctores1` FOREIGN KEY (`IDDoctor`) REFERENCES `doctores` (`IDDoctor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.consultas: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
INSERT INTO `consultas` (`IDConsulta`, `fechaConsulta`, `IDDoctor`, `sintomas`, `diagnostico`, `medicamento`, `IDCita`) VALUES
	(2, '2014-12-03 00:00:00', 1, 'sddddd', 'dddddd', 'aaaaaaaaaaaaa', 5),
	(3, '2014-12-05 00:00:00', 2, 'asdsd', 'asdsad', 'sdaaaaaaaaaaaa', 5),
	(78, '2014-12-11 00:00:00', 1, 'asddasdsdd', 'dddddddd', 'ddddddd', 5);
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.doctores
CREATE TABLE IF NOT EXISTS `doctores` (
  `IDDoctor` int(11) NOT NULL AUTO_INCREMENT,
  `nombresDoctor` varchar(45) NOT NULL,
  `apellidosDoctor` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `IDEspecialidad` int(11) NOT NULL,
  PRIMARY KEY (`IDDoctor`),
  UNIQUE KEY `idDoctor_UNIQUE` (`IDDoctor`),
  KEY `fk_doctores_especialidades1_idx` (`IDEspecialidad`),
  CONSTRAINT `fk_doctores_especialidades1` FOREIGN KEY (`IDEspecialidad`) REFERENCES `especialidades` (`IDEspecialidad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.doctores: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `doctores` DISABLE KEYS */;
INSERT INTO `doctores` (`IDDoctor`, `nombresDoctor`, `apellidosDoctor`, `direccion`, `telefono`, `IDEspecialidad`) VALUES
	(1, 'Jose Juan', 'Marquez Melendez', 'sonsonate, col sensunapan', '24214575', 2),
	(2, 'FERNANDO JOSE', 'LEMUS', 'SONSONATE ', '214578214', 2),
	(3, 'Pedro', 'Hernandez', 'San Salvador', '24157854', 1),
	(5, 'Orlando Jesus', 'Romeo Quimeda', 'Sonsonate, col 14 de diciembre', '24212547', 1),
	(6, 'Carlos Jsue', 'Henriquez', 'San Salvador', '24124785', 2);
/*!40000 ALTER TABLE `doctores` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.especialidades
CREATE TABLE IF NOT EXISTS `especialidades` (
  `IDEspecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(45) NOT NULL,
  PRIMARY KEY (`IDEspecialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.especialidades: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` (`IDEspecialidad`, `especialidad`) VALUES
	(1, 'odontologo'),
	(2, 'general'),
	(3, 'ginecologo');
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.examenes
CREATE TABLE IF NOT EXISTS `examenes` (
  `IDExamen` int(11) NOT NULL AUTO_INCREMENT,
  `examen` varchar(45) NOT NULL,
  PRIMARY KEY (`IDExamen`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.examenes: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `examenes` DISABLE KEYS */;
INSERT INTO `examenes` (`IDExamen`, `examen`) VALUES
	(1, 'orita '),
	(2, 'sangre'),
	(3, 'eses'),
	(4, 'colesterol');
/*!40000 ALTER TABLE `examenes` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.examenespacientes
CREATE TABLE IF NOT EXISTS `examenespacientes` (
  `IDExamenpaciente` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `resultado` varchar(45) NOT NULL,
  `IDExamen` int(11) NOT NULL,
  `IDCita` int(11) NOT NULL,
  `IDDoctor` int(11) NOT NULL,
  PRIMARY KEY (`IDExamenpaciente`),
  KEY `fk_examenespacientes_examenes1_idx` (`IDExamen`),
  KEY `fk_examenespacientes_citas1_idx` (`IDCita`),
  KEY `fk_examenespacientes_doctores1_idx` (`IDDoctor`),
  CONSTRAINT `fk_examenespacientes_citas1` FOREIGN KEY (`IDCita`) REFERENCES `citas` (`IDCita`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_examenespacientes_doctores1` FOREIGN KEY (`IDDoctor`) REFERENCES `doctores` (`IDDoctor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_examenespacientes_examenes1` FOREIGN KEY (`IDExamen`) REFERENCES `examenes` (`IDExamen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.examenespacientes: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `examenespacientes` DISABLE KEYS */;
INSERT INTO `examenespacientes` (`IDExamenpaciente`, `fecha`, `resultado`, `IDExamen`, `IDCita`, `IDDoctor`) VALUES
	(3, '2014-12-04 00:00:00', 'creatinina elevada', 1, 1, 2),
	(68, '2014-12-10 00:00:00', 'alto', 4, 1, 5);
/*!40000 ALTER TABLE `examenespacientes` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.expedientespacientes
CREATE TABLE IF NOT EXISTS `expedientespacientes` (
  `IDExpedientePaciente` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePaciente` varchar(45) NOT NULL,
  `nombrePadre` varchar(45) NOT NULL,
  `nombreMadre` varchar(45) NOT NULL,
  `tipoSangre` varchar(45) NOT NULL,
  `peso` varchar(50) NOT NULL,
  `altura` varchar(50) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `fechaNacimiento` datetime NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`IDExpedientePaciente`),
  UNIQUE KEY `idExpediente-Paciente_UNIQUE` (`IDExpedientePaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.expedientespacientes: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `expedientespacientes` DISABLE KEYS */;
INSERT INTO `expedientespacientes` (`IDExpedientePaciente`, `nombrePaciente`, `nombrePadre`, `nombreMadre`, `tipoSangre`, `peso`, `altura`, `sexo`, `fechaNacimiento`, `direccion`, `telefono`) VALUES
	(1, 'JUAN PEREZ', 'JOSE HERNANDEZ', 'LUISA MOJICA', 'A', '26', '1.7', 'Masculino', '2014-11-06 00:00:00', 'SONSONATE', '24154752'),
	(22, 'ELMER JOSUE MOJICA PINEDA', 'ELMER PINEDA', 'MARIA MOJICA', 'B POSITIVO', '49', '1.8', 'Masculino', '2014-10-20 00:49:08', 'SONOSNATE,IZALCO', '24547821'),
	(23, 'ALEXANDER MEJIA', 'ROMERO MEJIA', 'SANDRA QUIMENEZ', 'O NEGATIVO', '50', '1.5', 'Masculino', '2014-10-20 00:50:25', 'SONSONATE, SANTA ISABLE', '24578412'),
	(24, 'LEONARDO DAVINCI', 'PEDRO DAVINCI', 'RUTH JIMENEZ', 'A POSITIVO', '49', '1.6', 'Maculino', '2014-10-20 00:51:34', 'SONSONATE', '24154789'),
	(25, 'MARICELA PEREZ', 'JUAN PEREZ', 'SANDRA PINEDA', 'O NEGATIVO', '49', '1.5', 'Femenino', '2014-10-20 00:52:56', 'SONSONATE', '21478565');
/*!40000 ALTER TABLE `expedientespacientes` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `IDMenu` int(11) NOT NULL AUTO_INCREMENT,
  `etiqueta` varchar(45) NOT NULL,
  `url` datetime NOT NULL,
  `idpadre` varchar(45) NOT NULL,
  PRIMARY KEY (`IDMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.menus: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `IDPermiso` int(11) NOT NULL,
  `IDMenu` int(11) NOT NULL,
  `IDRol` int(11) NOT NULL,
  PRIMARY KEY (`IDPermiso`),
  KEY `fk_Permisos_Comandos1_idx` (`IDMenu`),
  KEY `fk_Permisos_roles1_idx` (`IDRol`),
  CONSTRAINT `fk_Permisos_Comandos1` FOREIGN KEY (`IDMenu`) REFERENCES `menus` (`IDMenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Permisos_roles1` FOREIGN KEY (`IDRol`) REFERENCES `roles` (`IDRol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.permisos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `IDRol` int(11) NOT NULL AUTO_INCREMENT,
  `Rol` varchar(45) NOT NULL,
  PRIMARY KEY (`IDRol`),
  UNIQUE KEY `idRol_UNIQUE` (`IDRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.roles: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`IDRol`, `Rol`) VALUES
	(1, 'Administrador'),
	(2, 'Consultor'),
	(3, 'anotador');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.tiposcitas
CREATE TABLE IF NOT EXISTS `tiposcitas` (
  `IDTipocita` int(11) NOT NULL AUTO_INCREMENT,
  `tipocita` varchar(45) NOT NULL,
  PRIMARY KEY (`IDTipocita`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.tiposcitas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tiposcitas` DISABLE KEYS */;
INSERT INTO `tiposcitas` (`IDTipocita`, `tipocita`) VALUES
	(1, 'examen'),
	(2, 'consulta'),
	(3, 'vacuna');
/*!40000 ALTER TABLE `tiposcitas` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `IDUsuario` varchar(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `dui` varchar(45) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `IDRol` int(11) NOT NULL,
  PRIMARY KEY (`IDUsuario`),
  UNIQUE KEY `idUsuario_UNIQUE` (`IDUsuario`),
  KEY `fk_Usuarios_roles1_idx` (`IDRol`),
  CONSTRAINT `fk_Usuarios_roles1` FOREIGN KEY (`IDRol`) REFERENCES `roles` (`IDRol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.usuarios: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`IDUsuario`, `nombres`, `apellidos`, `clave`, `dui`, `correo`, `telefono`, `IDRol`) VALUES
	('admin', 'Cesar', 'Adonay', 'd033e22ae348aeb5660fc2140aec35850c4da997', '12345', 'adasd@gmail.com', '123456', 1),
	('jose', 'JOSE', 'PEREZ', '4a3487e57d90e2084654b6d23937e75af5c8ee55', '12345567', 'uncorreo2@gmail.com', '23243454', 3),
	('juan', 'JUAN ', 'PEREZ', 'b49a5780a99ea81284fc0746a78f84a30e4d5c73', '123456', 'uncorreo@gmail.com', '23432123', 2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.vacunas
CREATE TABLE IF NOT EXISTS `vacunas` (
  `IDVacuna` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`IDVacuna`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.vacunas: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `vacunas` DISABLE KEYS */;
INSERT INTO `vacunas` (`IDVacuna`, `nombre`) VALUES
	(1, 'gripe'),
	(2, 'sarampion'),
	(3, 'varicela'),
	(4, 'bronquitis');
/*!40000 ALTER TABLE `vacunas` ENABLE KEYS */;


-- Volcando estructura para tabla clinica2.vacunaspacientes
CREATE TABLE IF NOT EXISTS `vacunaspacientes` (
  `IDVacunaPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `IDVacuna` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `citas_IDCita` int(11) NOT NULL,
  PRIMARY KEY (`IDVacunaPaciente`),
  KEY `fk_vacunasPacientes_vacunas1_idx` (`IDVacuna`),
  KEY `fk_vacunaspacientes_citas1_idx` (`citas_IDCita`),
  CONSTRAINT `fk_vacunaspacientes_citas1` FOREIGN KEY (`citas_IDCita`) REFERENCES `citas` (`IDCita`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vacunasPacientes_vacunas1` FOREIGN KEY (`IDVacuna`) REFERENCES `vacunas` (`IDVacuna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica2.vacunaspacientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vacunaspacientes` DISABLE KEYS */;
INSERT INTO `vacunaspacientes` (`IDVacunaPaciente`, `IDVacuna`, `fecha`, `citas_IDCita`) VALUES
	(4, 1, '2014-12-04 00:00:00', 26),
	(70, 2, '2014-12-10 00:00:00', 26);
/*!40000 ALTER TABLE `vacunaspacientes` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
