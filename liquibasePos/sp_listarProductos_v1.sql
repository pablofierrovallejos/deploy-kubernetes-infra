CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarProductos`()
BEGIN
	select idproductos, nombreproducto, precio, fechacreacion, estado, nroposicion, cantidaddisponible  from productos;
END