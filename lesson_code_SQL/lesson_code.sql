/*CREATE TABLE january_job_postings AS
 SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_job_postings AS
 SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_job_postings AS
 SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;
CREATE TABLE april_job_postings AS
 SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 4;

SELECT *
FROM january_job_postings;

SELECT *
FROM february_job_postings;

SELECT *
FROM march_job_postings;

SELECT *
FROM april_job_postings;


SELECT 
    COUNT(job_id) AS number_of_available_jobs,
    job_title_short,
    job_location,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York' THEN 'Local' 
        ELSE 'Onsite' 

    END AS location_category
FROM 
    job_postings_fact
GROUP BY 
    location_category;

WITH january_jobs AS (
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_postings_fact) = 1
)
SELECT *
FROM january_jobs;


SELECT
         company_id,
        name AS company_name
FROM company_dim
WHERE company_id IN (
SELECT 
     company_id
FROM job_postings_fact
WHERE job_no_degree_mention = true
)
GROUP BY company_id;

WITH company_job_count AS (
SELECT 
    company_id,
    COUNT(*) AS total_number_of_jobs
FROM  
        job_postings_fact
GROUP BY
        company_id
)


SELECT company_dim.name AS company_name,
        company_job_count.total_number_of_jobs
    FROM
         company_dim
    LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id 

ORDER BY total_number_of_jobs DESC
*/

SELECT 
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM(
        SELECT *
        FROM 
            january_job_postings
    UNION ALL
        SELECT *
        FROM
            february_job_postings
    UNION ALL
        SELECT *
        FROM 
            march_job_postings
    WHERE salary_year_avg > 70000 AND job_title_short = 'Data Analyst'
    ORDER BY
        salary_year_avg DESC 
)