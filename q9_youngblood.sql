select RegionDescription, FirstName, LastName, BirthDate
from (((employee inner join employeeTerritory on employee.id= employeeid) inner join territory on territoryid=territory.id) inner join region on regionid = region.id)
group by region.id
having max(birthdate);