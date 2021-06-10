/*
1. Seleziona tutti gli ospiti che sono stati identificati con la carta di
identità
*/
SELECT `name`, `lastname`, `document_type`
FROM `ospiti`
WHERE `document_type` = "CI";

/*
2. Seleziona tutti gli ospiti che sono nati dopo il 1988
*/
SELECT `name`, `lastname`, `date_of_birth`
FROM `ospiti` 
WHERE YEAR(`date_of_birth`) >= 1988;
/*voglio contare quanti sono gli ospiti che rispettano questo filtro*/
SELECT COUNT(`date_of_birth`)
FROM `ospiti`
WHERE YEAR(`date_of_birth`) >= 1988; /*risultato 10*/

/*
3. Seleziona tutti gli ospiti che hanno più di 20 anni (al momento
dell’esecuzione della query)
*/
SELECT `name`, `date_of_birth`
FROM `ospiti`
WHERE `date_of_birth` <= (YEAR(CURRENT_DATE()) - 20); /*primo metodo*/
WHERE `date_of_birth` <= SUBDATE(CURRENT_DATE(), INTERVAL 20 YEAR); /*secondo metodo*/

/*
4. Seleziona tutti gli ospiti il cui nome inizia con la D
*/
SELECT `name`, `lastname`
FROM `ospiti`
WHERE `name` LIKE "D%";

/*
5. Calcola il totale incassato degli ordini accepted
*/
SELECT SUM(`price`)
FROM `pagamenti`
WHERE `status` = "accepted"; /*risultato 4164.00*/

/*
6. Qual è il prezzo massimo pagato?
*/
SELECT MAX(`price`)
FROM `pagamenti`; /*risultato 993.00*/

/*
7. Seleziona gli ospiti riconosciuti con patente e nati nel 1975
*/
SELECT *
FROM `ospiti`
WHERE `document_type` = "Driver License"
AND YEAR(`date_of_birth`) = "1975"; /*solo una corrispondenza - Orion Hilpert*/

/*
8. Quanti paganti sono anche ospiti?
*/
SELECT `ospite_id`
FROM `paganti`
WHERE `ospite_id` IS NOT NULL;

/*
SELECT `ospite_id`, COUNT(`ospite_id`)
FROM `paganti`
LEFT JOIN `ospiti`
ON `paganti`.`ospite_id` = `ospiti`.`id`
WHERE `ospite_id` IS NOT NULL; /*in totale 14 paganti sono anche ospiti*/

/*
9. Quanti posti letto ha l’hotel in totale?
*/
SELECT SUM(`beds`) 
FROM `stanze`; /*risultato 33*/