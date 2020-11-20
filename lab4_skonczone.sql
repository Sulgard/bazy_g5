1.
a)
#sprawdzam którzy wikingowie są najstarsi
SELECT * FROM postac WHERE rodzaj = 'wiking' AND nazwa!='Bjorn' ORDER BY data_urodzenia ASC; //rosnąco ASC //malejąco DESC
#uśmiercam wikingów
DELETE FROM postac WHERE id_postaci=7;
DELETE FROM postac WHERE id_postaci=8;
b)ALTER TABLE postac DROP PRIMARY KEY;
#kolumna z atrybutem auto_increment musi być kluczem głownym,
#usuwanie auto_increment
ALTER TABLE postac MODIFY id_postaci int;
ALTER TABLE postac DROP FOREIGN KEY id_postaci;
walizka_ibfk_1
walizka_ibfk_2
ALTER TABLE walizka DROP FOREIGN KEY walizka_ibfk_1;
ALTER TABLE walizka DROP FOREIGN KEY walizka_ibfk_2;
przetwory_ibfk_1
przetwory_ibfk_2
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_2;
Zadanie 2.
ALTER TABLE postac ADD COLUMN pesel varchar(11) FIRST;
#domyślnie kolumna zostanie wypełniona wartościami NULL
#najpierw UPDATE aby wartości w kolumnie pesel były unikalne
UPDATE postac SET pesel='jedenascie cyfer'+id_postaci;
ALTER TABLE postac ADD PRIMARY KEY(pesel);
b)
ALTER TABLE postac MODIFY rodzaj enum ('wiking','ptak','kobieta','syrena');
INSERT INTO postac(pesel,id_postaci,nazwa,rodzaj,data_ur) VALUES('77889933551',9,'Gertruda Nieszczera','syrena','1700-01-01');
3.
SELECT nazwa FROM postac WHERE nazwa LIKE '%a%';
UPDATE postac SET statek = 'dwa' WHERE nazwa LIKE '%a%';
UPDATE statek SET max_ladownosc = max_ladownosc * 0.7 WHERE data_wodowania>'1900-12-31' AND data_wodowania<'2020-12-31'
LUB
UPDATE statek SET max_ladownosc = mex_ladownosc * 0.7 WHERE data_wodowania BETWEEN '1901-01-01' AND '2001-12-31';
4.
a)
#Aktualizacja rodzaj, dodanie węża
ALTER TABLE postac MODIFY rodzaj ENUM('wiking','ptak','kobieta','syrena','waz');
#Dodanie węża Loko do tabeli postac
INSERT INTO postac(pesel,nazwa,rodzaj,data_ur) VALUES('00234761231','Loko','waz','1700-08-28');
b) i c)
Stworzenie tabeli marynarz na podstawie tabeli postac
CREATE TABLE marynarz LIKE postac;
INSERT INTO marynarz SELECT * FROM postac WHERE statek = 'dwa'; INSERT INTO marynarz SELECT * FROM postac WHERE statek IS NOT NULL; (Pomija punkt c)
#Druga opcja(nie ma zdefiniowanych kluczy głownych i obcych)
CREATE TABLE marynarz2 SELECT * FROM postac WHERE statek IS NOT NULL;
5.
a)UPDATE postac SET statek = NULL WHERE statek = 'dwa';
b)DELETE FROM postac WHERE id_postaci=4;
c)DELETE FROM postac
d)DROP TABLE statek;
e)CREATE TABLE zwierz(id INT AUTO_INCREMENT PRIMARY KEY,nazwa VARCHAR(50),wiek INT);
f)INSERT INTO zwierz SELECT id_postaci, nazwa, wiek FROM postac WHERE rodzaj='ptak' AND rodzaj='waz';



