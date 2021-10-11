select Id,ShipCountry,"NorthAmerica"
from [order]
where (ShipCountry="USA" OR ShipCountry="Maxico" OR ShipCountry="Canada") AND Id between 15445 and 15464
union
select Id,ShipCountry,"OtherPlace"
from [order]
where (ShipCountry!="USA" AND ShipCountry!="Maxico" AND ShipCountry!="Canada") AND Id between 15445 and 15464;