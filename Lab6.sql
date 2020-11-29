Zadanie 1 
1
SELECT AVG(udzwig) AS sredni_udzwig FROM kreatura WHERE rodzaj='wiking';
2
SELECT rodzaj, count(*), AVG(udzwig) AS sredni_udzwig FROM kreatura GROUP BY rodzaj;
3
SELECT 2020-year(dataUr) AS Wiek FROM kreatura;
SELECT AVG(2020-year(dataUr)) AS sredni_wiek FROM kreatura GROUP BY rodzaj;

Zadanie 2 
1
SELECT SUM(udzwig), rodzaj FROM kreatura GROUP BY rodzaj;
SELECT SUM(udzwig), rodzaj FROM kreatura GROUP BY rodzaj HAVING SUM(udzwig)>500;
SELECT SUM(udzwig) AS suma, rodzaj FROM kreatura GROUP BY rodzaj HAVING suma>500;
2
SELECT nazwa, AVG(waga) AS srednia_waga FROM zasob WHERE ilosc >= 4 GROUP BY nazwa HAVING SUM(waga)>10;
3
SELECT COUNT(DISTINCT(nazwa)), rodzaj FROM zasob WHERE ilosc >= 1 GROUP BY rodzaj;

Zadanie 3 

1
SELECT nazwa, SUM(ilosc) FROM kreatura k ekipunek e WHERE e.idKreatury=k.idKreatury GROUP BY nazwa;

3
SELECT k.idKreatury, k.nazwa, k.idKreatury from kreatura k LEFT JOIN ekwipunek e ON k.idKreatury=e.idKreatury;
4
SELECT k.idKreatury, k.nazwa FROM kreatura k WHERE k.idKreatury NOT IN(SELECT idKreatury from ekwipunek WHERE idKreatury IS NOT NULL);


//wszystkie rekordy z obu tabel
SELECT k.idKreatury, k.nazwa, e.idKreatury

FROM kreatura k LEFT JOIN ekwipunek e

ON k.idKreatury=e.idKreatury;

// wszystkie te rekordy, gdzie nie marynarz
// dopasowania w tabeli ekwipunek
SELECT k.idKreatury, k.nazwa, e.idKreatury
FROM kreatura k LEFT JOIN ekwipunek e
ON k.idKreatury=e.idKreatury
WHERE e.idKreatury IS NULL;

Zadanie 4 

1
SELECT k.nazwa, z.zasob FROM kreatura k, zasob z WHERE k.rodzaj = "wiking" AND year(k.dataUr) BETWEEN 1670 AND 1677;

LIKE '167%' 

SELECT * FROM ekwipunek;
SELECT * FROM kreatura, zasob NATURAL JOIN ekwipunek WHERE ekwipunek.idKreatury=kreatura.idKreatury;
SELECT DISTINCT idZasobu FROM ekwipunek;

SELECT * FROM zasob z, kreatura NATURAL JOIN ekwipunek WHERE kreatura.rodzaj="wiking" AND year(kreatura.dataUr) BETWEEN 1670 AND 1679 AND z.idZasobu=ekwipunek.idZasobu;

SELECT k.nazwa, z.nazwa
FROM kreatura k, zasob z, ekwipunek e
WHERE k.idKreatury=e.idKreatury
AND e.idZasobu=z.idZasobu
AND k.rodzaj='wiking'
AND YEAR(k.dataUr) BETWEEN 1670 AND 1679;
2
SELECT k.nazwa, z.nazwa FROM kreatura k, zasob z,ekwipunek e WHERE k.idKreatury=e.idKreatury AND e.idZasobu=z.idZasobu AND z.rodzaj ="jedzenie" ORDER BY dataUr DESC LIMIT 5;
3
SELECT k.nazwa, k2.nazwa FROM kreatura k, kreatura k2 WHERE k.idKreatury=k2.idKreatury+5; 

Zadanie 5

SELECT k.rodzaj, AVG(e.ilosc *z.waga) FROM kreatura AS k, ekwipunek AS e, zasob AS z WHERE k.idKreatury=e.idKreatury AND e.idZasobu=z.idZasobu AND k.rodzaj NOT IN('malpa','waz')GROUP BY rodzaj
HAVING SUM(e.ilosc) < 30;

SELECT * FROM kreatura
UNION
SELECT * FROM postac

SELECT DISTINCT k.rodzaj,
(SELECT CONCAT(k2.nazwa, " - " , k2.dataUr) FROM kreatura k2 WHERE k.rodzaj=k2.rodzaj ORDER BY k2.dataUr LIMIT 1) AS najstarsze,
(SELECT CONCAT(k2.nazwa, " - " , k2.dataUr) FROM kreatura k2 WHERE k.rodzaj=k2.rodzaj ORDER BY k2.dataUr DESC LIMIT 1) AS najmlodsze
FROM kreatura k;

2
SELECT m.*, k.nazwa FROM (SELECT rodzaj, max(dataUr) AS max, min(dataUr) AS min FROM kreatura GROUP BY rodzaj) m, kreatura k WHERE k.dataUr=min;

SELECT nazwa FROM kreatura 