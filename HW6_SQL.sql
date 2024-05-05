/*
Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER //

DROP FUNCTION IF EXISTS date_sec//
CREATE FUNCTION date_sec (seconds INT)
RETURNS varchar(255)
DETERMINISTIC
BEGIN 
  DECLARE days, hours, minutes int default 0;
  DECLARE res varchar(255);
	set days = seconds / 86400;
	set seconds = seconds % 86400;
	set hours = seconds / 3600;
	set seconds = seconds % 3600;
 	set minutes = seconds / 60;
	set seconds = seconds % 60;
  set res = concat(days, " days ", hours, ' hours ', minutes, ' minutes ',seconds, ' seconds');
  RETURN res;
  END //
  
  DELIMITER ;
 select date_sec(123456);
 
 /*
Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
*/

DELIMITER //
DROP PROCEDURE IF EXISTS ten //
CREATE PROCEDURE ten ()
BEGIN
	DECLARE res int DEFAULT 0;
  DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (n INT);
  While res < 10 Do
		Set res = res + 2;
		INSERT INTO nums VALUES(res);
  end while;
  SELECT * FROM nums;
END//

call ten();