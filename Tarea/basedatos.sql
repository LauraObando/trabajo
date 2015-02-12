-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-02-2015 a las 05:15:38
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `basedatos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE IF NOT EXISTS `estudiantes` (
`idEstudiantes` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `codigoEstudiante` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`idEstudiantes`, `nombre`, `codigoEstudiante`) VALUES
(1, 'laura', '12212025'),
(2, 'karol', '12202350'),
(3, 'alejandro', '20235620');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantesmateria`
--

CREATE TABLE IF NOT EXISTS `estudiantesmateria` (
`idEstudiantes_materia` int(11) NOT NULL,
  `idEstudiantes` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantesmateria`
--

INSERT INTO `estudiantesmateria` (`idEstudiantes_materia`, `idEstudiantes`, `idMateria`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE IF NOT EXISTS `materia` (
`idMateria` int(11) NOT NULL,
  `codigoMateria` varchar(45) NOT NULL,
  `nombreMateria` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`idMateria`, `codigoMateria`, `nombreMateria`) VALUES
(1, '025', 'Diseño Parametrico'),
(2, '026', 'Narracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE IF NOT EXISTS `nota` (
`idNota` int(11) NOT NULL,
  `nombreNota` varchar(45) NOT NULL,
  `porcentaje` float NOT NULL,
  `idMateriad` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`idNota`, `nombreNota`, `porcentaje`, `idMateriad`) VALUES
(1, 'Primera Entrega', 0.5, 1),
(2, 'Parcial', 0.25, 1),
(3, 'Final', 0.25, 1),
(4, 'Animacion', 0.7, 2),
(5, 'Grabaciones', 0.3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notaestudiante`
--

CREATE TABLE IF NOT EXISTS `notaestudiante` (
`idNota_estudiante` int(11) NOT NULL,
  `idEstudiante_dos` int(11) NOT NULL,
  `idMateria_dos` int(11) NOT NULL,
  `idNota` int(11) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notaestudiante`
--

INSERT INTO `notaestudiante` (`idNota_estudiante`, `idEstudiante_dos`, `idMateria_dos`, `idNota`, `valor`) VALUES
(1, 1, 1, 1, 4.5),
(2, 1, 1, 2, 3.6),
(3, 1, 1, 3, 4.8),
(4, 2, 2, 1, 3.8),
(5, 2, 2, 5, 4.2),
(6, 3, 1, 1, 4.3),
(7, 3, 1, 2, 2.5),
(8, 3, 1, 3, 3.6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
 ADD PRIMARY KEY (`idEstudiantes`);

--
-- Indices de la tabla `estudiantesmateria`
--
ALTER TABLE `estudiantesmateria`
 ADD PRIMARY KEY (`idEstudiantes_materia`), ADD KEY `idEstudiantes_idx` (`idEstudiantes`), ADD KEY `idMateria_idx` (`idMateria`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
 ADD PRIMARY KEY (`idMateria`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
 ADD PRIMARY KEY (`idNota`), ADD KEY `idMateria_idx` (`idMateriad`);

--
-- Indices de la tabla `notaestudiante`
--
ALTER TABLE `notaestudiante`
 ADD PRIMARY KEY (`idNota_estudiante`), ADD KEY `idEstudiante_idx` (`idEstudiante_dos`), ADD KEY `idMateria_idx` (`idMateria_dos`), ADD KEY `idNota_idx` (`idNota`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
MODIFY `idEstudiantes` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `estudiantesmateria`
--
ALTER TABLE `estudiantesmateria`
MODIFY `idEstudiantes_materia` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
MODIFY `idMateria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
MODIFY `idNota` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `notaestudiante`
--
ALTER TABLE `notaestudiante`
MODIFY `idNota_estudiante` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiantesmateria`
--
ALTER TABLE `estudiantesmateria`
ADD CONSTRAINT `idEstudiantes` FOREIGN KEY (`idEstudiantes`) REFERENCES `estudiantes` (`idEstudiantes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `idMateria` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
ADD CONSTRAINT `idMateriad` FOREIGN KEY (`idMateriad`) REFERENCES `materia` (`idMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notaestudiante`
--
ALTER TABLE `notaestudiante`
ADD CONSTRAINT `idEstudiante_dos` FOREIGN KEY (`idEstudiante_dos`) REFERENCES `estudiantes` (`idEstudiantes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `idMateria_dos` FOREIGN KEY (`idMateria_dos`) REFERENCES `materia` (`idMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `idNota` FOREIGN KEY (`idNota`) REFERENCES `nota` (`idNota`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
