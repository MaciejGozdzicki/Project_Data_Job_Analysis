# Introduction
Are you intrested in data analysis? 👨‍💻 📊 Wanna explore data job’s market?

This project gives insight about it! 🔥 I analyzed market for most indemand skills,

most paying skills and high paying jobs 💰💸 Project mailny focuses on data analyst role

If you are intrested in SQL queries you can check them here [project_sql folder](/project_sql/)

# Background
My name is Maciej and I aspire to become data analyst. If you are like me, you can definetely check this project! This project was born to find optimal skills to learn (both in demand and high-paying), and find high paying jobs.

## For this we need to answer several questions:

1. What are top-paying jobs for my role?
2. What are skills required for these jobs?
3. What are the most in-demand skills for my role?
4. What are top skills based on salary for my role?
5. What are the optimal skills to learn? (both high demand and high paying)

# Tools I Used:

- **SQL**: Main tool for my analysis, that allowed me to query the database
- **VS Code**: My go-to environment for managing databases and executing queries
- **PostgreSQL**: Chosen database management system
- **Git and GitHub**: Way to share my work 

# The Anaysis

Each query aims at answering different question,
to get insight from different aspects of data market

### 1. Top Paying Jobs
In order to identify top paying jobs I filtered jobs by average yearly salary (excluding jobs with no given salary). Jobs are selected for remote data analyst role 
 ```sql
 Select 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name
from
    job_postings_fact
left join company_dim on job_postings_fact.company_id = company_dim.company_id
where
    job_title_short like 'Data Analyst' and
     job_location = 'Anywhere' and
     salary_year_avg is not null
order by 
    salary_year_avg desc
limit 10
```
