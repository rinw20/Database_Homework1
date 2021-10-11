select CompanyName,round((part/total)*100,2) as percentage
from
(select part,total,ShipVia from (select cast(count(*) as float) as part,ShipVia from [Order] where ShippedDate>RequiredDate group by ShipVia) natural join (select cast(count(*) as float) as total,ShipVia from [Order] group by ShipVia))
inner join Shipper on ShipVia = id
order by percentage desc;