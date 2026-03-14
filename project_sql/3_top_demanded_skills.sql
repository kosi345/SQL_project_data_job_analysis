-- what are the top 5 most demanded skills for the top paying jobs?
SELECT skills,
COUNT(*) AS demand_count
FROM job_postings_fact jp
INNER JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE job_title_short = 'Data Scientist'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;