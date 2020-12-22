Zadanie 1 
DROP trigger kreatura_before_insert;
1
DELIMITER //
CREATE TRIGGER kreatura_before_insert
BEFORE INSERT ON kreatura
FOR EACH ROW
BEGIN
  IF waga < 0
  THEN
    SET NEW.waga = 0;
  END IF;
END
//
DELIMITER ;

ALTER TABLE kreatura 
MODIFY waga INT(10);

INSERT INTO kreatura(idKreatury,nazwa, rodzaj, dataUr, waga, udzwig) 
VALUES('19','Tester', 'czlowiek', '2000-12-12', '-2', '50');

Zadanie 2 
CREATE TABLE archiwum_wypraw(id_wyprawy INT(11) PRIMARY KEY,
 nazwa VARCHAR(50), 
 data_rozpoczecia DATE, 
 data_zakonczenia DATE, 
 kierownik VARCHAR(50));

 DELIMITER //
CREATE TRIGGER wyprawa_after_delete
BEFORE DELETE ON wyprawa
FOR EACH ROW
BEGIN
  DECLARE kierownik varchar(100);
    SET kierownik = (SELECT kreatura.nazwa FROM kreatura WHERE idKreatury=OLD.kierownik);
    INSERT INTO archiwum_wypraw VALUES(OLD.id_wyprawy,OLD.nazwa,OLD.data_rozpoczecia,OLD.data_zakonczenia,kierownik);
END
//
DELIMITER ;

DELETE FROM wyprawa WHERE id_wyprawy = 1;

Zadanie 3 

1

DELIMITER $$
CREATE PROCEDURE eliksir_sily(IN id int)
  BEGIN
    UPDATE kreatura SET udzwig = 1.2 * udzwig where idKreatury = id;
  END
  $$
DELIMITER ;

CALL eliksir_sily(1); 
//Udźwig Bjorna zwiększył się z 80 na 96.

2

DELIMITER //
CREATE FUNCTION litery(tekst varchar(1000))
    RETURNS varchar(1000)
BEGIN
    DECLARE duze varchar(100);
    SELECT UPPER(tekst) INTO duze;
    RETURN duze;
END //
DELIMITER;

Zadanie 4 
1
CREATE TABLE system_alarmowy(id_alarmu INT PRIMARY KEY AUTO_INCREMENT,wiadomosc VARCHAR(100) );

2
 DELIMITER //
CREATE TRIGGER sprawdz_tesciowa
AFTER INSERT ON wyprawa
FOR EACH ROW
BEGIN
DECLARE zmienna INT;
SELECT count(*) INTO zmienna
FROM etapy_wyprawy AS e, kreatura AS k, wyprawa AS w, uczestnicy AS u
AND u.id_wyprawy=w.id_wyprawy
AND k.nazwa='Tesciowa' AND e.sektor=7
IF zmienna > 0
THEN
INSERT INTO system_alarmowy VALUES(DEFAULT, 'Tesciowa nadchodzi !!!');
END IF;
END
//
DELIMITER;




Zadanie 5 

DELIMITER $$
CREATE PROCEDURE udzwig_kreatura (IN udzwig INT, OUT suma INT, srednia INT, maks INT)
BEGIN
SELECT SUM(udzwig) INTO udzwig, AVG(udzwig) INTO udzwig, udzwig ORDER BY DESC LIMIT 1;
END
$$
DELIMITER ;

CALL udzwig_kreatura(10, @p);
select @p;
