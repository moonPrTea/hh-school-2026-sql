-- 4. Получение месяца с наибольшим кол-вом вакансий и месяца с наибольшим количеством резюме
(SELECT
     'month with max vacancies' AS option_name,
     COUNT(vacancies.id) AS count_vacancies,
     EXTRACT(MONTH FROM vacancies.created_date) AS month,
     EXTRACT(YEAR FROM vacancies.created_date) AS year
 FROM vacancies
 GROUP BY EXTRACT(MONTH FROM vacancies.created_date),
          EXTRACT(YEAR FROM vacancies.created_date)
 ORDER BY count_vacancies DESC
 limit 1)
UNION
(SELECT
     'month with max resumes' AS task_name,
     COUNT(resumes.id) AS count_resumes,
     EXTRACT(MONTH FROM resumes.created_date) AS month,
     EXTRACT(YEAR FROM resumes.created_date) AS year
 from resumes
 GROUP BY EXTRACT(MONTH FROM resumes.created_date),
          EXTRACT(YEAR FROM resumes.created_date)
 ORDER BY count_resumes DESC
 limit 1);