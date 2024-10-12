CREATE TABLE `costos` (
  `idcostos` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(45) DEFAULT NULL,
  `montototal` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcostos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1