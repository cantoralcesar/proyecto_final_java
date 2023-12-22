-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-12-2023 a las 04:20:52
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cac_integrador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `usuario`, `contrasena`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oradores`
--

CREATE TABLE `oradores` (
  `id_orador` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `tema` varchar(100) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `oradores`
--

INSERT INTO `oradores` (`id_orador`, `nombre`, `apellido`, `mail`, `tema`, `fecha_alta`) VALUES
(9, 'Diego', 'Hernandez Guevara', 'diego@example.com', 'Tema 9', '2023-12-17'),
(10, 'Sofía', 'Gómez', 'sofia@example.com', 'Tema 10', '2023-10-30'),
(18, 'maria', 'rojas', 'maria@hola.com', 'quiero ser orador', '2023-12-16'),
(21, 'rosa', 'contreras', 'rosa@hotmail.com', 'Quiero dictar sobre el curso de Java', '2023-12-16'),
(26, 'richard', 'Centurion', 'richard@hotmail.com', 'Dictar clases de redes', '2023-12-17'),
(44, 'duqueza', 'duqueza', 'duqu@hotmail.com', 'sobre IT', '2023-12-17'),
(48, 'nestor', 'palacios', 'palacios@palacios.com', 'sobre Machine y DaTA', '2023-12-17'),
(49, 'alex', 'rojas', 'hola@hola.com', 'Quiero hacer una charla de hola mundo', '2023-12-17'),
(56, 'zoe', 'iberico', 'zoe@zoe.com', 'hola como van', '2023-12-17'),
(57, 'juan carlos', 'flores', 'juancarlos@hotmail.com', 'Quisiera hablar sobre tecnologias', '2023-12-17'),
(58, 'rosa elvira', 'carbajal', 'rosa@rosa.com', 'cualquier cosa', '2023-12-17'),
(59, 'tati', 'galvan', 'probando@gmai.com', 'hola mundo', '2023-12-18'),
(62, 'Omar', 'Sifuentes', 'omar@omar.com', 'Hablar sobre el tema de tecnologÃ­as', '2023-12-18'),
(65, 'Ursula', 'Valdez', 'ursula@gmail.com', 'sobre Redes y Seguridad', '2023-12-18'),
(77, 'esperanza', 'carbajal', 'esperanza@hotmail.com', 'quiero dar charla sobre C#', '2023-12-20'),
(78, 'Nestor', 'Palacios', 'nestor@palacios.com', 'dictar clases de SQL SErver', '2023-12-20'),
(79, 'cesar', 'cantoral', 'cesar@hotmail.com', 'Quiero hacer una charla sobre Python', '2023-12-20');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oradores`
--
ALTER TABLE `oradores`
  ADD PRIMARY KEY (`id_orador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `oradores`
--
ALTER TABLE `oradores`
  MODIFY `id_orador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
