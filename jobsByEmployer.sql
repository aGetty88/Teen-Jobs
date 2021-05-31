USE TeenJobs;  -- MySQL command

select Employer, StartDate, LastName, FirstName
from Employers, Jobs, Employees
where Employers.EmployerID = Jobs.EmployerID and Employees.WorkerID = Jobs.EmployeeID
ORDER BY Employers.Employer; -- sorting command