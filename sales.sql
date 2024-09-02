{\rtf1\ansi\ansicpg1252\cocoartf2758
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 SELECT\
    r.region_name AS region,\
    c.category_name AS category,\
    s.subcategory_name AS subcategory,\
    p.product_name AS product,\
    SUM(sales.quantity_sold * sales.unit_price) AS total_sales,\
    COUNT(DISTINCT sales.order_id) AS total_orders,\
    SUM(sales.quantity_sold) AS total_units_sold,\
    AVG(sales.unit_price) AS average_selling_price,\
    MAX(sales.sale_date) AS last_sale_date,\
    MIN(sales.sale_date) AS first_sale_date\
FROM\
    sales\
JOIN\
    products p ON sales.product_id = p.product_id\
JOIN\
    subcategories s ON p.subcategory_id = s.subcategory_id\
JOIN\
    categories c ON s.category_id = c.category_id\
JOIN\
    regions r ON sales.region_id = r.region_id\
GROUP BY\
    r.region_name,\
    c.category_name,\
    s.subcategory_name,\
    p.product_name\
ORDER BY\
    total_sales DESC,\
    region,\
    category,\
    subcategory,\
    product;\
}