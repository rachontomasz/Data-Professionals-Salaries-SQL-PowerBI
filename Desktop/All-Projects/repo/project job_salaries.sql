/* TOP well-paid Data Science jobs in 2024 (USA)*/
 with
 ds_top_jobs as 
 (
select 
	job_title
	,round(avg(salary_in_usd),0) as avg_usd_salary
	,work_models
	,work_year
	from job_data
	where salary_currency = 'USD' and work_year = '2024'
	group by 1,3,4
	order by 2 desc
	limit 10
	),
	/* Unique list of jobs titles*/
	list_of_jobs as
	 (
	 select 
	 count(distinct job_title)
	 from job_data
	 ),
	/* avg salary for Data Analyst entry level in the world*/
	avg_ds_salary as
	(
	select
	job_title
	,round(avg(salary_in_usd),0) 							as avg_junior_salary
	,company_location
	,case 
			when round(avg(salary_in_usd),0) < 23000 then 'low salary'
			when round(avg(salary_in_usd),0) between 23000 and 50000 then 'average salary'
	        else 'high salary'
	 end 													as salary_level
			from job_data
	where job_title = 'Data Analyst' and experience_level = 'Entry-level'
	group by 3
	order by 2 desc
	),
	/* Data Engineers earnings change in Poland 21-23 mid-level*/ 
	de_earnings as 
	(
    select
    job_title
    ,work_year
    ,salary_in_usd
    from job_data
    where employee_residence = 'Poland' and job_title = 'Data Engineer' and experience_level = 'Mid-level'
    order by 2 asc
	),
	/*salary in Data Management Jobs (USA)*/
	lead_salary as
	(
	select
	job_title
	,round(avg(salary_in_usd),0) as avg_lead_salary
	,company_location
		from job_data
		where job_title in ('Data Manager', 'Head of Data','Data Management Specialist','Data Lead','Lead Data Analyst')
		and company_location = 'United States'
		group by 1,3
		order by 2 desc
	)
	select * from list_of_jobs
	
	

	
 
	

	
    
	
	

