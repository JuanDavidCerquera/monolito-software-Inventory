-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-10-2023 a las 21:30:05
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Id_Cliente` int NOT NULL,
  `Nombre` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Apellido` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Teléfono` bigint NOT NULL,
  `CorreoElectronico` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Id_Cliente`, `Nombre`, `Apellido`, `Teléfono`, `CorreoElectronico`) VALUES
(1, 'yanuard', 'Montialegre', 333333, 'drago@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `Id_Devolucion` int NOT NULL,
  `Id_Cliente` int NOT NULL,
  `Id_Producto` int NOT NULL,
  `Fecha` date NOT NULL,
  `Motivo` varchar(300) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `Id_Empleado` int NOT NULL,
  `Id_Sede` int NOT NULL,
  `Nombre` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Apellido` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Puesto` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`Id_Empleado`, `Id_Sede`, `Nombre`, `Apellido`, `FechaNacimiento`, `Puesto`) VALUES
(1, 1, 'Arley', 'Puente', '1991-02-03', 'Caja'),
(2, 2, 'Duver', 'Carrasca', '1991-04-02', 'Caja'),
(3, 3, 'Omar', 'Carrasquillo', '1981-04-04', 'Caja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `Id_Empresa` int NOT NULL,
  `Nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Dirección` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Teléfono` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`Id_Empresa`, `Nombre`, `Dirección`, `Teléfono`) VALUES
(1, 'Sur Avastos', 'Centro Neiva', 3184023423);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_Factura` int NOT NULL,
  `Id_Cliente` int NOT NULL,
  `Id_Empleado` int NOT NULL,
  `Fecha` date NOT NULL,
  `Total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_Factura`, `Id_Cliente`, `Id_Empleado`, `Fecha`, `Total`) VALUES
(1, 1, 1, '2023-09-03', 78);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturadetalle`
--

CREATE TABLE `facturadetalle` (
  `Id_FacturaDetalle` int NOT NULL,
  `Id_MetodoPago` int NOT NULL,
  `Id_Factura` int NOT NULL,
  `Id_Producto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `PrecioUnitario` int NOT NULL,
  `TotalDetalle` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturadetalle`
--

INSERT INTO `facturadetalle` (`Id_FacturaDetalle`, `Id_MetodoPago`, `Id_Factura`, `Id_Producto`, `Cantidad`, `PrecioUnitario`, `TotalDetalle`) VALUES
(1, 1, 1, 2, 33, 1, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `Id_Inventario` int NOT NULL,
  `Id_Producto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `ValorUnitario` int NOT NULL,
  `fechaEntrada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodosdepago`
--

CREATE TABLE `metodosdepago` (
  `Id_MetodoPago` int NOT NULL,
  `Nombre` varchar(80) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodosdepago`
--

INSERT INTO `metodosdepago` (`Id_MetodoPago`, `Nombre`) VALUES
(1, 'Tarjeta'),
(2, 'Efectivo'),
(3, 'Transferencia bancaria'),
(4, 'PayPal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

CREATE TABLE `ofertas` (
  `Id_Oferta` int NOT NULL,
  `Id_Producto` int NOT NULL,
  `Descripción` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Descuento` double NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_Pedidos` int NOT NULL,
  `Id_Cliente` int NOT NULL,
  `Id_Empleado` int NOT NULL,
  `Fecha` int NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `Id_Persona` int NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`Id_Persona`, `Descripcion`) VALUES
(1, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_Productos` int NOT NULL,
  `id_provedor` int NOT NULL,
  `Codigo` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Nombre` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Categoria` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `ValorUnitario` double NOT NULL,
  `Cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Id_Productos`, `id_provedor`, `Codigo`, `Nombre`, `Categoria`, `ValorUnitario`, `Cantidad`) VALUES
(1, 1, 'ABC123', 'Producto 1 ', 'Cereales', 50.99, 100),
(2, 1, 'XYZ456', 'Producto 2', 'Bebidas', 29.99, 50),
(3, 1, 'DEF789', 'Producto 3', 'Cereales', 99.99, 75),
(4, 2, 'GHI101', 'Producto 4', 'Verduras', 19.99, 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provedores`
--

CREATE TABLE `provedores` (
  `id_provedor` int NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `Telefono` bigint NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `provedores`
--

INSERT INTO `provedores` (`id_provedor`, `Nombre`, `Telefono`, `Direccion`, `Fecha`) VALUES
(1, 'Proveedor 1', -8223, 'Calle 123, Neiva', '2023-10-01'),
(2, 'Proveedor 2', -2877, 'Avenida XYZ, Barranquilla', '2023-09-15'),
(3, 'Proveedor 3', -5555, 'Calle ABC, Bogota', '2023-08-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Id_Rol` int NOT NULL,
  `Descripcion` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Id_Rol`, `Descripcion`) VALUES
(1, 'Comprador'),
(2, 'Administrador'),
(3, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `Id_Sede` int NOT NULL,
  `Id_Empresa` int NOT NULL,
  `Nombre` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Dirección` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Teléfono` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`Id_Sede`, `Id_Empresa`, `Nombre`, `Dirección`, `Teléfono`) VALUES
(1, 1, 'Sur Avastos sur', 'call5 Nro34-54b Sur', 3152349865),
(2, 1, 'Sur Avastos Norte', 'call2 Nro4-54a Norte', 3132439865),
(3, 1, 'Sur Avastos Oriente', 'call9 Nro3-89b Oriente', 2342349865);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguridad`
--

CREATE TABLE `seguridad` (
  `Id_Usuario` int NOT NULL,
  `Id_Persona` int NOT NULL,
  `Id_Rol` int NOT NULL,
  `NombreUsuario` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Contraseña` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seguridad`
--

INSERT INTO `seguridad` (`Id_Usuario`, `Id_Persona`, `Id_Rol`, `NombreUsuario`, `Contraseña`) VALUES
(1, 1, 2, 'Admin', 'Admin'),
(2, 1, 1, 'er', 'er'),
(3, 1, 1, 'ttt', 'ttt');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id_Cliente`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`Id_Devolucion`),
  ADD KEY `Id_Cliente` (`Id_Cliente`,`Id_Producto`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`Id_Empleado`),
  ADD KEY `Id_Sede` (`Id_Sede`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`Id_Empresa`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_Factura`),
  ADD KEY `Id_Cliente` (`Id_Cliente`,`Id_Empleado`),
  ADD KEY `Id_Empleado` (`Id_Empleado`);

--
-- Indices de la tabla `facturadetalle`
--
ALTER TABLE `facturadetalle`
  ADD PRIMARY KEY (`Id_FacturaDetalle`),
  ADD KEY `Id_Factura` (`Id_Factura`,`Id_Producto`),
  ADD KEY `Id_Producto` (`Id_Producto`),
  ADD KEY `Id_MetodoPago` (`Id_MetodoPago`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`Id_Inventario`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indices de la tabla `metodosdepago`
--
ALTER TABLE `metodosdepago`
  ADD PRIMARY KEY (`Id_MetodoPago`);

--
-- Indices de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD PRIMARY KEY (`Id_Oferta`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_Pedidos`),
  ADD KEY `Id_Cliente` (`Id_Cliente`,`Id_Empleado`),
  ADD KEY `Id_Empleado` (`Id_Empleado`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`Id_Persona`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_Productos`),
  ADD KEY `id_provedor` (`id_provedor`);

--
-- Indices de la tabla `provedores`
--
ALTER TABLE `provedores`
  ADD PRIMARY KEY (`id_provedor`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_Rol`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`Id_Sede`),
  ADD KEY `Id_Empresa` (`Id_Empresa`);

--
-- Indices de la tabla `seguridad`
--
ALTER TABLE `seguridad`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD KEY `Id_Persona` (`Id_Persona`,`Id_Rol`),
  ADD KEY `Id_Rol` (`Id_Rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Id_Cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `Id_Devolucion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `Id_Empleado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `Id_Empresa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_Factura` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `facturadetalle`
--
ALTER TABLE `facturadetalle`
  MODIFY `Id_FacturaDetalle` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `Id_Inventario` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodosdepago`
--
ALTER TABLE `metodosdepago`
  MODIFY `Id_MetodoPago` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  MODIFY `Id_Oferta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_Pedidos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `Id_Persona` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Id_Productos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `provedores`
--
ALTER TABLE `provedores`
  MODIFY `id_provedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `Id_Rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `Id_Sede` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `seguridad`
--
ALTER TABLE `seguridad`
  MODIFY `Id_Usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Productos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `devoluciones_ibfk_2` FOREIGN KEY (`Id_Cliente`) REFERENCES `clientes` (`Id_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`Id_Sede`) REFERENCES `sedes` (`Id_Sede`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `clientes` (`Id_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `facturadetalle`
--
ALTER TABLE `facturadetalle`
  ADD CONSTRAINT `facturadetalle_ibfk_1` FOREIGN KEY (`Id_Factura`) REFERENCES `factura` (`id_Factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facturadetalle_ibfk_2` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Productos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facturadetalle_ibfk_3` FOREIGN KEY (`Id_MetodoPago`) REFERENCES `metodosdepago` (`Id_MetodoPago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Productos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD CONSTRAINT `ofertas_ibfk_1` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Productos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`Id_Cliente`) REFERENCES `clientes` (`Id_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_provedor`) REFERENCES `provedores` (`id_provedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD CONSTRAINT `sedes_ibfk_1` FOREIGN KEY (`Id_Empresa`) REFERENCES `empresa` (`Id_Empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seguridad`
--
ALTER TABLE `seguridad`
  ADD CONSTRAINT `seguridad_ibfk_1` FOREIGN KEY (`Id_Rol`) REFERENCES `rol` (`Id_Rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seguridad_ibfk_2` FOREIGN KEY (`Id_Persona`) REFERENCES `personas` (`Id_Persona`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
