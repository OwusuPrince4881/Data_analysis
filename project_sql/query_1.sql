--just an experiment to see if I can write a query that will return the number of orders for each customer, along with the customer's name and email address.
SELECT *
FROM april_job_postings;
SELECT *
FROM job_postings_fact;

SELECT 
    COUNT(job_id) AS number_of_available_jobs,
    job_title_short,
    job_location,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York' THEN 'Local' 
        ELSE 'Onsite' 

    END AS location_category
    