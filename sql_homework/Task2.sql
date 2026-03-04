-- 2. заполнение бд тестовыми данными
WITH test_data(city_id, area_name) AS (SELECT generate_series(1, 100) AS area_id,
                                              md5(random()::varchar) AS area_name)
INSERT INTO areas(name)
SELECT area_name FROM test_data;

WITH test_data(id, position_name) AS (SELECT generate_series(1, 100) AS id,
                                             md5(random()::varchar) AS position_name)
INSERT INTO positions(name)
SELECT position_name FROM test_data;


WITH test_data(id, work_format) AS (SELECT generate_series(1, 3) AS id,
                                           md5(random()::varchar) AS work_format)
INSERT INTO work_formats(title)
SELECT work_format FROM test_data;


WITH test_data(id, skill_name) as (SELECT generate_series(1, 200) AS id,
                                          md5(random()::varchar) AS skill_name)
INSERT INTO skills(name)
SELECT skill_name FROM test_data;


WITH test_data(id, employment_type) AS (SELECT generate_series(1, 3) AS id,
                                               md5(random()::varchar) AS employment_type)
INSERT INTO employments(employment_type)
select employment_type FROM test_data;


WITH test_data(id, experience_name) AS (SELECT generate_series(1, 10) AS id,
                                               md5(random()::varchar) AS experience_name)
INSERT INTO experience(name)
select experience_name FROM test_data;


WITH test_data(id, id_profession, id_candidate, id_employment_type, id_work_format, id_experience, compensation_from, working_hours, new_date) AS (
    SELECT generate_series(1, 100000) AS id,
           (random() * 99 + 1)::int AS id_profession,
           (random() * 99 + 1)::int AS id_candidate,
           (random() * 2 + 1)::int AS id_employment_type,
           (random() * 2 + 1)::int AS id_work_format,
           (random() * 9 + 1)::int AS id_experience,
           round((random() * 100000))::int AS compensation_from,
           (random() * 12 + 1)::int AS working_hours,
           (current_date - (random() * 3650)::int) AS new_date
)
INSERT INTO resumes(id_position, id_candidate, id_employment_type, id_work_format, id_experience, compensation_from, working_hours, created_date)
SELECT  id_profession, id_candidate, id_employment_type, id_work_format, id_experience, compensation_from, working_hours, new_date FROM test_data;


WITH test_data(id, title, salary, working_hours, id_area, id_company, id_work_format, id_profession, id_experience, created_date) AS (
    SELECT generate_series(1, 10000) AS id,
           md5(random()::varchar) AS title,
           (random() * 100000)::int AS salary,
           (random() * 8 + 1)::int AS working_hours,
           (random() * 99 + 1)::int AS id_area,
           (random() * 99 + 1)::int AS id_company,
           (random() * 2 + 1)::int AS id_work_format,
           round((random() * 99 + 1))::int AS id_profession,
           (random() * 9 + 1)::int AS id_experience,
           (current_date - (random() * 3650)::int) AS created_date
)
INSERT INTO vacancies(title, compensation_from, compensation_to, working_hours, id_area, id_company, id_work_format, id_position, id_experience, created_date)
SELECT title, salary, salary + (random() * 99999 + 1)::int, working_hours, id_area, id_company, id_work_format, id_profession, id_experience, created_date FROM test_data;


WITH test_data(id, id_resume, id_vacancy, created_date) AS (
    SELECT generate_series(1, 200000) AS id,
           (random() * 9999 + 1)::int AS id_resume,
           (random() * 9999 + 1)::int AS id_vacancy,
           (current_date - (random() * 3650)::int) AS created_date
)
INSERT INTO responses(id_resume, id_vacancy, created_date)
SELECT  id_resume, id_vacancy, created_date from test_data;


WITH test_data(id, id_vacancy, id_skill) AS (SELECT generate_series(1, 100) AS id,
                                                    (random() * 9999 + 1)::int AS id_vacancy,
                                                    (random() * 199 + 1)::int  AS id_skill
)
INSERT INTO vacancy_skills(id_vacancy, id_skill)
SELECT id_vacancy, id_skill FROM test_data;


WITH test_data(id, id_resume, id_skill) AS (SELECT generate_series(1, 100) AS id,
                                                   (random() * 99999 + 1)::int as id_resume,
                                                   (random() * 199 + 1)::int  as id_skill
)
INSERT INTO resume_skills(id_resume, id_skill)
SELECT id_resume, id_skill from test_data;
