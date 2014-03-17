DELIMITER $$

DROP PROCEDURE IF EXISTS `machine`.`HOURLY_CONSUMPTION` $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `machine`.`HOURLY_CONSUMPTION`(gvn_dateHour timestamp)
BEGIN

-- report_data1 = solar, report_data2 = load, report_data3 = utility

declare sp_machine_id varchar(100);
declare done int default 0;

declare sp_hr_data1 double default 0.0;
declare sp_pre_data1 double default 0.0;
declare sp_gvn_data1 double default 0.0;

declare sp_hr_data2 double default 0.0;
declare sp_pre_data2 double default 0.0;
declare sp_gvn_data2 double default 0.0;

declare sp_hr_data3 double default 0.0;
declare sp_pre_data3 double default 0.0;
declare sp_gvn_data3 double default 0.0;

declare sp_avg_solarV double default 0.0;
declare sp_avg_loadV double default 0.0;
declare sp_avg_utilityV double default 0.0;
declare sp_avg_batteryV double default 0.0;

declare sp_avg_solarC double default 0.0;
declare sp_avg_loadC double default 0.0;
declare sp_avg_utilityC double default 0.0;

declare sp_avg_solarP double default 0.0;
declare sp_avg_loadP double default 0.0;
declare sp_avg_utilityP double default 0.0;

declare sp_max_solarV double default 0.0;
declare sp_max_loadV double default 0.0;
declare sp_max_utilityV double default 0.0;
declare sp_max_batteryV double default 0.0;

declare sp_max_solarC double default 0.0;
declare sp_max_loadC double default 0.0;
declare sp_max_utilityC double default 0.0;

declare sp_max_solarP double default 0.0;
declare sp_max_loadP double default 0.0;
declare sp_max_utilityP double default 0.0;

declare pre_dateHour timestamp;

DECLARE cur_site_info cursor for
select imei_no from machine_details;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN cur_site_info;
REPEAT
   FETCH cur_site_info INTO sp_machine_id;
   IF NOT done THEN

    select gvn_dateHour-INTERVAL 1 HOUR  into pre_dateHour;

set sp_pre_data1= (SELECT COALESCE(data11,0.0) FROM history_details_today
   WHERE imei_no=sp_machine_id AND data_timestamp < gvn_dateHour
    ORDER BY data_timestamp DESC LIMIT 1);

set sp_pre_data2= (SELECT COALESCE(data13,0.0) FROM history_details_today
   WHERE imei_no=sp_machine_id AND data_timestamp < gvn_dateHour
    ORDER BY data_timestamp DESC LIMIT 1);

set sp_pre_data3= (SELECT COALESCE(data12,0.0) FROM history_details_today
   WHERE imei_no=sp_machine_id AND data_timestamp < gvn_dateHour
    ORDER BY data_timestamp DESC LIMIT 1);

set sp_gvn_data1= (SELECT COALESCE(data11,0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour)
     ORDER BY data_timestamp DESC LIMIT 1);

set sp_gvn_data2= (SELECT COALESCE(data13,0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour)
     ORDER BY data_timestamp DESC LIMIT 1);

set sp_gvn_data3= (SELECT COALESCE(data12,0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour)
     ORDER BY data_timestamp DESC LIMIT 1);

    set sp_hr_data1 = ROUND((ifnull(sp_gvn_data1,0.0) - ifnull(sp_pre_data1,0.0)),2);
    set sp_hr_data2 = ROUND((ifnull(sp_gvn_data2,0.0) - ifnull(sp_pre_data2,0.0)),2);
    set sp_hr_data3 = ROUND((ifnull(sp_gvn_data3,0.0) - ifnull(sp_pre_data3,0.0)),2);

	IF sp_hr_data1<0 THEN
	  	SET sp_hr_data1 = 0.0;
  	END IF;
	IF sp_hr_data2<0 THEN
	  	SET sp_hr_data2 = 0.0;
  	END IF;
	IF sp_hr_data3<0 THEN
	  	SET sp_hr_data3 = 0.0;
  	END IF;

-- avg data

set sp_avg_solarV = (SELECT COALESCE(ROUND(AVG(data1),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_avg_loadV = (SELECT COALESCE(ROUND(AVG(data4),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_avg_utilityV = (SELECT COALESCE(ROUND(AVG(data3),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_avg_batteryV = (SELECT COALESCE(ROUND(AVG(data2),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_avg_solarC = (SELECT COALESCE(ROUND(AVG(data5),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_avg_loadC = (SELECT COALESCE(ROUND(AVG(data7),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_avg_utilityC = (SELECT COALESCE(ROUND(AVG(data6),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_avg_solarP = (SELECT COALESCE(ROUND(AVG(data8),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_avg_loadP = (SELECT COALESCE(ROUND(AVG(data10),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_avg_utilityP = (SELECT COALESCE(ROUND(AVG(data9),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

-- peak (max) data

set sp_max_solarV = (SELECT COALESCE(ROUND(MAX(data1),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_max_loadV = (SELECT COALESCE(ROUND(MAX(data4),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_max_utilityV = (SELECT COALESCE(ROUND(MAX(data3),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_max_batteryV = (SELECT COALESCE(ROUND(MAX(data2),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_max_solarC = (SELECT COALESCE(ROUND(MAX(data5),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_max_loadC = (SELECT COALESCE(ROUND(MAX(data7),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_max_utilityC = (SELECT COALESCE(ROUND(MAX(data6),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_max_solarP = (SELECT COALESCE(ROUND(MAX(data8),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_max_loadP = (SELECT COALESCE(ROUND(MAX(data10),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

set sp_max_utilityP = (SELECT COALESCE(ROUND(MAX(data9),2),0.0) FROM history_details_today
     WHERE imei_no=sp_machine_id AND date(data_timestamp) = date(gvn_dateHour) and hour(data_timestamp) = hour(gvn_dateHour));

	insert into report_data(imei_no,date,HOUR,REPORT_DATA1,REPORT_DATA2,REPORT_DATA3,
	  SOLAR_V,LOAD_V,UTILIT_V,BATTERY_V,SOLAR_C,LOAD_C,UTILIT_C,SOLAR_P,LOAD_P,UTILIT_P,
	  MAX_SOLAR_V,MAX_LOAD_V,MAX_UTILIT_V,MAX_BATTERY_V,MAX_SOLAR_C,MAX_LOAD_C,MAX_UTILIT_C,MAX_SOLAR_P,MAX_LOAD_P,MAX_UTILIT_P)
          values(sp_machine_id,date(gvn_dateHour),hour(gvn_dateHour),ifnull(sp_hr_data1,0.0),ifnull(sp_hr_data2,0.0),ifnull(sp_hr_data3,0.0),
          ifnull(sp_avg_solarV,0.0),ifnull(sp_avg_loadV,0.0),ifnull(sp_avg_utilityV,0.0),ifnull(sp_avg_batteryV,0.0),ifnull(sp_avg_solarC,0.0),ifnull(sp_avg_loadC,0.0),ifnull(sp_avg_utilityC,0.0),ifnull(sp_avg_solarP,0.0),ifnull(sp_avg_loadP,0.0),ifnull(sp_avg_utilityP,0.0),
          ifnull(sp_max_solarV,0.0),ifnull(sp_max_loadV,0.0),ifnull(sp_max_utilityV,0.0),ifnull(sp_max_batteryV,0.0),ifnull(sp_max_solarC,0.0),ifnull(sp_max_loadC,0.0),ifnull(sp_max_utilityC,0.0),ifnull(sp_max_solarP,0.0),ifnull(sp_max_loadP,0.0),ifnull(sp_max_utilityP,0.0));

    SET sp_hr_data1 = 0.0;
    SET sp_pre_data1 = 0.0;
    SET sp_gvn_data1 = 0.0;

    SET sp_hr_data2 = 0.0;
    SET sp_pre_data2 = 0.0;
    SET sp_gvn_data2 = 0.0;

    SET sp_hr_data3 = 0.0;
    SET sp_pre_data3 = 0.0;
    SET sp_gvn_data3 = 0.0;

	SET sp_avg_solarV = 0.0;
	SET sp_avg_loadV = 0.0;
	SET sp_avg_utilityV = 0.0;
	SET sp_avg_batteryV = 0.0;

	SET sp_avg_solarC = 0.0;
	SET sp_avg_loadC = 0.0;
	SET sp_avg_utilityC = 0.0;

	SET sp_avg_solarP = 0.0;
	SET sp_avg_loadP = 0.0;
	SET sp_avg_utilityP = 0.0;

SET sp_max_solarV = 0.0;
SET sp_max_loadV = 0.0;
SET sp_max_utilityV = 0.0;
SET sp_max_batteryV = 0.0;

SET sp_max_solarC = 0.0;
SET sp_max_loadC = 0.0;
SET sp_max_utilityC = 0.0;

SET sp_max_solarP = 0.0;
SET sp_max_loadP = 0.0;
SET sp_max_utilityP = 0.0;

   END IF;
UNTIL done END REPEAT;
CLOSE cur_site_info;
END $$
DELIMITER ;