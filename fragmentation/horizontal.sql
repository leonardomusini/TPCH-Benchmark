CREATE TABLE part_large_polished_steel AS (
    SELECT p_partkey, p_type 
    FROM part 
    WHERE p_type = 'LARGE POLISHED STEEL');

CREATE TABLE supplier_uk AS (
    SELECT s_suppkey, s_name, s_nationkey 
    FROM supplier 
    JOIN nation ON s_nationkey = n_nationkey 
    WHERE n_name = 'UNITED KINGDOM');

CREATE TABLE customer_not_uk AS (
    SELECT c_custkey, c_name, c_nationkey
    FROM customer
    JOIN nation ON c_nationkey = n_nationkey 
    WHERE n_name <> 'UNITED KINGDOM');
	
CREATE TABLE lineitem_reducted AS (
    SELECT l_orderkey, l_partkey, l_suppkey, l_extendedprice, l_discount
    FROM lineitem);
	
CREATE TABLE orders_reducted AS (
    SELECT o_orderkey, o_custkey, o_orderdate
    FROM orders);