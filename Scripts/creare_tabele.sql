CREATE TABLE MOVIE (
    movie_ID NUMBER(2),
    movie_title VARCHAR2(80) CONSTRAINT movie_movie_title_nn NOT NULL,
    movie_duration INT CONSTRAINT movie_movie_duration_nn NOT NULL,
CONSTRAINT movie_movie_ID_pk PRIMARY KEY(movie_ID),
CONSTRAINT movie_movie_ID_ck CHECK (movie_ID BETWEEN 50 AND 99),
CONSTRAINT movie_title_ck CHECK (REGEXP_LIKE (movie_title, '^[A-Za-z0-9 :-]+$')),
CONSTRAINT movie_duration_ck CHECK (movie_duration > 0)
);

CREATE TABLE MOVIE_DETAILS (
    movie_ID NUMBER(2),
    genre VARCHAR2(40) CONSTRAINT movie_details_genre_nn NOT NULL,
    imdb_score NUMBER(3,1),
    trailer_url VARCHAR2(200) CONSTRAINT movie_details_trailer_url_uk UNIQUE,
CONSTRAINT movie_details_movie_ID_pk PRIMARY KEY(movie_ID),
CONSTRAINT movie_details_movie_ID_fk FOREIGN KEY (movie_ID) REFERENCES MOVIE (movie_ID),
CONSTRAINT movie_details_genre_ck CHECK (REGEXP_LIKE (genre, '^[A-Za-z ,-]+$')),
CONSTRAINT movie_details_trailer_url_ck CHECK (REGEXP_LIKE (trailer_url, '^(https?://)?(www\.)?(imdb\.com/)[a-zA-Z0-9?_=%/-]+$')),
CONSTRAINT movie_details_imdb_score_ck CHECK (imdb_score > 0)
);

CREATE TABLE HALL (
    hall_id NUMBER(2),
    hall_name VARCHAR2(6) CONSTRAINT hall_hall_name_uq UNIQUE,
    capacity NUMBER(3) CONSTRAINT hall_capacity_nn NOT NULL,
CONSTRAINT hall_hall_id_pk PRIMARY KEY(hall_id),
CONSTRAINT hall_hall_id_ck CHECK (hall_id BETWEEN 10 AND 20),
CONSTRAINT hall_hall_name_ck CHECK (REGEXP_LIKE (hall_name, '^SALA[0-9][0-9]+$')),
CONSTRAINT hall_capacity_ck CHECK (capacity > 0)
);

CREATE TABLE PROJECTION (
    projection_ID NUMBER(3),
    movie_ID NUMBER(2) CONSTRAINT projection_movie_ID_nn NOT NULL,
    hall_ID NUMBER(2) CONSTRAINT projection_hall_ID_nn NOT NULL,
    start_time TIMESTAMP WITH LOCAL TIME ZONE CONSTRAINT projection_start_time_nn NOT NULL,
    projection_price NUMBER(4,2) CONSTRAINT projection_projection_price_nn NOT NULL,
CONSTRAINT projection_projection_ID_pk PRIMARY KEY(projection_ID),
CONSTRAINT projection_projection_ID_ck CHECK (projection_ID BETWEEN 100 AND 200),
CONSTRAINT projection_movie_ID_fk FOREIGN KEY (movie_ID) REFERENCES MOVIE (movie_ID),
CONSTRAINT projection_hall_ID_fk FOREIGN KEY (hall_ID) REFERENCES HALL (hall_ID),
CONSTRAINT projection_projection_price_ck CHECK (projection_price > 0),
CONSTRAINT projection_unique UNIQUE (hall_ID, start_time)
);

CREATE TABLE STATUS (
    status_ID NUMBER(2),
    status_name VARCHAR2(15) CONSTRAINT status_status_name_nn NOT NULL,
    discount_percentage NUMBER(2,2),
CONSTRAINT status_status_ID_pk PRIMARY KEY(status_ID),
CONSTRAINT status_status_ID_ck CHECK (status_ID BETWEEN 0 AND 10),
CONSTRAINT status_status_name_ck CHECK (REGEXP_LIKE (status_name, '^[A-Z]+$')),
CONSTRAINT status_discount_percentage_ck CHECK (discount_percentage > 0),
CONSTRAINT status_status_name_uq UNIQUE(status_name)
);

CREATE TABLE CLIENT (
    client_ID NUMBER(3),               
    status_ID NUMBER(2) CONSTRAINT client_status_ID_nn NOT NULL,
    first_name VARCHAR2(30) CONSTRAINT client_first_name_nn NOT NULL,                
    last_name VARCHAR2(30) CONSTRAINT client_last_name_nn NOT NULL,
    mail VARCHAR2(40) CONSTRAINT client_mail_uq UNIQUE,                      
    phone_number CHAR(10) CONSTRAINT client_phone_number_uq UNIQUE,  
CONSTRAINT client_client_ID_pk PRIMARY KEY(client_ID),
CONSTRAINT client_client_ID_ck CHECK (client_ID BETWEEN 300 AND 500),
CONSTRAINT client_status_ID_fk FOREIGN KEY (status_ID) REFERENCES STATUS (status_ID),
CONSTRAINT client_first_name_ck CHECK (REGEXP_LIKE (first_name, '^[a-zA-Z -]+$')),
CONSTRAINT client_last_name_ck CHECK (REGEXP_LIKE (last_name, '^[a-zA-Z -]+$')),
CONSTRAINT client_mail_ck CHECK (REGEXP_LIKE (mail, '^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]{2,}$')),
CONSTRAINT client_phone_number_ck CHECK (REGEXP_LIKE (phone_number, '^[0-9]{10}$'))
);

CREATE TABLE TICKET (
    ticket_ID NUMBER(4),
    projection_ID NUMBER(3) CONSTRAINT ticket_projection_ID_nn NOT NULL,
    client_ID NUMBER(3),
    status_ID NUMBER(2),
    client_name VARCHAR2(60),
    ticket_price NUMBER(4,2),
    seat NUMBER(3) CONSTRAINT ticket_seat_nn NOT NULL,
CONSTRAINT ticket_ticket_ID_pk PRIMARY KEY(ticket_ID),
CONSTRAINT ticket_ticket_ID_ck CHECK (ticket_ID BETWEEN 500 AND 1000),
CONSTRAINT ticket_projection_ID_fk FOREIGN KEY (projection_ID) REFERENCES PROJECTION (projection_ID),
CONSTRAINT ticket_client_ID_fk FOREIGN KEY (client_ID) REFERENCES CLIENT (client_ID),
CONSTRAINT ticket_status_ID_fk FOREIGN KEY (status_ID) REFERENCES STATUS (status_ID),
CONSTRAINT ticket_ticket_price_ck CHECK (ticket_price > 0),
CONSTRAINT ticket_seat_ck CHECK (seat > 0)
);

drop table ticket;
drop table client;
drop table status;
drop table projection;
drop table hall;
drop table movie_details;
drop table movie;
