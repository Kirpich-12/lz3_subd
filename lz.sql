CREATE DATABASE LZ
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
SELECT 
    f.faculty_name AS fac,
    fm.form_name AS form,
    MIN(s.exm) AS minsr
FROM 
    stud s, 
    faculty f,
    form fm,
    [hours] h, 
    process p
WHERE 
    s.id = p.stud_id                
    AND p.hours_id = h.id           
    AND h.faculty_id = f.id
    AND h.form_id = fm.id
GROUP BY 
    f.faculty_name, fm.form_name
HAVING 
    MIN(s.exm) >= 6
ORDER BY 
    f.faculty_name, fm.form_name;

--7
SELECT 
    (hours.all_h - hours.inclass_id) AS СампоЧасы
FROM hours
JOIN faculty ON hours.faculty_id = faculty.id
JOIN form ON hours.form_id = form.id
WHERE faculty.faculty_name = N'ФПК'    
  AND hours.course = 3               
  AND form.form_name = N'заочная';

--8
SELECT 
    faculty.faculty_name,
    hours.course,
    form.form_name,
    (hours.all_h - hours.inclass_id) AS СампоЧасы
FROM hours
JOIN faculty ON hours.faculty_id = faculty.id
JOIN form ON hours.form_id = form.id
WHERE (hours.all_h - hours.inclass_id) > 150
ORDER BY 
    faculty.faculty_name, 
    hours.course;

--9
SELECT 
    faculty.faculty_name,
    COUNT(hours.id) AS kol
FROM hours
JOIN faculty ON hours.faculty_id = faculty.id
GROUP BY faculty.faculty_name
ORDER BY faculty.faculty_name;

--10
SELECT 
    faculty.faculty_name,
    COUNT(DISTINCT work.teach_id) AS kol
FROM faculty
JOIN hours ON faculty.id = hours.faculty_id
JOIN work ON hours.id = work.hours_id
GROUP BY faculty.faculty_name;

--11
WITH MaxHoursPerTeacher AS (
    SELECT 
        work.teach_id,
        MAX(hours.all_h) AS max_hours
    FROM work
    JOIN hours ON work.hours_id = hours.id
    GROUP BY work.teach_id
)
SELECT 
    teach.id AS teach_id,
    teach.last_name,
    teach.f_name,
    subj.subj,
    hours.all_h
FROM teach
JOIN work ON teach.id = work.teach_id
JOIN subj ON work.subj_id = subj.id
JOIN hours ON work.hours_id = hours.id
JOIN MaxHoursPerTeacher ON teach.id = MaxHoursPerTeacher.teach_id 
                       AND hours.all_h = MaxHoursPerTeacher.max_hours
ORDER BY teach.id;

--12
SELECT 
    teach.id,
    teach.last_name,
    teach.f_name,
    teach.s_name,
    COUNT(DISTINCT work.subj_id) AS kol
FROM teach
JOIN work ON teach.id = work.teach_id
GROUP BY 
    teach.id, 
    teach.last_name, 
    teach.f_name, 
    teach.s_name
HAVING COUNT(DISTINCT work.subj_id) > 1;

--13
SELECT 
    hours.course,
    faculty.faculty_name,
    SUM(hours.all_h) AS sum
FROM hours
JOIN faculty ON hours.faculty_id = faculty.id
GROUP BY 
    hours.course, 
    faculty.faculty_name
ORDER BY hours.course;

--14
SELECT 
    faculty.faculty_name,
    hours.course,
    COUNT(DISTINCT subj.id) AS kol
FROM hours
JOIN faculty ON hours.faculty_id = faculty.id
JOIN work ON hours.id = work.hours_id
JOIN subj ON work.subj_id = subj.id
WHERE hours.course = 2
GROUP BY 
    faculty.faculty_name, 
    hours.course
ORDER BY 
    faculty.faculty_name DESC, 
    hours.course ASC;
    
--15
SELECT 
    faculty.faculty_name,
    COUNT(DISTINCT subj.id) AS kol
FROM faculty
JOIN hours ON faculty.id = hours.faculty_id
JOIN work ON hours.id = work.hours_id
JOIN subj ON work.subj_id = subj.id
JOIN teach ON work.teach_id = teach.id
WHERE teach.s_name = ''
GROUP BY faculty.faculty_name;



--JOIN
-- 1
SELECT
    s.last_name,
    s.f_name,
    s.s_name,
    f.faculty_name,
    h.course
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
JOIN faculty f ON h.faculty_id = f.id
JOIN [form] fo ON h.form_id = fo.id
WHERE
    fo.form_name = N'заочная'
    AND DATEDIFF(year, s.br_date, GETDATE()) < 37;

-- 2
SELECT
    f.faculty_name,
    COUNT(DISTINCT s.id) AS student_count
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
JOIN faculty f ON h.faculty_id = f.id
GROUP BY f.faculty_name;

-- 3
SELECT
    fo.form_name,
    COUNT(DISTINCT s.id) AS student_count
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
JOIN form fo ON h.form_id = fo.id
GROUP BY fo.form_name;

-- 4
SELECT
    f.faculty_name,
    AVG(DATEDIFF(year, s.br_date, DATEFROMPARTS(2023, 12, 31))) AS avg_age
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
JOIN faculty f ON h.faculty_id = f.id
GROUP BY f.faculty_name;

-- 5
SELECT
    s.last_name,
    s.f_name,
    s.br_date,
    s.in_date,
    f.faculty_name,
    h.course,
    fo.form_name
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
JOIN faculty f ON h.faculty_id = f.id
JOIN [form] fo ON h.form_id = fo.id
WHERE s.s_name = '';

-- Optional check (left from your code)
SELECT * FROM stud WHERE s_name = '';

-- 6
SELECT TOP 1
    f.faculty_name,
    COUNT(*) AS enrolled_students
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
JOIN faculty f ON h.faculty_id = f.id
WHERE YEAR(s.in_date) = 2015
GROUP BY f.faculty_name
ORDER BY enrolled_students DESC;

-- 7
SELECT 
    f.faculty_name,
    fo.form_name,
    COUNT(DISTINCT s.id) AS student_count
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
JOIN faculty f ON h.faculty_id = f.id
JOIN form fo ON h.form_id = fo.id
WHERE YEAR(s.in_date) = 2014
GROUP BY 
    f.faculty_name,
    fo.form_name
ORDER BY
    f.faculty_name,
    fo.form_name;

-- 8
SELECT DISTINCT f.faculty_name
FROM faculty f
JOIN [hours] h ON f.id = h.faculty_id
JOIN form fo ON h.form_id = fo.id
WHERE fo.form_name = N'заочная';

-- 9
SELECT 
    f.faculty_name,
    fo.form_name,
    h.course
FROM faculty f
JOIN [hours] h ON f.id = h.faculty_id
JOIN form fo ON h.form_id = fo.id
ORDER BY 
    f.faculty_name,
    fo.form_name,
    h.course;

-- 10
SELECT 
    f.faculty_name,
    fo.form_name,
    COUNT(DISTINCT s.id) AS student_count
FROM faculty f
JOIN [hours] h ON f.id = h.faculty_id
JOIN form fo ON h.form_id = fo.id
JOIN process p ON h.id = p.hours_id
JOIN stud s ON p.stud_id = s.id
GROUP BY 
    f.faculty_name,
    fo.form_name
ORDER BY 
    f.faculty_name,
    fo.form_name;

-- 11
SELECT 
    COUNT(DISTINCT s.id) AS total_students_course_1_and_3
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
WHERE h.course IN (1, 3);

-- 12
SELECT 
    f.faculty_name,
    h.course,
    COUNT(DISTINCT s.id) AS foreign_student_count
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
JOIN faculty f ON h.faculty_id = f.id
WHERE s.s_name IS NULL OR s.s_name = ''
GROUP BY 
    f.faculty_name,
    h.course
ORDER BY 
    f.faculty_name,
    h.course;

-- 13
SELECT 
    f.faculty_name,
    h.course,
    COUNT(DISTINCT s.id) AS student_count
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
JOIN faculty f ON h.faculty_id = f.id
WHERE s.exm > 7.5
GROUP BY 
    f.faculty_name,
    h.course
ORDER BY 
    f.faculty_name,
    h.course;

-- 14
SELECT 
    f.faculty_name,
    fo.form_name,
    COUNT(DISTINCT s.id) AS students_over_45
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
JOIN faculty f ON h.faculty_id = f.id
JOIN form fo ON h.form_id = fo.id
WHERE DATEDIFF(year, s.br_date, GETDATE()) > 45
GROUP BY 
    f.faculty_name,
    fo.form_name
ORDER BY 
    f.faculty_name,
    fo.form_name;

-- 15
SELECT 
    f.faculty_name,
    fo.form_name,
    h.course,
    COUNT(DISTINCT s.id) AS students_under_27
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
JOIN faculty f ON h.faculty_id = f.id
JOIN form fo ON h.form_id = fo.id
WHERE DATEDIFF(year, s.br_date, GETDATE()) < 27
GROUP BY 
    f.faculty_name,
    fo.form_name,
    h.course
ORDER BY 
    f.faculty_name,
    fo.form_name,
    h.course;

-- 16
SELECT 
    f.faculty_name,
    COUNT(DISTINCT s.id) AS students_surname_s
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN [hours] h ON p.hours_id = h.id
JOIN faculty f ON h.faculty_id = f.id
WHERE s.last_name LIKE N'С%' OR s.last_name LIKE N'с%'
GROUP BY 
    f.faculty_name
ORDER BY 
    f.faculty_name;

-- podp

--1
SELECT 
    id,
    last_name, 
    f_name, 
    s_name, 
    exm
FROM stud
WHERE exm <= (SELECT MAX(exm) * 0.8 FROM stud)
ORDER BY exm DESC;

--2
SELECT 
    id,
    last_name, 
    f_name, 
    s_name, 
    exm
FROM stud
WHERE exm = (SELECT MAX(exm) FROM stud);

--3
SELECT s.last_name
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN hours h ON p.hours_id = h.id
WHERE h.faculty_id = (
    SELECT TOP 1 h2.faculty_id
    FROM process p2
    JOIN hours h2 ON p2.hours_id = h2.id
    GROUP BY h2.faculty_id
    ORDER BY COUNT(p2.stud_id) DESC
);

--4
SELECT 
    s.last_name, 
    s.f_name, 
    s.s_name
FROM stud s
JOIN process p ON s.id = p.stud_id
WHERE p.hours_id NOT IN (
    -- Подзапрос: находим все ID учебных групп (комбинация курса, формы и фак-та), 
    -- в которых учится хотя бы один студент без отчества
    SELECT DISTINCT p2.hours_id
    FROM process p2
    JOIN stud s2 ON p2.stud_id = s2.id
    WHERE s2.s_name IS NULL OR s2.s_name = ''
);

--5
SELECT DISTINCT
    s.last_name,
    s.f_name,
    s.s_name
FROM stud s
JOIN process p ON s.id = p.stud_id
WHERE p.hours_id IN (
    -- Подзапрос: находим ID групп(ы), в которых учится Богоявленский
    SELECT p2.hours_id
    FROM process p2
    JOIN stud s2 ON p2.stud_id = s2.id
    WHERE s2.last_name = N'Богоявленский'
)
-- Исключаем самого Богоявленского из итогового списка
AND s.last_name <> N'Богоявленский';

--6
SELECT DISTINCT
    s.last_name,
    s.f_name,
    s.s_name
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN hours h ON p.hours_id = h.id
WHERE h.course IN (
    -- Подзапрос: находим номера курсов, на которых учатся Зингель или Зайцева
    SELECT h2.course
    FROM stud s2
    JOIN process p2 ON s2.id = p2.stud_id
    JOIN hours h2 ON p2.hours_id = h2.id
    WHERE s2.last_name = N'Зингель' OR s2.last_name = N'Зайцева'
)
-- Исключаем самих студентов из итогового списка
AND s.last_name NOT IN (N'Зингель', N'Зайцева');

--7

SELECT 
    s.last_name, 
    s.f_name, 
    s.s_name
FROM stud s
JOIN process p ON s.id = p.stud_id
WHERE p.hours_id IN (
    -- Подзапрос: находим ID групп (hours_id), 
    -- где количество иностранцев (без отчества) > 1
    SELECT p2.hours_id
    FROM process p2
    JOIN stud s2 ON p2.stud_id = s2.id
    WHERE s2.s_name IS NULL OR s2.s_name = N''
    GROUP BY p2.hours_id
    HAVING COUNT(s2.id) > 1
);

--8
SELECT 
    s.last_name, 
    s.f_name, 
    s.s_name,
    h.course,
    f.faculty_name,
    -- Подзапрос для подсчета всех студентов на данном потоке
    (SELECT COUNT(*) 
     FROM process p2 
     WHERE p2.hours_id = p.hours_id) AS total_students_on_flow
FROM stud s
JOIN process p ON s.id = p.stud_id
JOIN hours h ON p.hours_id = h.id
JOIN faculty f ON h.faculty_id = f.id
WHERE s.s_name IS NULL OR s.s_name = N''
ORDER BY f.faculty_name, h.course;

