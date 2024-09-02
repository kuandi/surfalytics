# 🏄‍♂️surfalytics Sales Analytics Repository

Overview
--------

Welcome to the Sales Analytics Repository! This repository contains SQL scripts designed to provide in-depth insights into various aspects of sales, shipping, and partner-related data. The SQL scripts are designed to be modular, enabling quick access to key metrics and allowing for further customization based on specific business needs.

### Contents

1.  **sales.sql**: Generates detailed sales metrics and aggregated data across different dimensions such as region, category, subcategory, and product name.
2.  **orders_shipping.sql**: Provides insights into the shipping status of orders, including delivery times and shipping delays.
3.  **partners_orders.sql**: Focuses on orders placed through partners, calculating partner commissions and providing details about partner performance.

* * * * *

Getting Started
---------------

1.  **Prerequisites**: Ensure that you have access to a database with relevant tables such as `orders`, `order_items`, `customers`, `products`, `partners`, and `shipping`.
2.  **Database Setup**: Import or connect the SQL scripts to your database environment.
3.  **Running the Scripts**: Execute each SQL script in your SQL editor or database client to generate the respective reports.

* * * * *

Contributing
------------

To maintain the integrity and consistency of this repository, please follow these guidelines when contributing:

### General Rules

-   **Use Lowercase Snake Case for Naming**: Follow the lowercase snake_case convention for all SQL object names, including tables, columns, and variables.
-   **Comment Your Code**: Include clear and concise comments for complex SQL logic. Comments should describe what the code does and why certain decisions were made.
-   **Ensure Code Readability**: Format SQL queries for readability, using proper indentation and line breaks. This helps others understand and maintain the code.
-   **Optimize Queries**: Before submitting a query, ensure it is optimized for performance, avoiding unnecessary subqueries or joins.

### Submitting Pull Requests

-   **Branch Naming**: Use descriptive branch names that reflect the changes being made, such as `feature/add-new-metric` or `bugfix/fix-date-format`.
-   **Commit Messages**: Write clear and meaningful commit messages that explain what changes were made and why.
-   **Review Process**: Assign a reviewer and provide context for the changes in the PR description. Address any feedback promptly.

* * * * *

Contact
-------

For any questions or support, please contact the repository maintainers at @surfalytics.com
