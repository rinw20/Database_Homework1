select distinct ShipName,substr(ShipName,1,instr(ShipName,'-')-1)
from [Order]
where ShipName like '%-%'
order by ShipName;