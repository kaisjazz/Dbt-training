select 
--from raw orders
{{ dbt_utils.generate_surrogate_key(['a.orderid', 'c.customerid','p.productid']) }} as SK_Orders,
a.orderid,
a.orderdate,
a.shipdate,
a.shipmode,
a.ordersellingprice - a.ordercostprice as orderprofit,
a.ordercostprice,
a.ordersellingprice,
--from raw_customer--
c.customerid,
c.customername,
c.segment,
c.country,
--from raw product
p.productid,
p.category,
p.productname,
p.subcategory,
{{ markup('ordersellingprice','ordercostprice') }} as markup
from {{ ref('raw_orders') }} as a
left join {{ ref('raw_customer') }} as c
on a.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on a.productid = p.productid

