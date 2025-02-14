//             Tabela movie
// movie_movie_title_nn
INSERT INTO movie(movie_ID, movie_duration) 
    VALUES (80, 169);
    
// movie_movie_duration_nn
INSERT INTO movie(movie_ID, movie_title) 
    VALUES (80, 'Interstellar');
    
// movie_movie_ID_pk
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (50, 'Interstellar', 169);
    
// movie_movie_ID_ck
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (1, 'Interstellar', 169);
    
// movie_title_ck
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (80, 'Interstellar/', 169);

//movie_duration_ck
INSERT INTO movie(movie_ID, movie_title, movie_duration) 
    VALUES (80, 'Interstellar 2', -30);
    
    

//          Tabela movie_details
// movie_details_genre_nn
INSERT INTO movie_details(movie_ID, imdb_score, trailer_url) 
    VALUES (50, 8.7, 'https://www.imdb.com/video/vi1586278169/?playlistId=tt0816692%26ref_=tt_ov_ov_vi');

// movie_details_trailer_url_uk
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (59, 'Adventure, Sci-Fi', 8.7, 'https://www.imdb.com/video/vi1586278169/?playlistId=tt0816692%26ref_=tt_ov_ov_vi');

// movie_details_movie_ID_pk
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (50, 'Adventure, Sci-Fi', 8.7, 'https://www.imdb.com/video/vi1586278169/?playlistId=tt0816692%26ref_=tt_ov_ov_vi');
    
// movie_details_movie_ID_fk
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (1, 'Adventure, Sci-Fi', 8.7, 'https://www.imdb.com/video/1234');

// movie_details_genre_ck
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (1, 'Adventure01', 8.7, 'https://www.imdb.com/video/1234');

// movie_details_trailer_url_ck
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (1, 'Adventure, Sci-Fi', 8.7, 'www.youtube.com/video/1234');

// movie_details_imdb_score_ck
INSERT INTO movie_details(movie_ID, genre, imdb_score, trailer_url) 
    VALUES (59, 'Adventure', -8.7, 'https://www.imdb.com/video/1234');

//          Tabela hall
// hall_hall_name_uq
INSERT INTO hall(hall_id, hall_name, capacity) 
    VALUES (15, 'SALA05', 10);
    
// hall_capacity_nn
INSERT INTO hall(hall_id, hall_name) 
    VALUES (15, 'SALA06');
    
// hall_hall_id_pk
INSERT INTO hall(hall_id, hall_name, capacity) 
    VALUES (10, 'SALA06', 10);
    
// hall_hall_id_ck
INSERT INTO hall(hall_id, hall_name, capacity) 
    VALUES (30, 'SALA06', 10);

// hall_hall_name_ck
INSERT INTO hall(hall_id, hall_name, capacity) 
    VALUES (15, 'HALL06', 10);
    
// hall_capacity_ck
INSERT INTO hall(hall_id, hall_name, capacity) 
    VALUES (15, 'SALA06', -10);
    
    

//          Tabela projection
// projection_movie_ID_nn
INSERT INTO projection (projection_ID, hall_ID, start_time, projection_price) 
    VALUES (120, 10, TO_TIMESTAMP('28-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'), 30.00);

// projection_hall_ID_nn
INSERT INTO projection (projection_ID, movie_ID, start_time, projection_price) 
    VALUES (120, 50, TO_TIMESTAMP('28-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'), 30.00);
    
// projection_start_time_nn
INSERT INTO projection (projection_ID, movie_ID, hall_ID, projection_price) 
    VALUES (120, 50, 10, 30.00);
    
// projection_projection_price_nn
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time) 
    VALUES (120, 50, 10, TO_TIMESTAMP('28-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'));
    
// projection_projection_ID_pk
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (100, 52, 10, TO_TIMESTAMP('28-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'), 30.00);
    
// projection_projection_ID_ck
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (1, 52, 10, TO_TIMESTAMP('28-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'), 30.00);

// projection_movie_ID_fk
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (120, 1, 10, TO_TIMESTAMP('28-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'), 30.00);
    
// projection_hall_ID_fk
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (120, 52, 1, TO_TIMESTAMP('28-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'), 30.00);
    
// projection_projection_price_ck
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (120, 52, 10, TO_TIMESTAMP('27-12-24 20:00:00', 'DD-MM-YY HH24:MI:SS'), -30.00);
    
// projection_unique
INSERT INTO projection (projection_ID, movie_ID, hall_ID, start_time, projection_price) 
    VALUES (120, 52, 10, TO_TIMESTAMP('27-12-24 12:00:00', 'DD-MM-YY HH24:MI:SS'), 30.00);




//          Tabela status
// status_status_name_nn
INSERT INTO status (status_ID, discount_percentage) 
    VALUES (5, 0.50);
    
// status_status_ID_pk
INSERT INTO status (status_ID, status_name, discount_percentage) 
    VALUES (0, 'JUNIOR',0.50);
    
// status_status_ID_ck
INSERT INTO status (status_ID, status_name, discount_percentage) 
    VALUES (20, 'JUNIOR', 0.50);
    
// status_status_name_ck
INSERT INTO status (status_ID, status_name, discount_percentage) 
    VALUES (5, 'ADULT20', 0.20);
    
// status_discount_percentage_ck
INSERT INTO status (status_ID, status_name, discount_percentage) 
    VALUES (5, 'JUNIOR', -0.20);
    
// status_status_name_uq
INSERT INTO status (status_ID, status_name, discount_percentage) 
    VALUES (5, 'ADULT', 0.4);

    
    
    
//          Tabela client
// client_status_ID_nn
INSERT INTO client (client_ID, first_name, last_name, mail, phone_number) 
    VALUES (312, 'Maria', 'Maria', 'maria.maria@gmail.com', '0741234576');
    
// client_first_name_nn
INSERT INTO client (client_ID, status_ID, last_name, mail, phone_number) 
    VALUES (312, 0, 'Maria', 'maria.maria@gmail.com', '0741234576');
    
// client_last_name_nn
INSERT INTO client (client_ID, status_ID, first_name, mail, phone_number) 
    VALUES (312, 0, 'Maria', 'maria.maria@gmail.com', '0741234576');

// client_mail_uq
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (312, 1, 'Ana-Maria', 'Popescu', 'maria.popescu@gmail.com', '0741234576');
    
// client_phone_number_uq
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (312, 1, 'Ana-Maria', 'Popescu', 'ana.maria.popescu@gmail.com', '0741234567');

// client_client_ID_pk
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (310, 1, 'Ana-Maria', 'Popescu', 'ana.maria.popescu@gmail.com', '0741234576');
    
// client_client_ID_ck
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (1, 1, 'Ana-Maria', 'Popescu', 'ana.maria.popescu@gmail.com', '0741234576');
    
// client_status_ID_fk
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (312, 20, 'Ana-Maria', 'Popescu', 'ana.maria.popescu@gmail.com', '0741234576');
    
// client_first_name_ck
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (312, 1, 'Maria2', 'Popescu', 'ana.maria.popescu@gmail.com', '0741234576');
    
// client_last_name_ck
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (312, 1, 'Maria', 'Popescu2', 'ana.maria.popescu@gmail.com', '0741234576');
    
// client_mail_ck
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (312, 1, 'Maria', 'Popescu', 'ana maria.popescu@gmail.com', '0741234576');
    
// client_phone_number_ck
INSERT INTO client (client_ID, status_ID, first_name, last_name, mail, phone_number) 
    VALUES (312, 1, 'Maria', 'Popescu', 'ana.maria.popescu@gmail.com', '1234');
    
    
    
//          Tabela ticket
// ticket_projection_ID_nn
INSERT INTO ticket (ticket_ID, seat)
    VALUES (800, 1);
    
// ticket_seat_nn
INSERT INTO ticket (ticket_ID, projection_ID)
    VALUES (800, 100);
    
// ticket_ticket_ID_pk
INSERT INTO ticket (ticket_ID, projection_ID, seat)
    VALUES (500, 100, 1);

// ticket_ticket_ID_ck
INSERT INTO ticket (ticket_ID, projection_ID, seat)
    VALUES (1, 100, 1);

// ticket_projection_ID_fk
INSERT INTO ticket (ticket_ID, projection_ID, seat)
    VALUES (800, 1, 1);

// ticket_client_ID_fk
INSERT INTO ticket (ticket_ID, projection_ID, client_ID, status_ID, seat)
    VALUES (800, 100, 1, 0, 1);

// ticket_status_ID_fk
INSERT INTO ticket (ticket_ID, projection_ID, client_ID, status_ID, seat)
    VALUES (800, 100, 300, 20, 1);
    
// ticket_ticket_price_ck
INSERT INTO ticket (ticket_ID, projection_ID, client_ID, status_ID, seat, ticket_price)
    VALUES (800, 100, 300, 0, 1, -20);

//ticket_seat_ck
INSERT INTO ticket (ticket_ID, projection_ID, client_ID, status_ID, seat)
    VALUES (800, 100, 300, 0, -1);