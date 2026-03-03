-- 5. Запрос для получения id, title вакансий, которые собрали больше 5 откликов в первую неделю после публикации
SELECT
    vacancies.id AS id_vacancy,
    vacancies.title AS vacancy_title,
    COUNT(responses.id) AS count_responses
FROM responses
JOIN vacancies ON vacancies.id = responses.id_vacancy
WHERE responses.created_date >= vacancies.created_date AND responses.created_date <= vacancies.created_date + INTERVAL '7 days'
GROUP BY vacancies.id, vacancies.title
HAVING COUNT(responses.id) > 5
ORDER BY count_responses DESC;