CREATE DEFINER=`root`@`%` PROCEDURE `sp_insertarMedicionEnergia`(
IN idmuestra  INT(10),
IN nombrenodo VARCHAR(10),
IN uptime	  VARCHAR(10),
IN volts      VARCHAR(6),
IN scurrent    VARCHAR(6),
IN power      VARCHAR(10),
IN energy     VARCHAR(10)
)
BEGIN
DECLARE actual_date datetime;
#SET actual_date = ( select DATE_ADD(now() , INTERVAL -11 hour));
SET actual_date = now() ;

IF energy > 0 THEN
	INSERT INTO `db_springboot_cloud`.`medicionenergia`
	(`nombrenodo`,
	`idmuestra`,
	`uptime`,
	`volts`,
	`current`,
	`power`,
	`energy`,
	`fechameas`
	)
	VALUES
	(nombrenodo,
	idmuestra,
	uptime,
	volts,
	scurrent,
	power,
	energy,
	actual_date);
END IF;
END