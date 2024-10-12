CREATE DEFINER=`root`@`%` PROCEDURE `sp_estadisticaVentasMesProd`(
	IN fecventain varchar(10),
    IN nomprod varchar(50)
)
BEGIN

  DECLARE dfecventain date;
  SET dfecventain = (SELECT STR_TO_DATE(fecventain, '%Y-%m-%d'));
  
  CREATE TEMPORARY TABLE IF NOT EXISTS TablaTemporalProd ( 
		name int(2),
		value int(11),
        totalmonto int(11),
        nombreproducto varchar(50)
  );    
  
#SELECT    DAY(v.fechaventa) dia, sum(d.cantidad) as totalcantidad, sum(d.preciosubtotal) as totalmonto, d.nombreproducto as producto 

INSERT INTO  TablaTemporalProd( 
SELECT   DAY(fechaventa)  as name , sum(d.cantidad) as value, sum(d.preciosubtotal) as totalmonto, d.nombreproducto as producto 
FROM ventas as v,  detalleventas as d
where v.idventa = d.idventa
	and YEAR(v.fechaventa) = YEAR(dfecventain)
	and  MONTH(v.fechaventa) = MONTH(dfecventain)
    and d.nombreproducto = nomprod
	GROUP BY    DAY(fechaventa) , d.nombreproducto
    #GROUP BY YEAR(v.fechaventa), MONTH(v.fechaventa), DAY(v.fechaventa),  d.nombreproducto;
);

SELECT name, value , totalmonto, nombreproducto FROM TablaTemporalProd order by name asc;
drop table TablaTemporalProd;

END