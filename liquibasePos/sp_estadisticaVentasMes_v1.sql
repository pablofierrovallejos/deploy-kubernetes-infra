CREATE PROCEDURE sp_estadisticaVentasMes(
    IN fecventain VARCHAR(10)
)
BEGIN
    DECLARE dfecventain DATE;
    SET dfecventain = STR_TO_DATE(fecventain, '%Y-%m-%d');

    SELECT  
        CASE 
            WHEN DAYNAME(fechaventa) = 'Monday' THEN CONCAT('Lunes ', DAY(fechaventa))
            WHEN DAYNAME(fechaventa) = 'Tuesday' THEN CONCAT('Martes ', DAY(fechaventa))
            WHEN DAYNAME(fechaventa) = 'Wednesday' THEN CONCAT('Miercoles ', DAY(fechaventa))
            WHEN DAYNAME(fechaventa) = 'Thursday' THEN CONCAT('Jueves ', DAY(fechaventa))
            WHEN DAYNAME(fechaventa) = 'Friday' THEN CONCAT('Viernes ', DAY(fechaventa))
            WHEN DAYNAME(fechaventa) = 'Saturday' THEN CONCAT('Sabado ', DAY(fechaventa))
            WHEN DAYNAME(fechaventa) = 'Sunday' THEN CONCAT('Domingo ', DAY(fechaventa)) 
        END AS namedia,
        SUM(totalimporte) AS value
    FROM ventas 
    WHERE YEAR(fechaventa) = YEAR(dfecventain) 
      AND MONTH(fechaventa) = MONTH(dfecventain)
    GROUP BY DAY(fechaventa),namedia;
END;