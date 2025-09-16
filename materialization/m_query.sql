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
FROM mv_lineitem_orders
	JOIN part ON l_partkey = p_partkey
	JOIN mv_supplier_nation_region ON (s_suppkey = l_suppkey)
	JOIN mv_customer_nation_region ON (c_custkey = o_custkey)
WHERE
	s_nationkey <> c_nationkey
	AND p_type = 'LARGE POLISHED STEEL'
	AND s_nationname = 'UNITED KINGDOM'
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