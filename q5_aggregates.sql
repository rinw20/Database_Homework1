select CategoryName,"number of products","average unit price","minimum unit price","maximum unit price","total units"
from
((select sum(unitsOnOrder) as "total units", categoryid from product group by categoryid) natural join (select min(unitPrice) as "minimum unit price",categoryid  from product group by categoryid) natural join (select max(unitPrice) as "maximum unit price",categoryid from product group by categoryid)  natural join (select (round(avg(unitPrice),2)) as "average unit price", categoryid from product group by categoryid) natural join (select categoryid,count(*) as "number of products" from product group by categoryid))
inner join Category S1 on categoryid=S1.id
order by categoryid;