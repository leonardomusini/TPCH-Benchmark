CREATE INDEX IF NOT EXISTS c_nationkey_index
	ON mv_customer_nation_region (c_nationkey);
	
CREATE INDEX IF NOT EXISTS c_regionname_index
	ON mv_customer_nation_region (c_regionname ASC NULLS LAST);
	
CREATE INDEX IF NOT EXISTS c_nationname_index
	ON mv_customer_nation_region (c_nationname ASC NULLS LAST);

CREATE INDEX IF NOT EXISTS c_name_index
	ON mv_customer_nation_region (c_name ASC NULLS LAST);
		
CREATE INDEX IF NOT EXISTS s_nationkey_index
	ON mv_supplier_nation_region (s_nationkey);
	
CREATE INDEX IF NOT EXISTS s_regionname_index
	ON mv_supplier_nation_region (s_regionname ASC NULLS LAST);
	
CREATE INDEX IF NOT EXISTS s_nationname_index
	ON mv_supplier_nation_region (s_nationname ASC NULLS LAST);

CREATE INDEX IF NOT EXISTS s_name_index
	ON mv_supplier_nation_region (s_name ASC NULLS LAST);
		
CREATE INDEX IF NOT EXISTS o_orderdate_index
	ON mv_lineitem_orders (o_orderdate ASC NULLS LAST);
	
CREATE INDEX IF NOT EXISTS o_custkey_index
	ON mv_lineitem_orders (o_custkey);