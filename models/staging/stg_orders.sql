select 
--from raw orders
a.orderid,
a.orderdate,
a.shipdate,
a.shipmode,
a.ordersellingprice - a.ordercostprice as orderprofit,
a.ordercostprice,
a.ordersellingprice,
--from raw_customer--
c.customername,
c.segment,
c.country,
--from raw product
p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} as a
left join {{ ref('raw_customer') }} as c
on a.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on a.productid = p.productid
