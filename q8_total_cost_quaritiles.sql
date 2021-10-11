select CPName,CustomerId,totalCost
from
(select *, NTILE(4) over(order by totalCost) as parts
from
(select ifnull(CompanyName,"MISSING_NAME") as CPName, CustomerId, round(sum(unitprice * quantity),2) as totalCost from [Order] as O inner join Orderdetail on O.id = Orderid left join customer as C on C.id = customerid group by Customerid))
where parts=1;