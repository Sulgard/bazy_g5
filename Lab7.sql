Zadanie 1 

1 
DELETE FROM kreatura;
INSERT INTO kreatura SELECT * FROM wikingowie.kreatura;
INSERT INTO uczestnicy SELECT * FROM wikingowie.uczestnicy;
INSERT INTO sektor SELECT * FROM wikingowie.sektor;
INSERT INTO wyprawa SELECT * FROM wikingowie.wyprawa;
INSERT INTO etapy_wyprawy SELECT * FROM wikingowie.etapy_wyprawy;

2
SELECT nazwa 
FROM kreatura k 
WHERE k.idKreatury 
NOT IN (SELECT id_uczestnika FROM uczestnicy);
3
SELECT w.nazwa, sum(e.ilosc) AS ilosc_ekwipunku
FROM wyprawa w, ekwipunek e, kreatura k, uczestnicy u, zasob z 
WHERE e.idKreatury=k.idKreatury 
AND u.id_wyprawy=w.id_wyprawy
AND u.id_uczestnika=k.idKreatury
AND e.idZasobu=z.idZasobu
GROUP BY w.nazwa;

Zadanie 2

1
SELECT w.nazwa, count(u.id_uczestnika) AS liczba_uczestnikow ,group_concat(k.nazwa) AS imiona_uczestnikow 
FROM wyprawa w, kreatura k, uczestnicy u 
WHERE u.id_wyprawy=w.id_wyprawy 
AND u.id_uczestnika=k.idKreatury 
GROUP BY w.nazwa;

//brudnopis
SELECT id.idKreatury, GROUP_CONCAT(id_Zasobu separator '|') FROM ekwipunek;
SELECT idKreatury, 
group_concat(idZasobu separator '')
FROM ekwipunek GROUP BY idKreatury;


2
SELECT e.idEtapu, s.nazwa AS "nazwa sektora",k.nazwa AS "nazwa kierownika"
FROM etapy_wyprawy e, sektor s, wyprawa w, kreatura k 
WHERE e.sektor=s.id_sektora 
AND k.idKreatury=w.kierownik 
AND w.id_wyprawy=e.idWyprawy
ORDER BY data_rozpoczecia, e.kolejnosc;


Zadanie 3 

1

SELECT s.nazwa, COUNT(e.sektor) AS "ilosc odwiedzin" 
FROM sektor s, etapy_wyprawy e
WHERE e.sektor=s.id_sektora 
GROUP BY s.nazwa;

2

SELECT k.nazwa, COUNT(u.id_wyprawy), 
IF(COUNT(u.id_wyprawy) = 0,"nie bral udzialu","bral udzial") 
AS "wyprawa"
FROM kreatura k, uczestnicy u 
WHERE k.idKreatury=u.id_uczestnika 
GROUP BY k.nazwa;

Zadanie 4 

1
SELECT w.nazwa, SUM(LENGTH(e.dziennik)) 
FROM etapy_wyprawy AS e
JOIN wyprawa AS w 
ON e.idWyprawy = w.id_wyprawy
GROUP BY w.nazwa HAVING SUM(LENGTH(e.dziennik)) < 400;
2
SELECT w.nazwa,COUNT(DISTINCT(u.id_uczestnika)),
SUM(e.ilosc*z.waga)/COUNT(DISTINCT(u.id_uczestnika)) AS "średnia waga"
FROM wyprawa AS w
LEFT JOIN uczestnicy AS u ON w.id_wyprawy = u.id_wyprawy
LEFT JOIN kreatura AS k ON u.id_uczestnika = k.idKreatury   
LEFT JOIN ekwipunek AS e ON k.idKreatury= e.idKreatury
LEFT JOIN zasob AS z ON e.idZasobu = z.idZasobu
GROUP BY w.nazwa;

Zadanie 5

SELECT k.nazwa, DATEDIFF(w.data_rozpoczecia,k.dataUr) AS "Wiekw dniach" 
FROM wyprawa AS w 
JOIN uczestnicy AS u ON w.id_wyprawy=u.id_wyprawy
JOIN kreatura AS k ON k.idKreatury=u.id_uczestnika
JOIN etapy_wyprawy AS e ON w.id_wyprawy=e.idWyprawy
WHERE e.sektor = 7;
