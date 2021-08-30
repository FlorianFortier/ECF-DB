UPDATE `User`
SET FirstName = "Paul"
WHERE id_User = 1;

UPDATE `User`
SET LastName = "Marks"
WHERE id_User = 1;

UPDATE `request`
SET `Status` = "Done"
WHERE id_request = 2;

/* Montre le nombre de ticket ouvert pour les operateurs */

SELECT Count(*) FROM `request`
WHERE `Status` = "todo"

/* Prix Moyen d\'une commande */

SELECT AVG(`Price_Dollars`) FROM `Order`


/* supprimer l'erreur de constraint pour le delete ci-dessous*/

ALTER TABLE `request` DROP FOREIGN KEY `request_ibfk_1`;

ALTER TABLE `request` ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`User_id`) 
REFERENCES `request` (`id_request`) ON DELETE CASCADE;


DELETE FROM `request`
WHERE `Status` = "Done";

/* au cas ou un bug ferait l'id n'est pas auto incrementé*/

DELETE FROM `User` 
WHERE id_User IS NULL;


DELETE FROM `Order`
WHERE Order_Number = 174786;

/* Total depense par client dans l'ordre */

SELECT `User_id`, SUM(`Price_Dollars`) AS Price FROM `Order`
GROUP BY `User_id`
ORDER BY Price DESC


SELECT `id_User` FROM `User`
ORDER BY `FirstName`, `LastName`, `User_Mail`;


/* Ne fonctionne pas */

-- SELECT Lastname_Op, id_o
-- FROM (
--         SELECT SUM(request_id) as id_r, Operator_id as id_o
--         FROM Operator_Request_link
--         GROUP BY id_o
--     ) as op_link
-- ORDER BY Lastname_Op



-- DROP PROCEDURE IF EXISTS list_last_orders; /* debug */


/* fonctionne mais retourne rien */
DELIMITER $$
CREATE PROCEDURE list_last_orders(IN n INT)
BEGIN
    SELECT `Date` FROM `request`
    ORDER BY `Date` DESC
    LIMIT 2;
END$$
DELIMITER ;

/*fonctionne aussi mais ne retourne rien */

DROP VIEW IF EXISTS V_request_details;
CREATE VIEW V_request_details
AS SELECT `id_request`, `Object`, `Message`, `Date`, `Status`, `User_id`
FROM request
INNER JOIN ticket ON id_ticket
LEFT JOIN Operator ON id_Operator;