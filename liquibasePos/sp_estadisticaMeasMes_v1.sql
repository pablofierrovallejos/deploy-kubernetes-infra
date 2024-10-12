CREATE DEFINER=`root`@`%` PROCEDURE `sp_estadisticaMeasMes`(
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
		energia varchar(10),
		potencia varchar(10),
		fecha datetime
	);    
        
    set @outconsumo_energia = '0';
	set @outpromedio_potencia = '0';
	set @fechas = '0';
    
    OPEN cursor1;
    bucle: LOOP
		FETCH cursor1 INTO sfecha;
        
		IF var_final = 1 THEN
			LEAVE bucle;
		END IF;
    
        call db_springboot_cloud.sp_estadisticaMeasDia('Meas1', sfecha, @outconsumo_energia, @outpromedio_potencia, @fechas);
        IF @outconsumo_energia is not null or  @outpromedio_potencia is not null and  @fechas is not null then
			INSERT TablaTemporal(energia, potencia, fecha) VALUES(@outconsumo_energia, @outpromedio_potencia, @fechas);
        END IF;
        
		-- select @outconsumo_energia, @outpromedio_potencia, @fechas;
    END LOOP bucle;
	CLOSE cursor1;
    
    #select * from TablaTemporal;
	select DATE_FORMAT(fecha, "%D %M %Y") as name, energia as value from TablaTemporal;
    drop table TablaTemporal;
	
END