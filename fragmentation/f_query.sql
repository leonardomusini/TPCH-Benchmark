WITH supplier_nation_region AS (
	SELECT 
		s_suppkey, 
		s_name,
		s_nationkey,    
		n_name AS s_nationname, 
		r_name AS s_regionname 
	FROM supplier_uk 
		JOIN nation ON (s_nationkey = n_nationkey)
		JOIN region ON (n_regionkey = r_regionkey)
), customer_nation_region AS (
	SELECT 
		c_custkey,
		c_name,
		c_nationkey,
		n_name AS c_nationname, 
		r_name AS c_regionname 
	FROM customer_not_uk 
		JOIN nation ON (c_nationkey = n_nationkey)
		JOIN region ON (n_regionkey = r_regionkey)
), lineitem_orders AS (
	SELECT 
		l_partkey, 
		l_suppkey, 
		o_orderdate, 
		o_custkey, 
		l_extendedprice * (1 - l_discount) AS revenue
	FROM lineitem_reducted JOIN orders_reducted ON (l_orderkey = o_orderkey)
)

SELECT
	EXTRACT (YEAR FROM o_orderdate) AS o_year,
	EXTRACT (QUARTER FROM o_orderdate) AS o_quarter,
	EXTRACT (MONTH FROM o_orderdate) AS o_month,
	p_type,
	s_regionname,
	s_nationname,
	s_name,
	c_regionname,
	c_nationname,
	c_name,
	SUM(revenue) AS total_revenue
FROM lineitem_orders 
	JOIN part_large_polished_steel ON l_partkey = p_partkey
	JOIN supplier_nation_region ON (s_suppkey = l_suppkey)
	JOIN customer_nation_region ON (c_custkey = o_custkey)
GROUP BY 
	o_year,
	o_quarter,
	o_month,
	p_type,
	c_regionname,
	c_nationname,
	c_name,
	s_regionname,
	s_nationname,
	s_name
;