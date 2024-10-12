CREATE  PROCEDURE sp_estadisticaVentasMes2(
	IN fecventain varchar(10)
)
BEGIN
  DECLARE dfecventain date;
  SET dfecventain = (SELECT STR_TO_DATE(fecventain, '%Y-%m-%d'));
SELECT   
  sum(totalimporte) as value
FROM ventas where YEAR(fechaventa) = YEAR(dfecventain) and  MONTH(fechaventa) = MONTH(dfecventain)
GROUP BY 
	YEAR(fechaventa),
	MONTH(fechaventa),
	DAY(fechaventa),
	nome;
END