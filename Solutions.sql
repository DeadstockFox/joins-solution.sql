-- Get all customers and their addresses.

SELECT * From "customers"
JOIN "addresses" on "customer_id" = "customers"."id";

-- Get all orders and their line items (order id, order date, quantity, and product description).

SELECT * FROM "line_items"
JOIN "orders" on "orders"."id" = "line_items"."order_id"
JOIN "products" on "products"."id" = "line_items"."order_id";

-- Which warehouses have cheetos?

SELECT "product_id", "description", "warehouse" FROM "warehouse_product"
JOIN "products" on "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" on "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "description" = 'cheetos';

-- Which warehouses have diet pepsi?

SELECT "product_id", "description", "warehouse" FROM "warehouse_product"
JOIN "products" on "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" on "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "description" = 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT COUNT("orders"."id") AS "Order_Count", "customers"."first_name" from "addresses"
JOIN "orders" on "orders"."address_id" = "addresses"."id"
JOIN "customers" on "customers"."id" = "addresses"."customer_id"
GROUP BY "customers"."first_name";

-- How many customers do we have?

Select COUNT("customers"."id") from "customers";

-- How many products do we carry?

SELECT COUNT("products"."id") from "products";

-- What is the total available on-hand quantity of diet pepsi?

SELECT SUM("on_hand") from "warehouse_product"
JOIN "products" on "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi';