{\rtf1\ansi\ansicpg1252\cocoartf2758
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 SELECT\
    o.order_id,\
    o.order_date,\
    o.customer_id,\
    c.customer_name,\
    c.email AS customer_email,\
    p.product_name,\
    p.category,\
    p.subcategory,\
    o.quantity_ordered,\
    o.total_order_value,\
    pt.partner_id,\
    pt.partner_name,\
    pt.partner_type,\
    pt.commission_rate,\
    (o.total_order_value * pt.commission_rate / 100) AS partner_commission,\
    pt.partner_region,\
    s.shipping_status,\
    s.shipment_date,\
    s.expected_delivery_date,\
    DATEDIFF(s.expected_delivery_date, o.order_date) AS delivery_time_days\
FROM\
    orders o\
JOIN\
    customers c ON o.customer_id = c.customer_id\
JOIN\
    order_items oi ON o.order_id = oi.order_id\
JOIN\
    products p ON oi.product_id = p.product_id\
JOIN\
    partners pt ON o.partner_id = pt.partner_id\
LEFT JOIN\
    shipping s ON o.order_id = s.order_id\
WHERE\
    pt.partner_type IN ('Affiliate', 'Reseller', 'Distributor')\
ORDER BY\
    o.order_date DESC,\
    pt.partner_name,\
    p.category,\
    p.subcategory;\
}