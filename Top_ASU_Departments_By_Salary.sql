--finds top ASU departments by salary spending, and change over the past 5 years
select
		Y17.Department_Description
		,format(Y12.Salary,'c') as FY12
		,format(Y17.Salary,'c') as FY17
		,format(((Y17.Salary - Y12.Salary)/Y12.Salary),'p') as Percent_Change
		
	from (select [Department_Description]  --subselect groups departments that existed in the 2017 data 
			,sum([Salary]) as Salary
		  from [dbo].[ASU Employee Salary Data - 2017]
		  group by [Department_Description]) as Y17

		 inner join (select [Department_Description] --departments that existed in 2012 are grouped and joined
			         ,sum([Salary]) as Salary
		             from [dbo].[ASU Employee Salary Data - 2012]
		             group by [Department_Description]) as Y12 

		  on Y12.[Department_Description] = Y17.[Department_Description]
	order by Y17.Salary desc