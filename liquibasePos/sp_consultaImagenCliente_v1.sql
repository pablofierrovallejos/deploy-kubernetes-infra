CREATE DEFINER=`root`@`%` PROCEDURE `sp_consultaImagenCliente`()
BEGIN
	SELECT idimagen, idventa, imagen, rutaimagen FROM  imagenclientes order by idimagen desc;
END