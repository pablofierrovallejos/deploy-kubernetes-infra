CREATE DEFINER=`root`@`%` PROCEDURE `sp_consultaImagenCliente2`(
   IN dfechaini varchar(10)
)
BEGIN
	DECLARE start_date datetime;
	DECLARE end_date datetime;
	SET start_date = (SELECT CAST( CONCAT(dfechaini, ' 00:00:00') AS DATE));
	SET end_date = (SELECT STR_TO_DATE(  CONCAT(dfechaini ,'23:59:59') ,'%Y-%m-%d %H:%i:%s')) ;

    select i.idimagen, i.idventa, i.imagen, i.rutaimagen from ventas v, imagenclientes i where v.idventa = i.idventa and v.fechaventa between start_date AND end_date order by idimagen desc;
    
END