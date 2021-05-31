USE TeenJobs;
select WorkerID, LastName, FirstName
from Employees
where Weekends=1 and Babysitting=1
    and (select count(*) from Jobs
    where WorkerID = EmployeeID
    and StartDate <= STR_TO_DATE('3/9/17', '%m/%d/%Y')
    and EndDate >= STR_TO_DATE('3/9/17', '%m/%d/%Y'))=0
order by LastName, FirstName;