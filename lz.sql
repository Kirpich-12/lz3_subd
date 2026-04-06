
USE LZ

CREATE TABLE stud(
    id INT identity(1,1) primary key,
    last_name NVARCHAR(50),
    f_name NVARCHAR(50),
    s_name NVARCHAR(50),
    br_date DATE,
    in_date DATE,
    exm FLOAT
)

CREATE Table faculty(
    id INT identity(1,1) primary key,
    faculty_name NVARCHAR(50)
)

CREATE TABLE form(
    id INT identity(1,1) primary key,
    form_name NVARCHAR(50)
)


CREATE Table hours(
    id INT identity(1,1) primary key,
    course int,
    faculty_id int,
    form_id int,
    all_h INT,
    inclass_id int,

    CONSTRAINT FK_hours_faculty FOREIGN KEY (faculty_id) REFERENCES faculty(id),
    CONSTRAINT FK_hours_form FOREIGN KEY (form_id) REFERENCES form(id)
)

CREATE TABLE process(
    stud_id INT,
    hours_id INT,
    PRIMARY KEY(stud_id, hours_id),

    CONSTRAINT FK_process_stud FOREIGN KEY (stud_id) REFERENCES stud(id),
    CONSTRAINT FK_process_hours FOREIGN KEY (hours_id) REFERENCES [hours](id)
)

CREATE Table subj(
    id INT identity(1,1) primary key,
    subj NVARCHAR(50),
    [hours] INT
)

CREATE Table Teach(
    id INT identity(1,1) primary key,
    last_name NVARCHAR(50),
    f_name NVARCHAR(50),
    s_name NVARCHAR(50),
    br_date DATE,
    start_work_date DATE,
)

CREATE TABLE work(
    teach_id INT,
    hours_id INT,
    subj_id INT,
    PRIMARY KEY(teach_id, hours_id, subj_id),

    CONSTRAINT FK_work_teach FOREIGN KEY (teach_id) REFERENCES Teach(id),
    CONSTRAINT FK_work_hours FOREIGN KEY (hours_id) REFERENCES hours(id),
    CONSTRAINT FK_work_subj FOREIGN KEY (subj_id) REFERENCES subj(id)
)



INSERT into faculty(faculty_name) values ('ФПM')
INSERT into faculty(faculty_name) values ('ФПK')
SELECT * from faculty

INSERT into form(form_name) values ('очная')
INSERT into form(form_name) values ('заочная')
SELECT * from form

INSERT into hours(course, faculty_id, form_id, all_h, inclass_id) values (1, 1, 1, 100, 50)
INSERT into hours(course, faculty_id, form_id, all_h, inclass_id) values (2, 1, 1, 100, 50)
INSERT into hours(course, faculty_id, form_id, all_h, inclass_id) values (1, 2, 2, 80, 30)
INSERT into hours(course, faculty_id, form_id, all_h, inclass_id) values (2, 2, 2, 80, 30)
SELECT * from hours

INSERT into subj(subj, [hours]) values ('Математика', 100) 
INSERT into subj(subj, [hours]) values ('Физика', 80)
SELECT * from subj

INSERT into Teach(last_name, f_name, s_name, br_date, start_work_date) values ('Иванов', 'Иван', 'Иванович', '1980-01-01', '2005-09-01')
INSERT into Teach(last_name, f_name, s_name, br_date, start_work_date) values ('Петров', 'Петр', 'Петрович', '1975-01-01', '2000-09-01')
SELECT * from Teach

INSERT into stud(last_name, f_name, s_name, br_date, in_date, exm) values ('Сидоров', 'Сидор', 'Сидорович', '2000-01-01', '2018-09-01', 8)
INSERT into stud(last_name, f_name, s_name, br_date, in_date, exm) values ('Кузнецов', 'Кузьма', 'Кузьмич', '2001-01-01', '2019-09-01', 9)
INSERT into stud(last_name, f_name, s_name, br_date, in_date, exm) values ('Сидоров', 'Иван', 'Иванович', '1999-01-01', '2018-09-01', 6)
INSERT into stud(last_name, f_name, s_name, br_date, in_date, exm) values ('Сидоров', 'Иван', 'Иванович', '1999-01-01', '2018-09-01', 7.6)
INSERT into stud(last_name, f_name, s_name, br_date, in_date, exm) values ('Сидоров', 'Иван', 'Петрович', '1999-01-01', '2018-09-01', 7.6)
SELECT * from stud

INSERT into process(stud_id, hours_id) values (1, 1)
INSERT into process(stud_id, hours_id) values (2, 3)
INSERT into process(stud_id, hours_id) values (3, 4)
INSERT into process(stud_id, hours_id) values (4, 3)
INSERT into process(stud_id, hours_id) values (5, 3)
SELECT * from process

INSERT into work(teach_id, hours_id, subj_id) values (1, 1, 1)
INSERT into work(teach_id, hours_id, subj_id) values (2, 3, 2)

SELECT * from work


INSERT INTO hours(course, faculty_id, form_id, all_h, inclass_id) VALUES (4, 1, 1, 100, 50); 
INSERT INTO hours(course, faculty_id, form_id, all_h, inclass_id) VALUES (4, 2, 2, 80, 30);  

INSERT INTO stud(last_name, f_name, s_name, br_date, in_date, exm) VALUES
('Смирнов', 'Алексей', 'Дмитриевич', '2004-03-12', '2022-09-01', 8.5),
('Попов', 'Дмитрий', 'Сергеевич', '2004-05-20', '2022-09-01', 7.2),
('Васильев', 'Игорь', 'Павлович', '2004-01-15', '2022-09-01', 9.0),
('Петров', 'Андрей', 'Викторович', '2004-07-08', '2022-09-01', 6.5),
('Соколов', 'Максим', 'Олегович', '2004-09-25', '2022-09-01', 8.0),
('Михайлов', 'Роман', 'Николаевич', '2004-11-03', '2022-09-01', 7.8),
('Новиков', 'Артем', 'Иванович', '2004-02-14', '2022-09-01', 9.5),
('Федоров', 'Даниил', 'Александрович', '2004-04-30', '2022-09-01', 6.0),
('Морозов', 'Кирилл', 'Евгеньевич', '2004-06-18', '2022-09-01', 8.3),
('Волков', 'Тимур', 'Рустамович', '2004-08-22', '2022-09-01', 7.5),
('Алексеев', 'Иван', 'Петрович', '2004-01-10', '2022-09-01', 8.1),
('Лебедев', 'Сергей', 'Владимирович', '2004-03-28', '2022-09-01', 7.0),
('Семенов', 'Павел', 'Андреевич', '2004-05-05', '2022-09-01', 9.2),
('Егоров', 'Никита', 'Дмитриевич', '2004-07-17', '2022-09-01', 6.8),
('Павлов', 'Глеб', 'Иванович', '2004-09-09', '2022-09-01', 8.7),
('Козлов', 'Степан', 'Олегович', '2004-11-20', '2022-09-01', 7.4),
('Степанов', 'Арсений', 'Сергеевич', '2004-02-25', '2022-09-01', 9.0),
('Николаев', 'Матвей', 'Павлович', '2004-04-12', '2022-09-01', 6.5),
('Орлов', 'Денис', 'Викторович', '2004-06-30', '2022-09-01', 8.9),
('Андреев', 'Владислав', 'Андреевич', '2004-08-14', '2022-09-01', 7.7);

INSERT INTO process(stud_id, hours_id) VALUES
(6, 5), (7, 5), (8, 5), (9, 5), (10, 5),
(11, 5), (12, 5), (13, 5), (14, 5), (15, 5),
(16, 6), (17, 6), (18, 6), (19, 6), (20, 6),
(21, 6), (22, 6), (23, 6), (24, 6), (25, 6);

--1
SELECT AVG(stud.exm) as avg_exm
FROM stud
JOIN process ON stud.id = process.stud_id
JOIN hours ON process.hours_id = hours.id
WHERE hours.form_id = 2;

--2
SELECT 
    faculty.faculty_name,
    AVG(stud.exm) as avg_exm
FROM stud
JOIN process ON stud.id = process.stud_id
JOIN hours ON process.hours_id = hours.id
JOIN faculty ON hours.faculty_id = faculty.id
GROUP BY faculty.faculty_name

--3
SELECT 
    faculty.faculty_name,
    AVG(stud.exm) as avg_exm 
FROM stud
JOIN process ON stud.id = process.stud_id
JOIN hours ON process.hours_id = hours.id
JOIN faculty ON hours.faculty_id = faculty.id
GROUP BY faculty.faculty_name
HAVING AVG(stud.exm) > 7

--4
SELECT 
    faculty.faculty_name,
    [hours].course,
    AVG(stud.exm) as avg_exm 
FROM stud
JOIN process ON stud.id = process.stud_id
JOIN hours ON process.hours_id = hours.id
JOIN faculty ON hours.faculty_id = faculty.id
GROUP BY faculty.faculty_name, [hours].course
HAVING AVG(stud.exm) > 7.5

--5
SELECT 
    faculty.faculty_name,
    hours.course,
    AVG(stud.exm) as avg_exm 
FROM stud
JOIN process ON stud.id = process.stud_id
JOIN hours ON process.hours_id = hours.id
JOIN faculty ON hours.faculty_id = faculty.id
GROUP BY faculty.faculty_name, hours.course

--6
