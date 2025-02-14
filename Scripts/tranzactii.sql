COMMIT;

//1.              Achizitionarea biletelor pentru o proiectie

// Utilizatorul cu ID-ul 300 doreste achizitionarea biletului cu locul 4 la proiectia 100
// De asemenea, aceasta doreste sa cumpere bilete si pentru copiii sai cu numele Darius si Ana cu locurile 5 si 6
SET TRANSACTION NAME 'ticket_online_acquisition_1';
// Biletul utilizatorului 300
UPDATE ticket
SET client_ID = 300, 
    status_ID = (SELECT status_ID FROM client WHERE client_ID = 300),
    client_name = (SELECT first_name || ' ' || last_name FROM client WHERE client_ID = 300),
    ticket_price = (SELECT projection_price - projection_price*(SELECT NVL(discount_percentage, 0) FROM status WHERE status_ID = (SELECT status_ID FROM client WHERE client_ID = 300)) 
                    FROM projection WHERE projection_ID = 100)
WHERE projection_ID = 100 AND seat = 4 AND client_ID IS NULL;
SAVEPOINT after_maria;

// Biletul lui Darius (tot cu ID-ul Mariei)
UPDATE ticket 
SET client_ID = 300, 
    status_ID = 1,
    client_name = 'Darius Popescu',
    ticket_price = (SELECT projection_price - projection_price * (SELECT NVL(discount_percentage, 0) FROM status WHERE status_ID = 1) 
                    FROM projection WHERE projection_ID = 100)
WHERE projection_ID = 100 AND seat = 5 AND client_ID IS NULL;
SAVEPOINT after_darius;

// Biletul Anei (tot cu ID-ul Mariei)
UPDATE ticket
SET client_ID = 300, 
    status_ID = 1,
    client_name = 'Ana Popescu',
    ticket_price = (SELECT projection_price - projection_price * (SELECT NVL(discount_percentage, 0) FROM status WHERE status_ID = 1) 
                    FROM projection WHERE projection_ID = 100)
WHERE projection_ID = 100 AND seat = 6 AND client_ID IS NULL;
COMMIT;

// Utilizatorii 304 si 306 doresc achizitionarea biletelor cu locurile 1 si 2 la proiectia 109
SET TRANSACTION NAME 'ticket_online_acquisition_2';
// Biletul utilizatorului 304
UPDATE ticket
SET client_ID = 304, 
    status_ID = (SELECT status_ID FROM client WHERE client_ID = 304),
    client_name = (SELECT first_name || ' ' || last_name FROM client WHERE client_ID = 304),
    ticket_price = (SELECT projection_price - projection_price*(SELECT NVL(discount_percentage, 0) FROM status WHERE status_ID = (SELECT status_ID FROM client WHERE client_ID = 304)) 
                    FROM projection WHERE projection_ID = 109)
WHERE projection_ID = 109 AND seat = 1 AND client_ID IS NULL;
SAVEPOINT after_elena;

UPDATE ticket
SET client_ID = 306, 
    status_ID = (SELECT status_ID FROM client WHERE client_ID = 306),
    client_name = (SELECT first_name || ' ' || last_name FROM client WHERE client_ID = 306),
    ticket_price = (SELECT projection_price - projection_price*(SELECT NVL(discount_percentage, 0) FROM status WHERE status_ID = (SELECT status_ID FROM client WHERE client_ID = 306)) 
                    FROM projection WHERE projection_ID = 109)
WHERE projection_ID = 109 AND seat = 2 AND client_ID IS NULL;
COMMIT;


// La cinema au venit 4 clienti (ID-urile 308-311) ce doresc achizitionarea de bilete
// Clientul 308 doreste achizitionarea biletelor: locul 4 la proiectia 101 si locul 1 la proiectia 102
// Restul de clienti doresc biletele cu locurile 2, 4, 5 la proiectia 103
SET TRANSACTION NAME 'ticket_cinema_acquisition';
// Biletele clientului 308
UPDATE ticket
SET client_ID = 308, 
    status_ID = (SELECT status_ID FROM client WHERE client_ID = 308),
    client_name = (SELECT first_name || ' ' || last_name FROM client WHERE client_ID = 308),
    ticket_price = (SELECT projection_price - projection_price*(SELECT NVL(discount_percentage, 0) FROM status WHERE status_ID = (SELECT status_ID FROM client WHERE client_ID = 308)) 
                    FROM projection WHERE projection_ID = 101)
WHERE projection_ID = 101 AND seat = 4 AND client_ID IS NULL;

UPDATE ticket
SET client_ID = 308, 
    status_ID = (SELECT status_ID FROM client WHERE client_ID = 308),
    client_name = (SELECT first_name || ' ' || last_name FROM client WHERE client_ID = 308),
    ticket_price = (SELECT projection_price - projection_price*(SELECT NVL(discount_percentage, 0) FROM status WHERE status_ID = (SELECT status_ID FROM client WHERE client_ID = 308)) 
                    FROM projection WHERE projection_ID = 102)
WHERE projection_ID = 102 AND seat = 1 AND client_ID IS NULL;
SAVEPOINT after_cristina;

UPDATE ticket
SET client_ID = 309, 
    status_ID = (SELECT status_ID FROM client WHERE client_ID = 309),
    client_name = (SELECT first_name || ' ' || last_name FROM client WHERE client_ID = 309),
    ticket_price = (SELECT projection_price - projection_price*(SELECT NVL(discount_percentage, 0) FROM status WHERE status_ID = (SELECT status_ID FROM client WHERE client_ID = 309)) 
                    FROM projection WHERE projection_ID = 103)
WHERE projection_ID = 103 AND seat = 2 AND client_ID IS NULL;
SAVEPOINT after_razvan;

UPDATE ticket
SET client_ID = 310, 
    status_ID = (SELECT status_ID FROM client WHERE client_ID = 310),
    client_name = (SELECT first_name || ' ' || last_name FROM client WHERE client_ID = 310),
    ticket_price = (SELECT projection_price - projection_price*(SELECT NVL(discount_percentage, 0) FROM status WHERE status_ID = (SELECT status_ID FROM client WHERE client_ID = 310)) 
                    FROM projection WHERE projection_ID = 103)
WHERE projection_ID = 103 AND seat = 4 AND client_ID IS NULL;
SAVEPOINT after_ana;

UPDATE ticket
SET client_ID = 311, 
    status_ID = (SELECT status_ID FROM client WHERE client_ID = 311),
    client_name = (SELECT first_name || ' ' || last_name FROM client WHERE client_ID = 311),
    ticket_price = (SELECT projection_price - projection_price*(SELECT NVL(discount_percentage, 0) FROM status WHERE status_ID = (SELECT status_ID FROM client WHERE client_ID = 311)) 
                    FROM projection WHERE projection_ID = 103)
WHERE projection_ID = 103 AND seat = 5 AND client_ID IS NULL;
COMMIT;



//2.              Anularea unui bilet 
// Clientul 308 doreste sa-si anuleze biletul la proiectia 102
SET TRANSACTION NAME 'ticket_client_refound';
UPDATE ticket
SET client_ID = NULL, 
    status_ID = NULL,
    client_name = NULL,
    ticket_price = NULL
WHERE projection_ID = 102 AND client_ID = 308 AND client_name = (SELECT first_name || ' ' || last_name FROM client WHERE client_ID = 308);
SAVEPOINT remove_ticket_cristina;

// Daca este client (nu este utilizator) si nu mai are achizitionate si alte bilete, atunci va fi eliminat din baza de date
DELETE FROM client
WHERE client_ID = 308 AND 
        (mail IS NULL AND phone_number IS NULL) AND (SELECT COUNT(ticket_ID) 
        FROM ticket
        WHERE client_ID = 308) = 0;
COMMIT;



//3.              Anularea unei proiectii si a biletelor aferente

// Din motive organizatorice proiectia 101 nu mai poate fi sustinuta, de aceea se vor sterge proiectia si toate biletele aferente

SET TRANSACTION NAME 'delete_projection';
// Stergem biletele
DELETE FROM ticket
WHERE projection_ID = 101;
SAVEPOINT remove_tickets;

// Stergem proiectia
DELETE FROM projection
WHERE projection_ID = 101;
SAVEPOINT remove_projection;

// Stergem clientii(nu utilizatorii) care nu mai au si alte bilete achizitionate
DELETE FROM client c
WHERE (c.mail IS NULL AND c.phone_number IS NULL) AND (SELECT COUNT(ticket_ID) 
        FROM ticket
        WHERE client_ID = c.client_ID) = 0;
COMMIT;