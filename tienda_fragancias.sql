-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2026 a las 02:21:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_fragancias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(100) NOT NULL,
  `pais_origen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre_marca`, `pais_origen`) VALUES
(1, 'Burberry', 'Reino Unido'),
(2, 'Dior', 'Francia'),
(3, 'Chanel', 'Francia'),
(4, 'Tom Ford', 'Estados Unidos'),
(5, 'Creed', 'Francia'),
(6, 'Armani', 'Italia'),
(7, 'Versace', 'Italia'),
(8, 'YSL', 'Francia'),
(9, 'Prada', 'Italia'),
(10, 'Parfums de Marly', 'Francia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfumes`
--

CREATE TABLE `perfumes` (
  `id_perfume` int(11) NOT NULL,
  `nombre_perfume` varchar(100) NOT NULL,
  `tipo_concentracion` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfumes`
--

INSERT INTO `perfumes` (`id_perfume`, `nombre_perfume`, `tipo_concentracion`, `precio`, `id_marca`) VALUES
(1, 'Hero Parfum Intense', 'Parfum', 135.00, 1),
(2, 'Sauvage', 'Eau de Parfum', 120.00, 2),
(3, 'Bleu de Chanel', 'Parfum', 160.00, 3),
(4, 'Oud Wood', 'Eau de Parfum', 250.00, 4),
(5, 'Aventus', 'Eau de Parfum', 320.00, 5),
(6, 'Acqua Di Gio Profondo', 'Eau de Parfum', 110.00, 6),
(7, 'Eros', 'Eau de Toilette', 95.00, 7),
(8, 'Y Le Parfum', 'Parfum', 140.00, 8),
(9, 'L\'Homme Prada', 'Eau de Toilette', 105.00, 9),
(10, 'Layton', 'Eau de Parfum', 280.00, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenas`
--

CREATE TABLE `resenas` (
  `id_resena` int(11) NOT NULL,
  `id_perfume` int(11) NOT NULL,
  `puntuacion` int(11) DEFAULT NULL CHECK (`puntuacion` between 1 and 5),
  `comentario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resenas`
--

INSERT INTO `resenas` (`id_resena`, `id_perfume`, `puntuacion`, `comentario`) VALUES
(1, 1, 5, 'Excelente aroma amaderado e intenso.'),
(2, 2, 4, 'Muy versátil y popular.'),
(3, 3, 5, 'Elegante y con gran fijación.'),
(4, 4, 5, 'Aroma sofisticado y cálido.'),
(5, 5, 4, 'Proyección destacable y muy fresco.'),
(6, 6, 4, 'Ideal para clima cálido.'),
(7, 7, 3, 'Dulce y juvenil.'),
(8, 8, 5, 'Excelente nota de lavanda.'),
(9, 9, 4, 'Limpio y perfecto para oficina.'),
(10, 10, 5, 'Calidad nicho con excelente rendimiento.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `perfumes`
--
ALTER TABLE `perfumes`
  ADD PRIMARY KEY (`id_perfume`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD PRIMARY KEY (`id_resena`),
  ADD KEY `id_perfume` (`id_perfume`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `perfumes`
--
ALTER TABLE `perfumes`
  MODIFY `id_perfume` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `resenas`
--
ALTER TABLE `resenas`
  MODIFY `id_resena` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perfumes`
--
ALTER TABLE `perfumes`
  ADD CONSTRAINT `perfumes_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`) ON DELETE CASCADE;

--
-- Filtros para la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD CONSTRAINT `resenas_ibfk_1` FOREIGN KEY (`id_perfume`) REFERENCES `perfumes` (`id_perfume`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
