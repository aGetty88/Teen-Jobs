USE TeenJobs;  -- MySQL command

select WorkerID, LastName, FirstName, JobID, StartDate, EndDate
from Employees, Jobs
where Employees.WorkerID = Jobs.EmployeeID
ORDER BY Employees.LastName;