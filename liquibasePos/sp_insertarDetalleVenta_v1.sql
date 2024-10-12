CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarDetalleVenta`(
  IN `idventa_in` bigint unsigned,
  IN `nombreproducto_in` VARCHAR(45),
  IN `idproducto_in` VARCHAR(45),
  IN `cantidad_in` int,
  IN `preciosubtotal_in` int
)
BEGIN
INSERT INTO `db_springboot_cloud`.`detalleventas`(
  `idventa`,
  `nombreproducto`,
  `idproducto`,
  `cantidad`,
  `preciosubtotal`
)VALUES(
  idventa_in,
  nombreproducto_in,
  idproducto_in,
  cantidad_in,
  preciosubtotal_in
);
commit;
END