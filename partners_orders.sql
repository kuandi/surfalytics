SELECT
    o.order_id,
    o.order_date,
    o.customer_id,
    c.customer_name,
    c.email AS customer_email,
    p.product_name,
    p.category,
    p.subcategory,
    o.quantity_ordered,
    o.total_order_value,
    pt.partner_id,
    pt.partner_name,
    pt.partner_type,
    pt.commission_rate,
    CASE
        -- If the order total is greater than $10,000, apply a special commission rate 2%
        WHEN o.total_order_value > 10000 THEN (o.total_order_value * (pt.commission_rate + 2) / 100)
        -- Default commission rate
        ELSE (o.total_order_value * pt.commission_rate / 100)
    END AS partner_commission, --make sure to double check commission values
    pt.partner_region,
    s.shipping_status,
    s.shipment_date,
    s.expected_delivery_date,
    DATEDIFF(s.expected_delivery_date, o.order_date) AS delivery_time_days
FROM
    orders o
JOIN
    customers c ON o.customer_id = c.customer_id
JOIN
    order_items oi ON o.order_id = oi.order_id
JOIN
    products p ON oi.product_id = p.product_id
JOIN
    partners pt ON o.partner_id = pt.partner_id
LEFT JOIN
    shipping s ON o.order_id = s.order_id
ORDER BY
    o.order_date DESC,
    pt.partner_name,
    p.category,
    p.subcategory;
