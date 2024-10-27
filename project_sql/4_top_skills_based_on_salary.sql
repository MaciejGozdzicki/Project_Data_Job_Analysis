/* Question: What are top skills based on salary for my role?
- find average salary associated with each skill 
*/

select 
    skills,
    round(avg(salary_year_avg),0) as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id 
where
    job_title_short like 'Data Analyst' and
    salary_year_avg is not null and
    job_work_from_home = True
group by
    skills
order by 
    avg_salary desc
LIMIT 30

/* 
    Top-Paid Skills:
The highest-paying skills are PySpark ($208,172) and Bitbucket ($189,155),
suggesting high demand for expertise in big data and version control tools.

Data Science & Machine Learning Tools:
Skills like DataRobot ($155,486), Jupyter ($152,777), Pandas ($151,821), and Scikit-learn ($125,781)
show competitive salaries, indicating strong demand for machine learning and data manipulation tools.

Big Data & Cloud Platforms:
Skills in big data and cloud, such as Databricks ($141,907), Kubernetes ($132,500), and GCP ($122,500),
offer robust salaries, reflecting their importance in data infrastructure and cloud computing.
*/
