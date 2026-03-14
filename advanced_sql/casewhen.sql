SELECT 
CASE
WHEN job_location = 'Anywhere' THEN 'Remote'
WHEN job_location = 'New York, NY' THEN 'local'
ELSE 'onsite'

END AS location_catetory,
COUNT(CASE
WHEN job_location = 'Anywhere' THEN 'Remote'
WHEN job_location = 'New York, NY' THEN 'local'
ELSE 'onsite'

END)

FROM job_postings_fact
GROUP BY location_catetory