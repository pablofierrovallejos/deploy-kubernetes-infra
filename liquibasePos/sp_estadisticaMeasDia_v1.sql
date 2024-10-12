CREATE DEFINER=`root`@`%` PROCEDURE `sp_estadisticaMeasDia`(
    IN nodo varchar(10),
	IN dfechaini varchar(10),
    OUT outconsumo_energia varchar(10),
    OUT outpromedio_potencia varchar(10),
    OUT fechas datetime
)
BEGIN

DECLARE dfecha date;
DECLARE promedioenergy int(10);
SET dfecha = (SELECT STR_TO_DATE(dfechaini, '%Y-%m-%d'));

SET  promedioenergy = (
	SELECT avg(energy)
	FROM medicionenergia 
		where YEAR(fechameas) = YEAR(dfecha)
		and  MONTH(fechameas) = MONTH(dfecha)
		and  DAY(fechameas) = DAY(dfecha)
		and nombrenodo = nodo
);

SELECT (max(energy) - min(energy)) as consumo_energia  , ROUND(avg(power),2) as promedio_potencia, max(fechameas) as fecha INTO outconsumo_energia, outpromedio_potencia, fechas
FROM medicionenergia 
	where YEAR(fechameas) = YEAR(dfecha)
	and  MONTH(fechameas) = MONTH(dfecha)
    and  DAY(fechameas) = DAY(dfecha)
    and nombrenodo = nodo
    and power < 6000	# Que la potencia no sobrepase los 10Kw;
    and energy > 0
    and volts between  200 and   250
    and current between 0 and  20;
    
    #and energy between  (promedioenergy - 20000) and (promedioenergy + 20000) ; #toma muestras que no se alejen de 50 kwatts del promedio
    
END