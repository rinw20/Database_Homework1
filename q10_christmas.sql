select productName
from
(((select [Order].id as O,orderdate,productid,customerid from [Order] inner join Orderdetail On orderid=O) inner join Customer on customer.id=customerid) inner join Product on productid=product.id)
where CompanyName="Queen Cozinha" And orderdate like "2014-12-25%"
order by productid;