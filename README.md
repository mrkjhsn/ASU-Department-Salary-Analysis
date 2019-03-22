# ASU-Department-Salary-Analysis
Which departments at ASU have the largest salary expenditures, and how has this changed over the last 5 years?

The State Press has published the [datasets](http://www.statepress.com/article/2017/04/spinvestigative-salary-database) of all salaries paid to ASU employees over the past 5 years(2012 - 2017).  I was interested in seeing which departments were paying the largest amounts in salary.  I have heard college football coaching staff are paid huge sums.  This was bourn out in my analysis, especially when compared against salaries across the university.

#### Learning Objectives:
As I continue to get better with SQL this was an opportunity for me to use two subselects in the same query, along with an inner join.  I wrote two queries:
1. Finds top ASU departments by salary spending, and percent change over the past 5 years ordered by total department salary.
2. Finds standard deviation of salaries for 2012 and 2017 as well as count of personel, then orders descending by largest deviation in 2017.


#### Results:
For both of my queries SDA Administration(Sun Devil Athletics Administration) was at the top of the list.
1.  For 2017 almost twice as much is spent on SDA Administration(23.3M) versus the next highest paid department(College of Law with 12.7M).  This represents a 52% increase over the amount spent in 2012.
2.  For 2017 the standard deviation for the SDA Administration Department was $246K with a count of 219 personel in that department.  The next six departments below in terms of standard deviation only had a handful of personel.

#### Other things to consider: 

1. ~~how the distribution of incomes in the Sun Devil Athletics department compares to the distribution across the campus.  For instance, what percent of earners make up the top 50% of the salary paid within each department.~~
2. ASU marketing materials make a big deal about how it is ranked #1 in inovation.  Can the percent change in salaries over the past 5 years be an effective indicator as to the direction ASU is taking as it positions itself as an innovator?
3. Graph department *standard deviation* and *salary spending* year over year since 2012. 
