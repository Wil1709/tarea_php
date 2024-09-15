-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         8.0.38 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para db_empresa
CREATE DATABASE IF NOT EXISTS `db_empresa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_empresa`;

-- Volcando estructura para tabla db_empresa.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nit` varchar(10) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_empresa.clientes: ~2 rows (aproximadamente)
INSERT INTO `clientes` (`id_cliente`, `nit`, `nombres`, `apellidos`, `direccion`, `telefono`, `fecha_nacimiento`) VALUES
	(1, '88336166', 'Wilmer Noé', 'Contreras Interiano', 'Villa Nueva, Guatemala', '32134243', '1995-09-17'),
	(3, '32165478', 'Laura Camila', 'Contreras de Leon', 'Villa Nueva', '45698774', '2025-01-11');

-- Volcando estructura para tabla db_empresa.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_puesto` smallint DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_puesto_empleados_puestos` (`id_puesto`),
  CONSTRAINT `id_puesto_empleados_puestos` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id_puesto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_empresa.empleados: ~5 rows (aproximadamente)
INSERT INTO `empleados` (`id_empleado`, `codigo`, `nombres`, `apellidos`, `direccion`, `telefono`, `fecha_nacimiento`, `id_puesto`) VALUES
	(1, 'E001', 'Wilmer Noe', 'Contreras Interiano', 'Villa Nueva, Guatemala', '32134243', '1995-09-17', 1),
	(2, 'E002', 'Luis Santiago', 'Contreras de León', 'Villa Canales, Guatemala', '12345678', '2024-09-14', 1),
	(3, 'E003', 'Carlos Alberto', 'de la Cruz Estrada', 'Villa Nueva, Guatemala', '78945612', '2000-05-05', 2),
	(6, 'E004', 'Jose Carlos', 'Barrera Cruz', 'Villa Canales', '78965412', '2024-09-05', 2);

-- Volcando estructura para tabla db_empresa.puestos
CREATE TABLE IF NOT EXISTS `puestos` (
  `id_puesto` smallint NOT NULL AUTO_INCREMENT,
  `puesto` varchar(50) NOT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_empresa.puestos: ~2 rows (aproximadamente)
INSERT INTO `puestos` (`id_puesto`, `puesto`) VALUES
	(1, 'Programador'),
	(2, 'Analista');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
