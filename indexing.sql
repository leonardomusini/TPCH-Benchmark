CREATE INDEX IF NOT EXISTS l_partkey_index
	ON lineitem (l_partkey);

CREATE INDEX IF NOT EXISTS l_suppkey_index
	ON lineitem (l_suppkey);

CREATE INDEX IF NOT EXISTS o_orderdate_index
	ON orders (o_orderdate ASC NULLS LAST);

CREATE INDEX IF NOT EXISTS o_custkey_index
	ON orders (o_custkey);
	
CREATE INDEX IF NOT EXISTS p_type_index
	ON part (p_type ASC NULLS LAST);

CREATE INDEX IF NOT EXISTS s_name_index
	ON supplier (s_name ASC NULLS LAST);
	
CREATE INDEX IF NOT EXISTS s_nationkey_index
	ON supplier (s_nationkey);

CREATE INDEX IF NOT EXISTS c_name_index
	ON customer (c_name ASC NULLS LAST);
 
CREATE INDEX IF NOT EXISTS c_nationkey_index
	ON customer (c_nationkey);
	
CREATE INDEX IF NOT EXISTS n_regionkey_index
	ON nation (n_regionkey);