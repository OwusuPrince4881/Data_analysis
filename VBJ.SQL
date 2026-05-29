SELECT *
FROM skills_dim;

SELECT DISTINCT skills,
         type
FROM skills_dim
WHERE type = 'programming';

SELECT 
    type,
    COUNT(type) AS total_num_of_skills
FROM skills_dim
GROUP BY type
ORDER BY total_num_of_skills DESC;

SELECT 
    type, 
    COUNT(*) AS total_skills
FROM skills_dim
GROUP BY type
ORDER BY total_skills DESC;


SELECT *
FROM skills_dim
WHERE skills ILIKE '%SQL%';

SELECT 
    type,
    COUNT(type) AS count
FROM skills_dim
GROUP BY type
HAVING COUNT(type) > 15;

SELECT 
    skills,
    type,
    CASE 
        WHEN type IN ('programming', 'databases') THEN 'Core Tech'
        WHEN type IN ('cloud', 'webframeworks') THEN 'Platforms' 
        ELSE 'Tools and Analytics'
    END AS skill_class
FROM skills_dim;

SELECT 
    skills,
    type,
    CASE 
        WHEN type IN ('programming', 'databases') THEN 'Core Tech'
        WHEN type IN ('cloud', 'webframeworks') THEN 'Platforms'
        ELSE 'Tools & Analytics'
    END AS skill_class
FROM skills_dim
ORDER BY skill_class ASC, skills ASC;

SELECT *
FROM skills_dim
WHERE type <>'programming';

SELECT *
FROM skills_dim 
WHERE skill_id < 70 AND skills = 'sql';

SELECT skills,
        LENGTH(skills) AS name  
FROM    
    skills_dim 
WHERE skills LIKE '%_%' OR skills LIKE '% %';

SELECT *
FROM skills_dim
WHERE LENGTH(skills) = 3
ORDER BY skill_id DESC;

SELECT *
FROM skills_dim
ORDER BY 
        CASE 
            WHEN type = 'databases' THEN 0 ELSE 1 END ASC,
            type ASC,
            skills ASC;


SELECT DISTINCT
        type 
FROM skills_dim
WHERE NOT skills = 'html' OR type = 'css';

SELECT DISTINCT type
FROM skills_dim
WHERE type NOT IN (
    SELECT DISTINCT type 
    FROM skills_dim 
    WHERE skills IN ('html', 'css')
);

SELECT DISTINCT type
FROM skills_dim 
WHERE NOT type IN(
    SELECT DISTINCT type 
    FROM skills_dim
    WHERE skills IN(
        'html', 'css'
    )
);

SELECT *
FROM skills_dim
    WHERE
        skill_id % 2 = 0 AND
         skills NOT LIKE '%a%';

SELECT 
    skill_id, 
    skills, 
    type
FROM skills_dim
WHERE skill_id % 2 = 0 
  AND skills NOT ILIKE '%a%';

SELECT 
    COUNT(*) AS num_of_skills,
    type,
    ROUND(AVG(LENGTH(skills)), 2) AS avg_name_length
FROM skills_dim
    GROUP BY type
ORDER BY avg_name_length DESC;

SELECT 
    skill_id,
    skills AS skill_name,
    type,
    LENGTH(skills) AS num_of_characters
FROM skills_dim
WHERE skills LIKE '%-%' OR skills LIKE '% %'
ORDER BY num_of_characters DESC;

SELECT *
FROM skills_dim
WHERE skills LIKE '%access%' OR skills LIKE '%visual%';

SELECT 
    type,
    COUNT(type) AS total
FROM skills_dim
WHERE NOT type = 'programming'
    GROUP BY type
HAVING COUNT(type) > 10;
   
job_id   SELECT 
    type,
    COUNT(*) AS total_skills
FROM skills_dim
WHERE type != 'programming' -- Filters out individual rows BEFORE grouping
GROUP BY type
HAVING COUNT(*) > 10;       -- Filters groups AFTER aggregation occurs

SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        skills_dim.type,
        skills_job_dim.job_id
FROM  
    skills_job_dim
RIGHT JOIN
     skills_dim
        ON skills_dim.skill_id = skills_job_dim.skill_id
        WHERE skills_job_dim IS NULL
       

SELECT 
    skill_id,
    skills,
    type,
    CONCAT(skills, ' - ', type) AS skills_type,
    UPPER(skills) AS upper_skills,
    LENGTH(skills) AS len_skills,
   LENGTH(TRIM(skills)) AS len_skills_trim,
   LENGTH(skills) - LENGTH(TRIM(skills)) AS diff_ls_lst,
    
FROM skills_dim;

SELECT 
    job_schedule_type,
    REPLACE('full-time', '-', ' ')
FROM job_postings_fact
LIMIT 100;