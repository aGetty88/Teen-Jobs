USE TeenJobs;  -- MySQL command

select WorkerID, LastName, FirstName, StartDate, EndDate
from Jobs, Employees
where WorkerID = EmployeeID and Employees.Weekends=1 and Employees.Babysitting=1
    and StartDate <= STR_TO_DATE('3/9/17', '%m/%d/%Y')
    and EndDate >= STR_TO_DATE('3/9/17', '%m/%d/%Y')
order by LastName, FirstName, StartDate;