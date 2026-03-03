-- 1. Создание бд hh.ru
CREATE TABLE areas (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);

CREATE TABLE skills (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(100) NOT NULL
);

CREATE TABLE experience (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(100) NOT NULL
);

CREATE TABLE positions (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);

CREATE TABLE work_formats (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(200) NOT NULL
);

CREATE TABLE employments (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employment_type VARCHAR(200) NOT NULL
);

CREATE TABLE resumes (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_work_format INTEGER NOT NULL,
    id_candidate INTEGER NOT NULL,
    id_position INTEGER NOT NULL,
    id_employment_type INTEGER NOT NULL,
    description text,
    working_hours INTEGER NOT NULL,
    compensation_from DECIMAL(10, 2) NOT NULL,
    created_date DATE NOT NULL,
    FOREIGN KEY (id_position) REFERENCES positions(id),
    FOREIGN KEY (id_employment_type) REFERENCES employments(id),
    FOREIGN KEY (id_work_format) REFERENCES work_formats(id)
);

CREATE TABLE resume_skills (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    id_resume INTEGER,
    id_skill INTEGER,
    FOREIGN KEY (id_skill) REFERENCES skills(id),
    FOREIGN KEY (id_resume) REFERENCES resumes(id)
);

CREATE TABLE vacancies (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_area INTEGER NOT NULL,
    id_company INTEGER NOT NULL,
    id_work_format INTEGER NOT NULL,
    id_position INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    description text,
    compensation_from DECIMAL(10, 2) NOT NULL,
    compensation_to DECIMAL(10, 2) NOT NULL,
    work_hours INTEGER NOT NULL,
    created_date DATE NOT NULL,
    FOREIGN KEY (id_area) REFERENCES areas(id),
    FOREIGN KEY (id_work_format) REFERENCES work_formats(id),
    FOREIGN KEY (id_position) REFERENCES positions(id)
);

CREATE TABLE vacancy_skills (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    id_vacancy INTEGER,
    id_skill INTEGER,
    FOREIGN KEY (id_skill) REFERENCES skills(id),
    FOREIGN KEY (id_vacancy) REFERENCES vacancies(id)
);

CREATE TABLE responses (
   id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   id_vacancy INTEGER NOT NULL,
   id_resume INTEGER NOT NULL,
   archived bool DEFAULT FALSE,
   created_date DATE NOT NULL,
   FOREIGN KEY (id_vacancy) REFERENCES vacancies(id),
   FOREIGN KEY (id_resume) REFERENCES resumes(id)
);