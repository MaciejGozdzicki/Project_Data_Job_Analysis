/* What are the most optimal skills (High demand and high salary)?
- Concentrated mostly on remote jobs 
*/

-- using code from 3rd and 4th questions as cte 

 with skills_demand as (
    select 
        skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id 
    where
        job_title_short like 'Data Analyst' and
        salary_year_avg is not null and
        job_work_from_home = True
    group by
        skills_dim.skill_id
),

average_salary as (
    select 
        skills_job_dim.skill_id,
        round(avg(job_postings_fact.salary_year_avg),0) as avg_salary
    from job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id 
    where
        job_title_short like 'Data Analyst' and
        salary_year_avg is not null and
        job_work_from_home = True 
    group by
         skills_job_dim.skill_id
) 


/* since we want to speed up query we can remove order by, we also don't want to limit queries (thus I deleted limit)
To select I added skill_id because we will use key to join those 2 CTE's, also since we use skill id it's better to group by skill id
*/

select 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
from 
    skills_demand
inner join average_salary on skills_demand.skill_id = average_salary.skill_id
where
    demand_count > 20
order by
    avg_salary desc
Limit 30  

-- Now let's rewrite this in more compact way

/* 

Select
    skills_dim.skill_id,
    skills_dim.skills,
    Count(skills_job_dim.job_id) as demand_count,
    round(avg(job_postings_fact.salary_year_avg), 0) as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id 
where 
    job_title_short = 'Data Analyst' and
    salary_year_avg is not null and
    job_work_from_home = True 
group by
    skills_dim.skill_id
having
    count(skills_job_dim.job_id) > 20
order by 
    avg_salary desc
limit 25

*/ 
 
