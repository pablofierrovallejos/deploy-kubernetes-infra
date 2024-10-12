CREATE DEFINER=`root`@`%` PROCEDURE `sp_consultarMedicionEnergia`(
IN nodo varchar(10),
IN fecventain varchar(10)
)
BEGIN
	DECLARE start_date datetime;
	DECLARE end_date datetime;
	SET start_date = (SELECT CAST( CONCAT(fecventain, ' 00:00:00') AS DATE));
	SET end_date = (SELECT STR_TO_DATE(  CONCAT(fecventain ,'23:59:59') ,'%Y-%m-%d %H:%i:%s')) ;


	select 
    idregistro,
    nombrenodo,
	uptime,
	volts,
	current,
	power,
	energy,
	fechameas
  from medicionenergia WHERE nombrenodo = nodo AND fechameas between start_date and end_date; 
END