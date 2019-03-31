-- year over year, how many departments get added/removed? is that indicative of ASU strategy?
-- create table 'Department Changes', then populate that table with additions and removals for each year

	select 
		ADD_REM_AllYears.Calendar_Year
		,ADD_REM_AllYears.Department
		,ADD_REM_AllYears.ADD_or_REM
		,ADD_REM_AllYears.Total_Salary
	into [ASU_Professor_Salary].[dbo].[ASU_Dept_Changes]
	from 
	(select   -- 2013
		'2013' as Calendar_Year
		,FY12.Department_Description as Department -- add 2013
		,'REM' as ADD_or_REM -- add 'ADD' or 'REM' attribute column
		,sum(FY12.Salary) as Total_Salary
	from [dbo].[ASU Employee Salary Data - 2012] as FY12
	full outer join [dbo].[ASU Employee Salary Data - 2013] as FY13
		on FY13.[Department_Description] = FY12.Department_Description 
	where FY13.Department_Description is null
	group by FY12.Department_Description

union all
	
	select 
		FY13.Calendar_Year
		,FY13.Department_Description as Department -- add 2013
		,'ADD' as ADD_or_REM -- add 'ADD' or 'REM' attribute column
		,sum(FY13.Salary) as Total_Salary
	from [dbo].[ASU Employee Salary Data - 2012] as FY12
	full outer join [dbo].[ASU Employee Salary Data - 2013] as FY13
		on FY13.[Department_Description] = FY12.Department_Description 
	where FY12.Department_Description is null
	group by FY13.Calendar_Year, FY13.Department_Description
	
union all  -- 2014

	select 
		'2014' as Calendar_Year
		,FY13.Department_Description as Department 
		,'REM' as ADD_or_REM -- add 'ADD' or 'REM' attribute column
		,sum(FY13.Salary) as Total_Salary
	from [dbo].[ASU Employee Salary Data - 2013] as FY13
	full outer join [dbo].[ASU Employee Salary Data - 2014] as FY14
		on FY14.[Department_Description] = FY13.Department_Description 
	where FY14.Department_Description is null
	group by FY13.Department_Description

union all
	
	select 
		FY14.Calendar_Year
		,FY14.Department_Description as Department 
		,'ADD' as ADD_or_REM -- add 'ADD' or 'REM' attribute column
		,sum(FY14.Salary) as Total_Salary
	from [dbo].[ASU Employee Salary Data - 2013] as FY13
	full outer join [dbo].[ASU Employee Salary Data - 2014] as FY14
		on FY14.[Department_Description] = FY13.Department_Description 
	where FY13.Department_Description is null
	group by FY14.Calendar_Year, FY14.Department_Description
	
union all	-- 2015

	select 
		'2015' as Calendar_Year
		,FY14.Department_Description as Department 
		,'REM' as ADD_or_REM
		,sum(FY14.Salary) as Total_Salary
	from [dbo].[ASU Employee Salary Data - 2014] as FY14
	full outer join [dbo].[ASU Employee Salary Data - 2015] as FY15
		on FY15.[Department_Description] = FY14.Department_Description 
	where FY15.Department_Description is null
	group by FY14.Department_Description

union all
	
	select 
		FY15.Calendar_Year
		,FY15.Department_Description as Department 
		,'ADD' as ADD_or_REM
		,sum(FY15.Salary) as Total_Salary
	from [dbo].[ASU Employee Salary Data - 2014] as FY14
	full outer join [dbo].[ASU Employee Salary Data - 2015] as FY15
		on FY15.[Department_Description] = FY14.Department_Description 
	where FY14.Department_Description is null
	group by FY15.Calendar_Year, FY15.Department_Description
	
union all

	select 
		'2016' as Calendar_Year
		,FY15.Department_Description as Department 
		,'REM' as ADD_or_REM
		,sum(FY15.Salary) as Total_Salary
	from [dbo].[ASU Employee Salary Data - 2015] as FY15
	full outer join [dbo].[ASU Employee Salary Data - 2016] as FY16
		on FY16.[Department_Description] = FY15.Department_Description 
	where FY16.Department_Description is null
	group by FY15.Department_Description

union all
	
	select 
		FY16.Calendar_Year
		,FY16.Department_Description as Department 
		,'ADD' as ADD_or_REM
		,sum(FY16.Salary) as Total_Salary
	from [dbo].[ASU Employee Salary Data - 2015] as FY15
	full outer join [dbo].[ASU Employee Salary Data - 2016] as FY16
		on FY16.[Department_Description] = FY15.Department_Description 
	where FY15.Department_Description is null
	group by FY16.Calendar_Year, FY16.Department_Description
	
union all

	select 
		'2017' as Calendar_Year
		,FY16.Department_Description as Department 
		,'REM' as ADD_or_REM
		,sum(FY16.Salary) as Total_Salary
	from [dbo].[ASU Employee Salary Data - 2016] as FY16
	full outer join [dbo].[ASU Employee Salary Data - 2017] as FY17
		on FY17.[Department_Description] = FY16.Department_Description 
	where FY17.Department_Description is null
	group by FY16.Department_Description

union all
	
	select 
		FY17.Calendar_Year
		,FY17.Department_Description as Department 
		,'ADD' as ADD_or_REM
		,sum(FY17.Salary) as Total_Salary
	from [dbo].[ASU Employee Salary Data - 2016] as FY16
	full outer join [dbo].[ASU Employee Salary Data - 2017] as FY17
		on FY17.[Department_Description] = FY16.Department_Description 
	where FY16.Department_Description is null
	group by FY17.Calendar_Year, FY17.Department_Description

union all

	select 
		'2018' as Calendar_Year
		,FY17.Department_Description as Department 
		,'REM' as ADD_or_REM
		,sum(FY17.Salary) as Total_Salary
	from [dbo].[ASU Employee Salary Data - 2017] as FY17
	full outer join [dbo].[ASU Employee Salary Data - 2018] as FY18
		on FY18.[Department_Description] = FY17.Department_Description 
	where FY18.Department_Description is null
	group by FY17.Department_Description

union all
	
	select 
		FY18.Calendar_Year
		,FY18.Department_Description as Department 
		,'ADD' as ADD_or_REM
		,sum(FY18.Salary) as Total_Salary
	from [dbo].[ASU Employee Salary Data - 2017] as FY17
	full outer join [dbo].[ASU Employee Salary Data - 2018] as FY18
		on FY18.[Department_Description] = FY17.Department_Description 
	where FY17.Department_Description is null
	group by FY18.Calendar_Year, FY18.Department_Description

	
	) As ADD_REM_AllYears