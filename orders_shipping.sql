SELECT
    o.order_id,
    o.order_date,
    o.customer_id,
    c.customer_name,
    c.email AS customer_email,
    p.product_name,
    o.quantity_ordered,
    o.total_order_value,
    s.shipping_method,
    s.shipping_cost,
    s.shipping_status,
    w.warehouse_location,
    s.shipment_date,
    s.expected_delivery_date,
    DATEDIFF(s.expected_delivery_date, o.order_date) AS delivery_time_days,
    CASE
        WHEN s.shipping_status = 'Delivered' THEN DATEDIFF(s.expected_delivery_date, s.shipment_date)
        ELSE NULL
    END AS actual_delivery_time_days
FROM
    orders o
JOIN
    customers c ON o.customer_id = c.customer_id
JOIN
    order_items oi ON o.order_id = oi.order_id
JOIN
    products p ON oi.product_id = p.product_id
JOIN
    shipping s ON o.order_id = s.order_id
JOIN
    warehouses w ON s.warehouse_id = w.warehouse_id
WHERE
    s.shipping_status IN ('Shipped', 'Delivered', 'In Transit')
ORDER BY
    o.order_date DESC,
    s.shipping_status,
    w.warehouse_location;
