-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-03-2019 a las 18:10:11
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `icook`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacioncomentario`
--

CREATE TABLE `calificacioncomentario` (
  `IdCalificacionComentario` int(11) NOT NULL,
  `CalificacionStart` int(11) NOT NULL,
  `Comentario` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `IdentidadConsumidor` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `IdPedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `calificacioncomentario`
--

INSERT INTO `calificacioncomentario` (`IdCalificacionComentario`, `CalificacionStart`, `Comentario`, `IdentidadConsumidor`, `IdPedido`) VALUES
(2, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', '0801199405877', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopedidos`
--

CREATE TABLE `estadopedidos` (
  `IdEstadoPedido` int(11) NOT NULL,
  `Nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `Activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estadopedidos`
--

INSERT INTO `estadopedidos` (`IdEstadoPedido`, `Nombre`, `Descripcion`, `Activo`) VALUES
(1, 'Aceptada por el chef', '', 1),
(2, 'Aceptada por el repartidor', '', 1),
(3, 'En proceso de obtener pedido', 'El repartidor va a donde el chef a traer el platillo', 1),
(4, 'En proceso de entregar pedido', 'El repartidor va en camino a la direccion del cliente.', 1),
(5, 'Finalizada', 'Entrega realizada satisfactoriamente', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `IdPedido` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Subtotal` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `IdEstadoPedido` int(11) NOT NULL,
  `IdPlatillo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`IdPedido`, `Fecha`, `Cantidad`, `Subtotal`, `Total`, `IdEstadoPedido`, `IdPlatillo`) VALUES
(1, '2019-03-31', 2, 204, 24, 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platillos`
--

CREATE TABLE `platillos` (
  `IdPlatillo` int(11) NOT NULL,
  `Nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Imagen` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Precio` int(11) NOT NULL,
  `IdTipoPedido` int(11) NOT NULL,
  `IdentidadChef` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `platillos`
--

INSERT INTO `platillos` (`IdPlatillo`, `Nombre`, `Imagen`, `Descripcion`, `Precio`, `IdTipoPedido`, `IdentidadChef`) VALUES
(2, 'Ensalada caprese', 'https://www.comedera.com/wp-content/uploads/2017/07/ensalada-caprese.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut a', 120, 2, '0319200400229'),
(3, 'Ensalada de tomate', 'https://www.comedera.com/wp-content/uploads/2017/07/ensalada-con-tomate.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', 35, 2, '0319200400229');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopedido`
--

CREATE TABLE `tipopedido` (
  `IdTipoPedido` int(11) NOT NULL,
  `Nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipopedido`
--

INSERT INTO `tipopedido` (`IdTipoPedido`, `Nombre`, `Activo`) VALUES
(1, 'Por encargo', 1),
(2, 'Disponible inmediato', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `IdTipoUsuario` int(11) NOT NULL,
  `Nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`IdTipoUsuario`, `Nombre`, `Activo`) VALUES
(1, 'Consumidor final', 1),
(2, 'Chef', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Identidad` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Nombres` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Apellidos` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Avatar` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Biografia` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Domicilio` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `IdTipoUsuario` int(11) NOT NULL,
  `Password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Tel` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Identidad`, `Nombres`, `Apellidos`, `Avatar`, `Email`, `Biografia`, `Ciudad`, `Domicilio`, `IdTipoUsuario`, `Password`, `Tel`) VALUES
('0319200400229', 'Julissa Alejandra', 'Izaguirre Ramos', 'https://cdn1.iconfinder.com/data/icons/ordinary-people/512/chef-512.png', 'julissaizaguirre96@gmail.com', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'Tegucigalpa M.D.C.', 'Barrio La Granja Terminal de Buses Tiloarque', 2, '12345', ''),
('0801199405877', 'Jorge Mizrain', 'Aguilar Perez', 'https://cdn1.iconfinder.com/data/icons/social-messaging-productivity-1-1/128/gender-male2-512.png', 'jorgemizrain@gmail.com', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'Tegucigalpa M.D.C.', 'Col. Santa Fé ', 1, '123456789', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacioncomentario`
--
ALTER TABLE `calificacioncomentario`
  ADD PRIMARY KEY (`IdCalificacionComentario`),
  ADD KEY `fk_identidadConsumidor` (`IdentidadConsumidor`),
  ADD KEY `fk_idCaliCom` (`IdPedido`);

--
-- Indices de la tabla `estadopedidos`
--
ALTER TABLE `estadopedidos`
  ADD PRIMARY KEY (`IdEstadoPedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`IdPedido`),
  ADD KEY `fk_estadoPedido` (`IdEstadoPedido`),
  ADD KEY `fk_idPlatillo` (`IdPlatillo`);

--
-- Indices de la tabla `platillos`
--
ALTER TABLE `platillos`
  ADD PRIMARY KEY (`IdPlatillo`),
  ADD KEY `fk_idTipoPlatillo` (`IdTipoPedido`),
  ADD KEY `fk_identidadChef` (`IdentidadChef`);

--
-- Indices de la tabla `tipopedido`
--
ALTER TABLE `tipopedido`
  ADD PRIMARY KEY (`IdTipoPedido`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`IdTipoUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Identidad`),
  ADD KEY `fk_idTipoUsuario` (`IdTipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacioncomentario`
--
ALTER TABLE `calificacioncomentario`
  MODIFY `IdCalificacionComentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estadopedidos`
--
ALTER TABLE `estadopedidos`
  MODIFY `IdEstadoPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `IdPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `platillos`
--
ALTER TABLE `platillos`
  MODIFY `IdPlatillo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipopedido`
--
ALTER TABLE `tipopedido`
  MODIFY `IdTipoPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `IdTipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificacioncomentario`
--
ALTER TABLE `calificacioncomentario`
  ADD CONSTRAINT `fk_idCaliCom` FOREIGN KEY (`IdPedido`) REFERENCES `pedidos` (`IdPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_identidadConsumidor` FOREIGN KEY (`IdentidadConsumidor`) REFERENCES `usuarios` (`Identidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_estadoPedido` FOREIGN KEY (`IdEstadoPedido`) REFERENCES `estadopedidos` (`IdEstadoPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idPlatillo` FOREIGN KEY (`IdPlatillo`) REFERENCES `platillos` (`IdPlatillo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `platillos`
--
ALTER TABLE `platillos`
  ADD CONSTRAINT `fk_idTipoPlatillo` FOREIGN KEY (`IdTipoPedido`) REFERENCES `tipopedido` (`IdTipoPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_identidadChef` FOREIGN KEY (`IdentidadChef`) REFERENCES `usuarios` (`Identidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_idTipoUsuario` FOREIGN KEY (`IdTipoUsuario`) REFERENCES `tipousuario` (`IdTipoUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
