/*
1. Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?
*/
/*
SELECT `paganti`.`name`,
        `paganti`.`lastname`,
        `pagamenti`.`pagante_id`,
        COUNT(`paganti`.`id`) AS "num_payment_done"
FROM `paganti`
INNER JOIN `pagamenti` 
ON `paganti`.`id` = `pagamenti`.`pagante_id`
GROUP BY `pagamenti`.`pagante_id`
HAVING COUNT(`paganti`.`id`) > 2
ORDER BY COUNT(`paganti`.`id`) DESC;
*/

SELECT `ospiti`.`name`,
        `ospiti`.`lastname`,
        COUNT(`prenotazioni_has_ospiti`.`prenotazione_id`) AS `num_reserv_done`
FROM `prenotazioni_has_ospiti`
LEFT JOIN `ospiti` 
ON `prenotazioni_has_ospiti`.`ospite_id` = `ospiti`.`id`
GROUP BY `ospiti`.`id`
HAVING `num_reserv_done` > 2

/*
2. Stampare tutti gli ospiti per ogni prenotazione
*/
SELECT `ospiti`.`name`,
	`ospiti`.`lastname`
FROM `ospiti`
INNER JOIN `prenotazioni_has_ospiti`
ON `ospiti`.`id` = `prenotazioni_has_ospiti`.`ospite_id`;

/*
3. Stampare Nome, Cognome, Prezzo e Pagante per tutte le
prenotazioni fatte a Maggio 2018
*/
SELECT `paganti`.`name`,
	`paganti`.`lastname`,
        `pagamenti`.`price`,
        `pagamenti`.`created_at`
FROM `paganti`
INNER JOIN `pagamenti` 
ON `paganti`.`id` = `pagamenti`.`pagante_id`
WHERE YEAR(`pagamenti`.`created_at`) = "2018-05";


/*
4. Fai la somma di tutti i prezzi delle prenotazioni per le stanze del
primo piano
*/
SELECT SUM(`pagamenti`.`price`) AS "tot_1st_floor_rooms_payment"
FROM `pagamenti`
INNER JOIN `prenotazioni`
ON `pagamenti`.`prenotazione_id` = `prenotazioni`.`id`
INNER JOIN `stanze`
ON `prenotazioni`.`stanza_id` = `stanze`.`id`
WHERE `floor` = 1;

/*
5. Prendi i dati di fatturazione per la prenotazione con id=7
*/
SELECT `pagamenti`.`status`,
	`pagamenti`.`price`,
        `paganti`.`name`,
        `paganti`.`lastname`,
        `paganti`.`address`,
        `ospiti`.`document_type`,
        `ospiti`.`document_number`,
        `ospiti`.`created_at`
FROM `pagamenti`
INNER JOIN `paganti`
ON `pagamenti`.`pagante_id` = `paganti`.`id`
INNER JOIN `ospiti`
ON `paganti`.`ospite_id` = `ospiti`.`id`
WHERE `pagamenti`.`prenotazione_id` = 7;


/*
6. Le stanze sono state tutte prenotate almeno una volta?
(Visualizzare le stanze non ancora prenotate)
*/
SELECT `stanze`.`id`,
	`stanze`.`room_number`,
        `stanze`.`floor`,
        `stanze`.`beds`,
        `prenotazioni`.`stanza_id`
FROM `prenotazioni`
RIGHT JOIN `stanze`
ON `prenotazioni`.`stanza_id` = `stanze`.`id`
WHERE `prenotazioni`.`stanza_id` IS NULL;