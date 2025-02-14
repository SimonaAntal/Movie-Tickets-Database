// Tabela movie
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (50, 'Interstellar', 169);
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (51, 'The Hunger Games', 142);
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (52, 'Avatar', 162);
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (53, 'The Lord of the Rings: The Fellowship of the Ring', 178);
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (54, 'The Lion King', 88);
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (55, 'Transformers One', 104);
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (56, 'Star Wars: Episode IX - The Rise of Skywalker', 141);
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (57, 'In the Tall Grass', 101);
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (58, 'Oculus', 104);
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (59, 'Bird', 119);
    


// Tabela movie_details
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (50, 'Adventure, Sci-Fi', 8.7, 'https://www.imdb.com/video/vi1586278169/?playlistId=tt0816692%26ref_=tt_ov_ov_vi');
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (51, 'Action, Sci-Fi', 7.2, 'https://www.imdb.com/video/vi3358368281/?playlistId=tt1392170%26ref_=tt_ov_pr_ov_vi');
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (52, 'Adventure, Fantasy', 7.9, 'https://www.imdb.com/video/vi531039513/?playlistId=tt0499549%26ref_=tt_ov_ov_vi');
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (53, 'Adventure, Fantasy', 8.9, 'https://www.imdb.com/video/vi684573465/?playlistId=tt0120737%26ref_=tt_ov_ov_vi');
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (54, 'Animal Adventure, Drama', 8.5, 'https://www.imdb.com/video/vi3764362265/?playlistId=tt0110357%26ref_=tt_ov_ov_vi');
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (55, 'Adventure, Space Sci-Fi', 7.6, 'https://www.imdb.com/video/vi2203371033/?playlistId=tt8864596%26ref_=tt_ov_ov_vi');
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (56, 'Action, Space Sci-Fi', 6.4, 'https://www.imdb.com/video/vi518503961/?playlistId=tt2527338%26ref_=tt_ov_pr_ov_vi');
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (57, 'Folk Horror, Mystery', 5.5, 'https://www.imdb.com/video/vi2978266905/?playlistId=tt4687108%26ref_=tt_ov_ov_vi');
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (58, 'Supernatural Horror', 6.5, 'https://www.imdb.com/video/vi2517019161/?playlistId=tt2388715%26ref_=tt_ov_ov_vi');
    


// Tabela hall
INSERT INTO hall(hall_id, hall_name, capacity) 
    VALUES (10, 'SALA01', 6);
INSERT INTO hall(hall_id, hall_name, capacity) 
    VALUES (11, 'SALA02', 5);
INSERT INTO hall(hall_id, hall_name, capacity) 
    VALUES (12, 'SALA03', 4);
INSERT INTO hall(hall_id, hall_name, capacity) 
    VALUES (13, 'SALA04', 3);
INSERT INTO hall(hall_id, hall_name, capacity) 
    VALUES (14, 'SALA05', 2);
    


// Tabela projection
// Proiectiile din SALA01
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (100, 50, 10, TO_TIMESTAMP('27-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'), 30.00);
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (101, 51, 10, TO_TIMESTAMP('27-12-24 15:20:00', 'DD-MM-YY HH24:MI:SS'), 28.00);
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (102, 52, 10, TO_TIMESTAMP('27-12-24 18:10:00', 'DD-MM-YY HH24:MI:SS'), 30.00);

// Proiectiile din SALA02
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (103, 54, 11, TO_TIMESTAMP('27-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'), 26.00);
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (104, 55, 11, TO_TIMESTAMP('27-12-24 13:50:00', 'DD-MM-YY HH24:MI:SS'), 30.00);
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (105, 56, 11, TO_TIMESTAMP('27-12-24 16:00:00', 'DD-MM-YY HH24:MI:SS'), 28.00);

// Proiectiile din SALA03
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (106, 58, 12, TO_TIMESTAMP('27-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'), 28.00);
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (107, 57, 12, TO_TIMESTAMP('27-12-24 14:10:00', 'DD-MM-YY HH24:MI:SS'), 28.00);

// Proiectiile din SALA04
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (108, 53, 13, TO_TIMESTAMP('27-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'), 32.00);
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (109, 52, 13, TO_TIMESTAMP('27-12-24 15:20:00', 'DD-MM-YY HH24:MI:SS'), 30.00);

// Proiectiile din SALA05
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (110, 52, 14, TO_TIMESTAMP('27-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'), 30.00);
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (111, 53, 14, TO_TIMESTAMP('27-12-24 15:20:00', 'DD-MM-YY HH24:MI:SS'), 32.00);



// Tabela status
INSERT INTO status (status_ID, status_name) 
    VALUES (0, 'ADULT');
INSERT INTO status (status_ID, status_name, discount_percentage) 
    VALUES (1, 'COPIL', 0.30);
INSERT INTO status (status_ID, status_name, discount_percentage) 
    VALUES (2, 'ELEV', 0.25);
INSERT INTO status (status_ID, status_name, discount_percentage) 
    VALUES (3, 'STUDENT', 0.25);
INSERT INTO status (status_ID, status_name, discount_percentage) 
    VALUES (4, 'PENSIONAR', 0.25);



// Tabela client
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (300, 0, 'Maria', 'Popescu', 'maria.popescu@gmail.com', '0741234567');
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (301, 1, 'Andrei', 'Ionescu', 'andrei.ionescu@yahoo.com', '0742345678');
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (302, 1, 'Ioana', 'Dumitrescu', 'ioana.dumitrescu@outlook.com', '0743456789');
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (303, 3, 'Vlad', 'Georgescu', 'vlad.georgescu@gmail.com', '0744567890');
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (304, 4, 'Elena', 'Stoica', 'elena.stoica@yahoo.com', '0745678901');
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (305, 4, 'Florin', 'Preda', 'florin.preda@gmail.com', '0746789012');
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (306, 0, 'Adriana', 'Marinescu', 'adriana.marinescu@outlook.com', '0747890123');
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (307, 0, 'Mihai', 'Tudor', 'mihai.tudor@yahoo.com', '0748901234');
    
INSERT INTO client (client_ID, status_ID, first_name, last_name) 
    VALUES (308, 3, 'Cristina', 'Enescu');
INSERT INTO client (client_ID, status_ID, first_name, last_name) 
    VALUES (309, 4, 'Razvan', 'Petrescu');
INSERT INTO client (client_ID, status_ID, first_name, last_name) 
    VALUES (310, 1, 'Ana-Maria', 'Radu');
INSERT INTO client (client_ID, status_ID, first_name, last_name) 
    VALUES (311, 0, 'Ioan', 'Stanescu');



// Tabela ticket
// Se creeaza n tickete pentru fiecare proiectie existenta, unde n este capacitatea salii(hall) in care are loc proiectia
DECLARE
ticket_id NUMBER := 500;
BEGIN
    FOR projection_info IN (SELECT p.projection_ID, h.capacity
        FROM projection p, hall h
        WHERE p.hall_id=h.hall_id) LOOP
        
        FOR seat IN 1..projection_info.capacity LOOP
            INSERT INTO ticket (ticket_ID, projection_ID, seat)
                VALUES (ticket_id, projection_info.projection_ID, seat);
            ticket_id:=ticket_id+1;
        END LOOP;
    END LOOP;
END;


COMMIT;

select * from movie;
select * from movie_details;
select * from hall;
select * from projection;
select * from status;
select * from client;
select * from ticket;