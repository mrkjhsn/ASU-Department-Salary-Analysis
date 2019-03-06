-- finds top ASU departments by salary spending, and percent change in spending over the past 5 years
	select
		Y17.Department_Description
		,format(Y12.Salary,'c') as FY12
		,format(Y17.Salary,'c') as FY17
		,format(((Y17.Salary - Y12.Salary)/Y12.Salary),'p') as Percent_Change
		
	from (select [Department_Description]  --subselect groups departments that existed in the 2017 dataset
			,sum([Salary]) as Salary
		  from [dbo].[ASU Employee Salary Data - 2017]
		  group by [Department_Description]) as Y17

		 inner join (select [Department_Description] --departments that existed in 2012 are grouped and joined
			         ,sum([Salary]) as Salary
		             from [dbo].[ASU Employee Salary Data - 2012]
		             group by [Department_Description]) as Y12 

		  on Y12.[Department_Description] = Y17.[Department_Description]
	order by Y17.Salary desc

	
	-- finds standard deviation of salaries for 2012 and 2017 as well as count of personel, orders descending by largest deviation in 2017
	select
		Y17.Department_Description
		,Y12._Stdev_ as Y12_Stdev
		,Y12._Count_ as Y12_Stdev
		,Y17._Stdev_ as Y17_Stdev
		,Y17._Count_ as Y17_Count
			
	from (select [Department_Description]  --subselect groups departments that existed in the 2017 dataset
			,count([Salary]) as _Count_
			,format(stdev(Salary),'c') as _Stdev_
			,stdev(Salary) as _Stdev2_
		  from [dbo].[ASU Employee Salary Data - 2017]
		  group by [Department_Description]) as Y17

		 inner join (select [Department_Description] --departments that existed in 2012 are grouped and joined
			           ,count([Salary]) as _Count_
					   ,format(stdev(Salary),'c') as _Stdev_
		             from [dbo].[ASU Employee Salary Data - 2012]
		             group by [Department_Description]) as Y12 

		  on Y12.[Department_Description] = Y17.[Department_Description]
	order by Y17._Stdev2_ desc