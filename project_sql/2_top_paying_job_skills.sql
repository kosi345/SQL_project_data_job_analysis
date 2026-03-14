-- what what are the skills required for the top paying jobs in the data science field?
WITH top_paying_jobs AS (
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

LIMIT 10
)
SELECT top_paying_jobs.*, sd.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim sjd ON top_paying_jobs.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
ORDER BY top_paying_jobs.salary_year_avg DESC;

/* [
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_location": "Anywhere",
    "company_name": "Selby Jennings",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "550000.0",
    "job_posted_date": "2023-08-16 16:05:16",
    "skills": "sql"
  },
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_location": "Anywhere",
    "company_name": "Selby Jennings",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "550000.0",
    "job_posted_date": "2023-08-16 16:05:16",
    "skills": "python"
  },
  {
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "job_location": "Anywhere",
    "company_name": "Selby Jennings",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "525000.0",
    "job_posted_date": "2023-09-01 19:24:02",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Algo Capital Group",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Algo Capital Group",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "skills": "python"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Algo Capital Group",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "skills": "java"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Algo Capital Group",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "skills": "cassandra"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Algo Capital Group",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "skills": "spark"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Algo Capital Group",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "skills": "hadoop"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Algo Capital Group",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "skills": "tableau"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_location": "Anywhere",
    "company_name": "Teramind",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "job_posted_date": "2023-03-26 23:46:39",
    "skills": "azure"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_location": "Anywhere",
    "company_name": "Teramind",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "job_posted_date": "2023-03-26 23:46:39",
    "skills": "aws"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_location": "Anywhere",
    "company_name": "Teramind",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "job_posted_date": "2023-03-26 23:46:39",
    "skills": "tensorflow"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_location": "Anywhere",
    "company_name": "Teramind",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "job_posted_date": "2023-03-26 23:46:39",
    "skills": "keras"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_location": "Anywhere",
    "company_name": "Teramind",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "job_posted_date": "2023-03-26 23:46:39",
    "skills": "pytorch"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_location": "Anywhere",
    "company_name": "Teramind",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "job_posted_date": "2023-03-26 23:46:39",
    "skills": "scikit-learn"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_location": "Anywhere",
    "company_name": "Teramind",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "job_posted_date": "2023-03-26 23:46:39",
    "skills": "datarobot"
  },
  {
    "job_id": 457991,
    "job_title": "Head of Battery Data Science",
    "job_location": "Anywhere",
    "company_name": "Lawrence Harvey",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-10-02 16:40:07",
    "skills": "python"
  },
  {
    "job_id": 457991,
    "job_title": "Head of Battery Data Science",
    "job_location": "Anywhere",
    "company_name": "Lawrence Harvey",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-10-02 16:40:07",
    "skills": "aws"
  },
  {
    "job_id": 457991,
    "job_title": "Head of Battery Data Science",
    "job_location": "Anywhere",
    "company_name": "Lawrence Harvey",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-10-02 16:40:07",
    "skills": "gcp"
  },
  {
    "job_id": 129924,
    "job_title": "Director of Data Science",
    "job_location": "Anywhere",
    "company_name": "Storm4",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-01-21 11:09:36",
    "skills": "python"
  },
  {
    "job_id": 129924,
    "job_title": "Director of Data Science",
    "job_location": "Anywhere",
    "company_name": "Storm4",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-01-21 11:09:36",
    "skills": "pandas"
  },
  {
    "job_id": 129924,
    "job_title": "Director of Data Science",
    "job_location": "Anywhere",
    "company_name": "Storm4",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-01-21 11:09:36",
    "skills": "numpy"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Walmart",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "skills": "scala"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Walmart",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "skills": "java"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Walmart",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "skills": "spark"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Walmart",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "skills": "tensorflow"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Walmart",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "skills": "pytorch"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "company_name": "Walmart",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "skills": "kubernetes"
  }
] */