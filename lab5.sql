Zadanie 1.

1
CREATE TABLE kreatura SELECT * FROM wikingowie.kreatura;
CREATE TABLE zasob SELECT * FROM wikingowie.zasob;
CREATE TABLE ekwipunek SELECT * FROM wikingowie.ekwipunek;
2
SELECT * FROM zasob;
3
SELECT * FROM zasob WHERE rodzaj = 'jedzenie';
4
SELECT idZasobu, ilosc FROM ekwipunek WHERE idKreatury IN (1,3,5);

Zadanie 2.

1
SELECT * FROM kreatura WHERE rodzaj != 'wiedzma' AND udzwig >= 50;
2
SELECT * FROM zasob WHERE waga BETWEEN 2 AND 5;
3
SELECT * FROM kreatura WHERE nazwa LIKE '%or%' AND udzwig BETWEEN 30 AND 70;

month(data) i można IN 
sortowanie 
sortowanie + LIMIT

SELECT * FROM zasob ORDER BY waga;
SELECT * FROM zasob ORDER BY waga LIMIT 3;


Zadanie 3.

SELECT month(data_ur) FROM postac;
SELECT data_ur FROM postac WHERE month(data_ur) = 2;

1
SELECT * FROM zasob WHERE month(dataPozyskania) BETWEN 7 AND 8;
2
SELECT * FROM zasob WHERE rodzaj != ' ' ORDER BY waga ASC;
3
select * from kreatura order by dataUr limit 5;

Zadanie 4.

1
SELECT DISTINCT rodzaj FROM zasob;
2
SELECT CONCAT(nazwa,' - ', rodzaj) FROM kreatura WHERE rodzaj LIKE 'wi%';
3
SELECT nazwa, ilosc*waga AS waga FROM zasob WHERE YEAR(dataPozyskania) BETWEEN 2000 AND 2007;



Zadanie 5.

1
SELECT nazwa, 0.3*waga AS 'odpad', 0.7*waga AS 'jedzenie(netto)' FROM zasob WHERE rodzaj = 'jedzenie';
2
SELECT * FROM zasob WHERE rodzaj IS NULL;
3
SELECT DISTINCT nazwa, rodzaj FROM zasob WHERE nazwa LIKE 'Ba%' OR nazwa LIKE '%os' ORDER BY nazwa ASC;
