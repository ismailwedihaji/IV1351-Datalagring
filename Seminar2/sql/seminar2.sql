CREATE TABLE email (
 id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 email VARCHAR(500) NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (id);


CREATE TABLE payment (
 id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 instructor_salary VARCHAR(500),
 sibling_discount_price VARCHAR(500),
 skill_level_price VARCHAR(500),
 lesson_type_price VARCHAR(500)
);

ALTER TABLE payment ADD CONSTRAINT PK_payment PRIMARY KEY (id);


CREATE TABLE person (
 id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 first_name VARCHAR(500),
 last_name VARCHAR(500),
 person_number VARCHAR(15),
 street VARCHAR(500),
 zip VARCHAR(500),
 city VARCHAR(500),
 birth_date VARCHAR(500)
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE person_email (
 person_id INT NOT NULL,
 email_id INT NOT NULL
);

ALTER TABLE person_email ADD CONSTRAINT PK_person_email PRIMARY KEY (person_id,email_id);


CREATE TABLE phone (
 id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 phone_no VARCHAR(500) NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (id);


CREATE TABLE student (
 id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 level_of_lesson VARCHAR(500),
 person_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE contact_person (
 id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 relation_type VARCHAR(500),
 person_id INT NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (id);


CREATE TABLE instructor (
 id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 employment_id VARCHAR(500) NOT NULL,
 person_id INT NOT NULL 
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instrument (
 id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 instrument_type VARCHAR(500),
 is_available VARCHAR(500),
 brand VARCHAR(500),
 starts_rented_time VARCHAR(500),
 ends_rented_time VARCHAR(500),
 student_id INT NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);


CREATE TABLE instrument_takes (
 student_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 instrument_uses VARCHAR(500) NOT NULL
);

ALTER TABLE instrument_takes ADD CONSTRAINT PK_instrument_takes PRIMARY KEY (student_id,instrument_uses);


CREATE TABLE instrument_type_teaches (
 instructor_id INT NOT NULL,
 instrument_teaches_type VARCHAR(500) NOT NULL
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (instructor_id,instrument_teaches_type);


CREATE TABLE lesson (
 id INT NOT NULL,
 skill_level VARCHAR(500),
 min_student VARCHAR(500),
 max_student VARCHAR(500),
 genre VARCHAR(500),
 time TIMESTAMP(12),
 lesson_type VARCHAR(500),
 payment_id INT NOT NULL,
 instrument_id INT NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE lesson_teaches (
 instructor_id INT NOT NULL,
 lesson_id INT NOT NULL
);

ALTER TABLE lesson_teaches ADD CONSTRAINT PK_lesson_teaches PRIMARY KEY (instructor_id,lesson_id);


CREATE TABLE person_phone (
 peson_id INT NOT NULL,
 phone_id INT NOT NULL
);

ALTER TABLE person_phone ADD CONSTRAINT PK_person_phone PRIMARY KEY (peson_id,phone_id);


CREATE TABLE sibling (
 person_id INT NOT NULL,
 siblings VARCHAR(500) NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (person_id,siblings);


CREATE TABLE student_relates (
 student_id INT NOT NULL,
 contact_person_id INT NOT NULL
);

ALTER TABLE student_relates ADD CONSTRAINT PK_student_relates PRIMARY KEY (student_id,contact_person_id);


CREATE TABLE student_lesson (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL
);

ALTER TABLE studetn_lesson ADD CONSTRAINT PK_studetn_lesson PRIMARY KEY (student_id,lesson_id);


CREATE TABLE classroom (
 id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 schedual_time VARCHAR(500),
 zip VARCHAR(500),
 street VARCHAR(500),
 city VARCHAR(500),
 lesson_id INT NOT NULL,
 description VARCHAR(1000)
);

ALTER TABLE classroom ADD CONSTRAINT PK_classroom PRIMARY KEY (id);


ALTER TABLE person_email ADD CONSTRAINT FK_person_email_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE person_email ADD CONSTRAINT FK_person_email_1 FOREIGN KEY (email_id) REFERENCES email (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE instrument_takes ADD CONSTRAINT FK_instrument_takes_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE instrument_type ADD CONSTRAINT FK_instrument_type_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (payment_id) REFERENCES payment (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id);


ALTER TABLE lesson_teaches ADD CONSTRAINT FK_lesson_teaches_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE lesson_teaches ADD CONSTRAINT FK_lesson_teaches_1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_0 FOREIGN KEY (peson_id) REFERENCES person (id);
ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_1 FOREIGN KEY (phone_id) REFERENCES phone (id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (person_id) REFERENCES student (id);


ALTER TABLE student_relates ADD CONSTRAINT FK_student_relates_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_relates ADD CONSTRAINT FK_student_relates_1 FOREIGN KEY (contact_person_id) REFERENCES contact_person (id);


ALTER TABLE studetn_lesson ADD CONSTRAINT FK_studetn_lesson_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE studetn_lesson ADD CONSTRAINT FK_studetn_lesson_1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE classroom ADD CONSTRAINT FK_classroom_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


