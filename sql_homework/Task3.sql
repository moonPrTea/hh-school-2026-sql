-- 3. Получение средних значений по регионам
SELECT
    areas.id AS area_id,
    AVG(vacancies.compensation_from) AS avg_compensation_from,
    AVG(vacancies.compensation_to) AS avg_compensation_to,
    AVG((vacancies.compensation_from + vacancies.compensation_to) / 2) AS avg_compensation_from_and_to
    FROM vacancies
JOIN areas ON vacancies.id_area = areas.id
GROUP BY areas.id
ORDER BY areas.id