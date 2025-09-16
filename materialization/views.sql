CREATE MATERIALIZED VIEW mv_supplier_nation_region AS
	SELECT 
		s_suppkey, 
		s_name,
		s_nationkey,
		n_name AS s_nationname, 
		r_name AS s_regionname 
	FROM supplier 
		JOIN nation ON (s_nationkey = n_nationkey)
		JOIN region ON (n_regionkey = r_regionkey);
		
CREATE MATERIALIZED VIEW mv_customer_nation_region AS
	SELECT 
		c_custkey,
		c_name,
		c_nationkey,
		n_name AS c_nationname, 
		r_name AS c_regionname 
	FROM customer 
		JOIN nation ON (c_nationkey = n_nationkey)
		JOIN region ON (n_regionkey = r_regionkey);

CREATE MATERIALIZED VIEW mv_lineitem_orders AS
	SELECT 
		l_partkey, 
		l_suppkey, 
		o_orderdate, 
		o_custkey, 
		l_extendedprice * (1 - l_discount) AS revenue
	FROM lineitem JOIN orders ON (l_orderkey = o_orderkey);