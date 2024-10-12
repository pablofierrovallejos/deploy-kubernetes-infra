CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultarProducto`(
IN idproductosin int
)
BEGIN
	select idproductos, nombreproducto, precio, fechacreacion, estado, nroposicion, cantidaddisponible from productos WHERE idproductos = idproductosin;
END