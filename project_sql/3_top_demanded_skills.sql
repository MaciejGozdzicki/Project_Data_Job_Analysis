/* Question: What are the most in-demand skills for my role?
-Join proper tables
-Identify top 5 in-demand skills
-All job postings (including those with null in salary bracket and not remote ones)
*/

select 
    skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id 
where
    job_title_short like 'Data Analyst'
group by
    skills
order by demand_count desc
LIMIT 5