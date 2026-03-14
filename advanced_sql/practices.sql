-- Find jobs with salary greater than 100k
SELECT
    job_title_short,
    salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg > 100000;

-- Practice problem 1
-- Jobs that allow working from home
SELECT
    job_title_short,
    job_location
FROM job_postings_fact
WHERE job_work_from_home = TRUE;

-- Wildcard
-- Find job titles containing the word "Data"
SELECT
    job_title
FROM job_postings_fact
WHERE job_title LIKE '%Data%';

-- ALIAS
-- Rename columns for readability
SELECT
    job_title_short AS job_role,
    salary_year_avg AS average_salary
FROM job_postings_fact;

-- Practice problem 2
-- Find jobs located in the United States
SELECT
    job_title_short,
    job_country
FROM job_postings_fact
WHERE job_country = 'United States';

-- OPERATIONS
-- Convert hourly salary to yearly estimate
SELECT
    job_title_short,
    salary_hour_avg,
    salary_hour_avg * 2080 AS estimated_year_salary
FROM job_postings_fact;

-- aggregate functions
-- Average salary for Data Analyst roles
SELECT
    AVG(salary_year_avg) AS avg_salary
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst';

-- Practice problem 3
-- Count the number of job postings for each job title
SELECT
    job_title_short,
    COUNT(*) AS total_jobs
FROM job_postings_fact
GROUP BY job_title_short;

--NULL values
-- Find jobs with missing salary information
SELECT
    job_title_short
FROM job_postings_fact
WHERE salary_year_avg IS NULL;

-- JOINs
-- Join jobs with company names
SELECT
    j.job_title_short,
    c.name AS company_name
FROM job_postings_fact j
JOIN company_dim c
    ON j.company_id = c.company_id;

-- Practice problem 4
-- Find the top 5 companies with the most job postings
SELECT
    c.name AS company_name,
    COUNT(*) AS total_jobs
FROM job_postings_fact j
JOIN company_dim c
    ON j.company_id = c.company_id
GROUP BY c.name
ORDER BY total_jobs DESC
LIMIT 5;

-- MANIPULATING TABLES

-- Add a new column to store job category
ALTER TABLE job_postings_fact
ADD COLUMN job_category TEXT;

-- Remove the column
ALTER TABLE job_postings_fact
DROP COLUMN job_category;

-- DATA FUNCTIONS
-- Extract the year from job posting date
SELECT
    job_title_short,
    EXTRACT(YEAR FROM job_posted_date) AS posting_year
FROM job_postings_fact;

-- Count jobs posted per month
SELECT
    DATE_TRUNC('month', job_posted_date) AS month,
    COUNT(*) AS total_jobs
FROM job_postings_fact
GROUP BY month
ORDER BY month;

-- Practice problem 5
-- Count the number of jobs posted in the year 2023
SELECT
    COUNT(*) AS jobs_2023
FROM job_postings_fact
WHERE EXTRACT(YEAR FROM job_posted_date) = 2023;


-- CASE WHEN
-- Categorize salaries into ranges
SELECT
    job_title_short,
    salary_year_avg,
    
    CASE
        WHEN salary_year_avg >= 150000 THEN 'High Salary'
        WHEN salary_year_avg >= 80000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category

FROM job_postings_fact;

-- SUBQUERIES AND CTEs

--Subquery
-- Find jobs with salary above the average salary
SELECT
    job_title_short,
    salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg > (

    -- Subquery calculating average salary
    SELECT AVG(salary_year_avg)
    FROM job_postings_fact

);

-- CTE
-- Create a temporary result with average salary
WITH avg_salary AS (

    SELECT AVG(salary_year_avg) AS avg_sal
    FROM job_postings_fact

)

SELECT
    job_title_short,
    salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg > (
    SELECT avg_sal FROM avg_salary
);

-- Find companies with more than 100 job postings
SELECT
    c.name AS company_name,
    COUNT(*) AS total_jobs
FROM job_postings_fact j
JOIN company_dim c
    ON j.company_id = c.company_id
GROUP BY c.name
HAVING COUNT(*) > 100;


-- UNION
-- Combine Data Analyst and Data Scientist jobs
SELECT job_title_short
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'

UNION

SELECT job_title_short
FROM job_postings_fact
WHERE job_title_short = 'Data Scientist';


-- UNION ALL
-- Keeps duplicates
SELECT job_title_short
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'

UNION ALL

SELECT job_title_short
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst';

-- PRACTICE PROBLEM 6
-- Find unique job titles that either allow working from home or do not mention a degree requirement
SELECT job_title
FROM job_postings_fact
WHERE job_work_from_home = TRUE

UNION

SELECT job_title
FROM job_postings_fact
WHERE job_no_degree_mention = TRUE;