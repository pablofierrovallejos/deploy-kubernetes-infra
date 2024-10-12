CREATE DEFINER=`root`@`%` PROCEDURE `sp_insertaImagenCliente`(
	IN idventa bigint(20),
    IN imagen mediumblob,
    IN ruta varchar(45)
)
BEGIN
	INSERT INTO imagenclientes(idventa, imagen, rutaimagen) values(idventa, imagen, ruta);
END