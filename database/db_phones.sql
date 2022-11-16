-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2022 a las 01:32:02
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_phones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `phones`
--

CREATE TABLE `phones` (
  `id` int(11) NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `memory` varchar(100) NOT NULL,
  `display` varchar(200) NOT NULL,
  `cpugpu` varchar(200) NOT NULL,
  `camera` varchar(200) NOT NULL,
  `id_brand` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `phones`
--

INSERT INTO `phones` (`id`, `img`, `model`, `memory`, `display`, `cpugpu`, `camera`, `id_brand`) VALUES
(22, 'img/634b66b5f0e63.jpg', 'Moto edg 30', 'RAM 8 GB /Int. Memory	256 GB', 'OLED de 6,5\" FullHD+ con HDR10+144 Hz de tasa de refresco', 'Snapdragon 778/ Adreno 642L', 'Principal de 50 Mpx (f/1,8)\r\nGran angular de 50 Mpx (f/2,2) y 114º\r\nProfundidad de 2 Mpx (f/2,4)', 1),
(23, 'img/634773b0db000.jpg', 'IPhone 13pro max', '128/256/512 GB/1 TB', 'Pantalla Super Retina XDR con ProMotion Resolución de 2778 x 1284 pixeles a 458 ppi', 'Apple A15 Bionic', 'Telefoto: 12 MP f/2.8, 77mm, 3x óptico Ultrawide: 12 MP f/1.8, 6P, 120º Principal: 12 MP f/1.5, 1,9um', 2),
(29, 'img/634b5f746beb5.jpg', 'Samsung Galaxy A53', 'RAM 8 GB /Int. Memory	256 GB', 'Super AMOLED Full HD+ de 6,5 pulgadas, 120 Hz (el refresco no es adaptativo) y cobertura Corning Gorilla Glass 5', 'Exynos 1280 de 8 núcleos', 'Principal: sensor de 64 megapíxeles, óptica con valor de apertura f/1.8 y estabilización óptica Ultra gran angular: sensor de 12 megapíxeles y óptica con valor de apertura f/2.2 Cámara de profundidad', 3),
(42, 'img/634b614ab1995.jpg', 'HUAWEI MATE 40 PRO', 'RAM  8 GB / ALMACENAMIENTO 256 GB', '	\r\nOLED 6,76 pulgadas\r\nFHD+ 2.772 x 1.344 píxeles\r\nTasa de refresco 90Hz', 'CPU Kirin 9000 Octa-core / GPU 24-core Mali-G78', 'Sensor principal: 50MP Ultra Vision Camera, f/1.9\r\nUltra angular: 20MP Cine Camera. f/1.8\r\nTeleobjetivo: 12MP, f/3.4, OIS', 4),
(68, NULL, 'Moto edg 30', 'RAM 8 GB /Int. Memory	256 GB', 'OLED de 6,5\" FullHD+ con HDR10+144 Hz de tasa de refresco', 'Snapdragon 778/ Adreno 642L', 'Principal de 50 Mpx (f/1,8)\r\nGran angular de 50 Mpx (f/2,2) y 114º\r\nProfundidad de 2 Mpx (f/2,4)', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_brand` (`id_brand`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `phones`
--
ALTER TABLE `phones`
  ADD CONSTRAINT `phones_ibfk_1` FOREIGN KEY (`id_brand`) REFERENCES `brands` (`id_brand`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
