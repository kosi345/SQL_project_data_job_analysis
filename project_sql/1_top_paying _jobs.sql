-- top paying 10  data sciencist jobs
SELECT 
jp.job_id,
jp.job_title,
jp.job_location,
cd.name AS company_name,
jp.job_schedule_type,
jp.salary_year_avg,
jp.job_posted_date
FROM job_postings_fact jp
LEFT JOIN company_dim cd ON jp.company_id = cd.company_id


WHERE job_title_short = 'Data Scientist' AND
job_location = 'Anywhere' AND
salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC

LIMIT 10;