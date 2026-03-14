-- what is the most optimal skills?
SELECT 
sjd.skill_id,
skills,
ROUND(AVG(salary_year_avg), 0) AS avg_salary,
COUNT(*) AS demand_count
FROM job_postings_fact jp
INNER JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Scientist' AND job_work_from_home = TRUE
GROUP BY sjd.skill_id, skills
ORDER BY demand_count DESC , avg_salary DESC
LIMIT 25;