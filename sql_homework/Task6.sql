/*
В рамках текущих запросов индексы не целесообразно использовать, так как только в 1 из них есть доп условие.
Таблицы-справочники содержат по 1 дополнительному атрибуту, поэтому индексы в них только замедлят работу.

Для будущих аналитических запросов можно добавить:
1. resume_avg_salary_in_position_index - получение средней ожидаемой зарплаты по профессии среди всех резюме
2. resume_position_work_format_index - отбор по профессии и формату работы
3. vacancy_compensation_in_regions_index - получение зарплат в вакансиях по регионам
4. vacancy_created_date_index - для отбора вакансий по дате публикации
5. responses_date_with_vacancy_index - получение откликов по определенной вакансии, сортировка от нового к старому
6. responses_date_with_resume_index - получение откликов по определенному резюме, сортировка от нового к старому
*/

CREATE INDEX resume_avg_salary_in_position_index ON resumes(id_position, compensation_from);
CREATE INDEX resume_position_work_format_index ON resumes(id_position, id_work_format);

CREATE INDEX vacancy_compensation_in_regions_index ON vacancies(id_area, compensation_from, compensation_to);
CREATE INDEX vacancy_created_date_index ON vacancies(created_date);

CREATE INDEX responses_date_with_vacancy_index ON responses(id_vacancy, created_date);
CREATE INDEX responses_date_with_resume_index ON responses(id_resume, created_date);
