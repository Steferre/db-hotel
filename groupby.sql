/*
1. Conta gli ospiti raggruppandoli per anno di nascita
*/
SELECT COUNT(`id`) AS "num_same_year_of_birth", YEAR(`date_of_birth`)
FROM `ospiti`
GROUP BY YEAR(`date_of_birth`);

/*
2. Somma i prezzi dei pagamenti raggruppandoli per status
*/
SELECT `status`,
SUM(`price`)
FROM `pagamenti`
GROUP BY `status`;

/*
3. Conta quante volte è stata prenotata ogni stanza
*/
SELECT `stanza_id`,
COUNT(`stanza_id`)
FROM `prenotazioni`
GROUP BY `stanza_id`
ORDER BY COUNT(`stanza_id`) DESC;

/*
4. Fai una analisi per vedere se ci sono ore in cui le prenotazioni sono
più frequenti
*/
SELECT `created_at`,
HOUR(`created_at`), 
COUNT(`id`) AS "num_reservations_per_hour"
FROM `prenotazioni`
GROUP BY HOUR(`created_at`)
ORDER BY COUNT(`id`) DESC;

/*
5. Quante prenotazioni ha fatto l’ospite che ha fatto più
prenotazioni? (quante, non chi!)
*/
SELECT *, COUNT(`id`)
FROM `pagamenti`
GROUP BY `pagante_id`
ORDER BY COUNT(`id`) DESC;