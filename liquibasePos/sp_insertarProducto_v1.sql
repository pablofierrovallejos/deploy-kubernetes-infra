CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarProducto`(
IN nombreproducto     VARCHAR(45),
IN precio             VARCHAR(20),
IN fechacreacion      datetime,
IN estado            VARCHAR(10),
IN nroposicion        VARCHAR(45), 
IN cantidaddisponible int,
IN imagenproducto  mediumblob)
BEGIN
INSERT INTO `db_springboot_cloud`.`productos`
(`nombreproducto`,
`precio`,
`fechacreacion`,
`estado`,
`nroposicion`,
`cantidaddisponible`,
`imagenproducto`)
VALUES
(nombreproducto,
precio,
fechacreacion,
estado,
nroposicion,
cantidaddisponible,
imagenproducto);
end