SELECT
    r.region_name AS region,
    c.category_name AS category,
    s.subcategory_name AS subcategory,
    p.product_name AS product,
    --account total_sales for potential discounts
    SUM(CASE 
            WHEN sales.discount IS NULL THEN sales.quantity_sold * sales.unit_price
            ELSE sales.quantity_sold * (sales.unit_price - sales.discount)
        END) AS total_sales,
    COUNT(DISTINCT sales.order_id) AS total_orders,
    SUM(sales.quantity_sold) AS total_units_sold,
    AVG(sales.unit_price) AS average_selling_price,
    MAX(sales.sale_date) AS last_sale_date,
    MIN(sales.sale_date) AS first_sale_date
FROM
    sales
JOIN
    products p ON sales.product_id = p.product_id
JOIN
    subcategories s ON p.subcategory_id = s.subcategory_id
JOIN
    categories c ON s.category_id = c.category_id
JOIN
    regions r ON sales.region_id = r.region_id
WHERE
    r.region_name = 'North America' -- Filter by specific region
    AND sales.sale_date BETWEEN '2023-01-01' AND '2023-12-31' -- Filter by date range
GROUP BY
    r.region_name,
    c.category_name,
    s.subcategory_name,
    p.product_name
ORDER BY
    total_sales DESC,
    region,
    category,
    subcategory,
    product;
