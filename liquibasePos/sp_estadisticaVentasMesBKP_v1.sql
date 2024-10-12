CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_estadisticaVentasMesBKP`(
	IN fecventain varchar(10)
)
BEGIN

  DECLARE dfecventain date;
  SET dfecventain = (SELECT STR_TO_DATE(fecventain, '%Y-%m-%d'));

SELECT  CONCAT('Día ' ,DAY(fechaventa)) as name,  sum(totalimporte) as value
FROM ventas where YEAR(fechaventa) = YEAR(dfecventain)
	and  MONTH(fechaventa) = MONTH(dfecventain)
GROUP BY YEAR(fechaventa), MONTH(fechaventa), DAY(fechaventa), name;

END