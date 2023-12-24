-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: database:3306
-- Tiempo de generación: 24-12-2023 a las 00:24:17
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `twothousand`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE DATABASE thousand;
USE thousand;

CREATE TABLE `client` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `franjaHoraria`
--

CREATE TABLE `timeZone` (
  `id` bigint NOT NULL,
  `hour` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineaPedido`
--

CREATE TABLE `orderLine` (
  `id` bigint NOT NULL,
  `employee_id` bigint DEFAULT NULL,
  `booking_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `table` (
  `id` bigint NOT NULL,
  `site` varchar(255) DEFAULT NULL,
  `capacity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `product` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `productType_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `booking` (
  `id` bigint NOT NULL,
  `zone_id` bigint DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  `table_id` bigint DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoProducto`
--

CREATE TABLE `productType` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `employee` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `franjaHoraria`
--
ALTER TABLE `timeZone`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lineaPedido`
--
ALTER TABLE `orderLine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productType_id` (`productType_id`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_id` (`zone_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `table_id` (`table_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indices de la tabla `tipoProducto`
--
ALTER TABLE `productType`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lineaPedido`
--
ALTER TABLE `orderLine`
  ADD CONSTRAINT `orderLine_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `orderLine_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `orderLine_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`productType_id`) REFERENCES `productType` (`id`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`zone_id`) REFERENCES `timeZone` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`table_id`) REFERENCES `table` (`id`),
  ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
