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
		,Y12._Count_ as Y12_Count
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

	-- compare all available years by total department salary spending
	select top 10
		Y18.Department_Description
		,format(Y12.Salary,'c') as _2012
		,format(Y13.Salary,'c') as _2013
		,format(Y14.Salary,'c') as _2014
		,format(Y15.Salary,'c') as _2015
		,format(Y16.Salary,'c') as _2016
		,format(Y17.Salary,'c') as _2017
		,format(Y18.Salary,'c') as _2018
		
	from (select [Department_Description]  --subselect groups departments that existed in the 2018 dataset
			,sum([Salary]) as Salary
		  from [dbo].[ASU Employee Salary Data - 2018]
		  group by [Department_Description]) as Y18
		
		inner join (select [Department_Description] --departments that existed in 2012 are grouped and joined
			         ,sum([Salary]) as Salary
		             from [dbo].[ASU Employee Salary Data - 2012]
		             group by [Department_Description]) as Y12 
					 on Y12.[Department_Description] = Y18.[Department_Description]
		inner join (select [Department_Description] --departments that existed in 2013 are grouped and joined
			         ,sum([Salary]) as Salary
		             from [dbo].[ASU Employee Salary Data - 2013]
		             group by [Department_Description]) as Y13
					 on Y13.[Department_Description] = Y18.[Department_Description]
		inner join (select [Department_Description] --departments that existed in 2014 are grouped and joined
			         ,sum([Salary]) as Salary
		             from [dbo].[ASU Employee Salary Data - 2014]
		             group by [Department_Description]) as Y14 
					 on Y14.[Department_Description] = Y18.[Department_Description]
		inner join (select [Department_Description] --departments that existed in 2015 are grouped and joined
			         ,sum([Salary]) as Salary
		             from [dbo].[ASU Employee Salary Data - 2015]
		             group by [Department_Description]) as Y15
					 on Y15.[Department_Description] = Y18.[Department_Description]
		inner join (select [Department_Description] --departments that existed in 2016 are grouped and joined
			         ,sum([Salary]) as Salary
		             from [dbo].[ASU Employee Salary Data - 2016]
		             group by [Department_Description]) as Y16
					 on Y16.[Department_Description] = Y18.[Department_Description]
		inner join (select [Department_Description] --departments that existed in 2017 are grouped and joined
			         ,sum([Salary]) as Salary
		             from [dbo].[ASU Employee Salary Data - 2017]
		             group by [Department_Description]) as Y17
					 on Y17.[Department_Description] = Y18.[Department_Description]

	order by Y18.Salary desc


	