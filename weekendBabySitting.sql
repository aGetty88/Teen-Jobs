USE TeenJobs;  -- MySQL command

select WorkerID, LastName, FirstName, Weekends, BabySitting
from Employees
where Weekends=1 and Babysitting=1
order by LastName, FirstName;