CREATE DEFINER=`root`@`%` PROCEDURE `sp_estadisticaMeasMes2`(
    IN nodo varchar(10),
	IN dfechaini varchar(10)
)
BEGIN
	DECLARE sfecha VARCHAR(255);
    DECLARE var_final INTEGER DEFAULT 0;
    
	DECLARE cursor1 CURSOR FOR SELECT  distinct(STR_TO_DATE(fechameas, '%Y-%m-%d')) FROM medicionenergia #obtiene los días del mes para la fecha ingresada
		where YEAR(fechameas) = YEAR(dfechaini)
		and  MONTH(fechameas) = MONTH(dfechaini)
		and nombrenodo = nodo;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;
    
    -- Tabla Temporal
	CREATE TEMPORARY TABLE IF NOT EXISTS TablaTemporal ( 
		energia1 varchar(10),
		potencia1 varchar(10),
		energia2 varchar(10),
		potencia2 varchar(10),
		fecha datetime
	);    
        
    set @outconsumo_energia1 = '0';
	set @outpromedio_potencia1 = '0';
    set @outconsumo_energia2 = '0';
	set @outpromedio_potencia2 = '0';
	set @fechas = '0';
    
    OPEN cursor1;
    bucle: LOOP
		FETCH cursor1 INTO sfecha;
        
		IF var_final = 1 THEN
			LEAVE bucle;
		END IF;
    
        call db_springboot_cloud.sp_estadisticaMeasDia('Meas1', sfecha, @outconsumo_energia1, @outpromedio_potencia1, @fechas);
        call db_springboot_cloud.sp_estadisticaMeasDia('Meas2', sfecha, @outconsumo_energia2, @outpromedio_potencia2, @fechas);
        INSERT TablaTemporal(energia1, potencia1, energia2, potencia2, fecha) VALUES(@outconsumo_energia1, @outpromedio_potencia1, (@outconsumo_energia2 * 1.8), @outpromedio_potencia2, sfecha);
		-- select @outconsumo_energia, @outpromedio_potencia, @fechas;
    END LOOP bucle;
	CLOSE cursor1;
  
	select DATE_FORMAT(fecha, "%d %M %Y") as name, energia1 as value1,  energia2  as value2 from TablaTemporal;
    drop table TablaTemporal;
	
END