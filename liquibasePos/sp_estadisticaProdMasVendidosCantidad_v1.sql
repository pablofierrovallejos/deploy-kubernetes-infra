CREATE DEFINER=`root`@`%` PROCEDURE `sp_estadisticaProdMasVendidosCantidad`(
	IN fecventain varchar(10)
)
BEGIN

  DECLARE dfecventain date;
  SET dfecventain = (SELECT STR_TO_DATE(fecventain, '%Y-%m-%d'));
  
  
SELECT   d.nombreproducto as name,   sum(d.cantidad) as value
FROM ventas as v,  detalleventas as d
where v.idventa = d.idventa
	and YEAR(v.fechaventa) = YEAR(dfecventain)
	and  MONTH(v.fechaventa) = MONTH(dfecventain)
	GROUP BY   d.nombreproducto;


END