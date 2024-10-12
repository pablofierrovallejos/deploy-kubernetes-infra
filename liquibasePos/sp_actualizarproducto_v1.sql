CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarProducto`(
IN idprod				 int,
IN nombreproducto_in     VARCHAR(45),
IN precio_in             VARCHAR(20),
IN fechacreacion_in      datetime,
IN estado_in             VARCHAR(10),
IN nroposicion_in        VARCHAR(45), 
IN cantidaddisponible_in int,
IN imagenproducto_in  	 mediumblob)
BEGIN
	update productos set 
    nombreproducto = nombreproducto_in,
    precio = precio_in,
    fechacreacion = fechacreacion_in,
    estado = estado_in, 
    nroposicion = nroposicion_in,
    cantidaddisponible = cantidaddisponible_in,
    imagenproducto = imagenproducto_in
    where idproductos = idprod;
END