-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2022 a las 21:29:33
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
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id_brand` int(11) NOT NULL,
  `brand_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id_brand`, `brand_name`) VALUES
(1, 'Motorola'),
(2, 'Apple'),
(3, 'Samsung'),
(4, 'Huawei'),
(7, 'Xiaomi');

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
(41, 'img/634b60ae662d6.jpg', '	 XIAOMI MI 11 ULTRA', 'RAM 8,12 GB LPDDR5 / ALMACENAMIENTO  128,256,512 GB UFS 3.1', '6,81” WQHD+, 120 Hz, 480 Hz táctil\r\n10-bit AMOLED E4, 515 ppp\r\n1.550 nits, HDR10+, MEMC\r\nGorilla Glass Victus\r\nPantalla AMOLED 1,1\" secundaria trasera', 'Snapdragon 888', '50 MP (1/1,12”)8P, OIS, f/1.95\r\nGran angular IMX586 48MP, 128º, f/2.2\r\nTelemacro IMX586 48MP, 5x óptico, 120x digital', 7),
(42, 'img/634b614ab1995.jpg', 'HUAWEI MATE 40 PRO', 'RAM  8 GB / ALMACENAMIENTO 256 GB', '	\r\nOLED 6,76 pulgadas\r\nFHD+ 2.772 x 1.344 píxeles\r\nTasa de refresco 90Hz', 'CPU Kirin 9000 Octa-core / GPU 24-core Mali-G78', 'Sensor principal: 50MP Ultra Vision Camera, f/1.9\r\nUltra angular: 20MP Cine Camera. f/1.8\r\nTeleobjetivo: 12MP, f/3.4, OIS', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', '$2a$12$dvNQBP0zl0SynNu/IG7b6.zxNzTojc9CnwFsKRlLuKKyva3rMy8HS');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id_brand`);

--
-- Indices de la tabla `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_brand` (`id_brand`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
