CREATE TABLE part (
    p_partkey INTEGER CHECK (p_partkey >= 0),
    p_name VARCHAR(55),
    p_mfgr CHAR(25),
    p_brand CHAR(10),
    p_type VARCHAR(25),
    p_size INTEGER CHECK (p_size >= 0),
    p_container CHAR(10),
    p_retailprice DECIMAL CHECK (p_retailprice >= 0),
    p_comment VARCHAR(23),
    PRIMARY KEY (p_partkey)
);

CREATE TABLE region (
    r_regionkey INTEGER CHECK (r_regionkey >= 0),
    r_name CHAR(25),
    r_comment VARCHAR(152),
    PRIMARY KEY(r_regionkey)
);

CREATE TABLE nation (
    n_nationkey INTEGER CHECK (n_nationkey >= 0),
    n_name CHAR(25),
    n_regionkey INTEGER,
    n_comment VARCHAR(152),
    PRIMARY KEY(n_nationkey),
    FOREIGN KEY(n_regionkey) REFERENCES region(r_regionkey)
);

CREATE TABLE supplier (
    s_suppkey INTEGER CHECK (s_suppkey >= 0),
    s_name CHAR(25),
    s_address VARCHAR(40),
    s_nationkey INTEGER,
    s_phone CHAR(15),
    s_acctbal DECIMAL,
    s_comment VARCHAR(101),
    PRIMARY KEY(s_suppkey),
    FOREIGN KEY (s_nationkey) REFERENCES nation(n_nationkey)
);

CREATE TABLE partsupp (
    ps_partkey INTEGER CHECK (ps_partkey >= 0),
    ps_suppkey INTEGER,
    ps_availqty INTEGER CHECK (ps_availqty >= 0),
    ps_supplycost DECIMAL CHECK (ps_supplycost >= 0),
    ps_comment VARCHAR(199),
    PRIMARY KEY (ps_partkey, ps_suppkey),
    FOREIGN KEY (ps_partkey) REFERENCES part(p_partkey),
    FOREIGN KEY (ps_suppkey) REFERENCES supplier(s_suppkey)
);

CREATE TABLE customer (
    c_custkey INTEGER CHECK (c_custkey >= 0),
    c_name VARCHAR(25),
    c_address VARCHAR(40),
    c_nationkey INTEGER,
    c_phone CHAR(15),
    c_acctbal DECIMAL,
    c_mktsegment CHAR(10),
    c_comment VARCHAR(117),
    PRIMARY KEY(c_custkey),
    FOREIGN KEY (c_nationkey) REFERENCES nation(n_nationkey)
);

CREATE TABLE orders (
    o_orderkey INTEGER,
    o_custkey INTEGER,
    o_orderstatus CHAR(1),
    o_totalprice DECIMAL CHECK (o_totalprice >= 0),
    o_orderdate DATE,
    o_orderpriority CHAR(15),
    o_clerk CHAR(15),
    o_shippriority INTEGER,
    o_comment VARCHAR(79),
    PRIMARY KEY(o_orderkey),
    FOREIGN KEY (o_custkey) REFERENCES customer(c_custkey)
);

CREATE TABLE lineitem (
    l_orderkey INTEGER,
    l_partkey INTEGER,
    l_suppkey INTEGER,
    l_linenumber INTEGER,
    l_quantity DECIMAL CHECK (l_quantity >= 0),
    l_extendedprice DECIMAL CHECK (l_extendedprice >= 0),
    l_discount DECIMAL CHECK (l_discount BETWEEN 0.00 AND 1.00),
    l_tax DECIMAL CHECK (l_tax >= 0),
    l_returnflag CHAR(1),
    l_linestatus CHAR(1),
    l_shipdate DATE,
    l_commitdate DATE,
    l_receiptdate DATE CHECK (l_shipdate <= l_receiptdate),
    l_shipinstruct CHAR(25),
    l_shipmode CHAR(10),
    l_comment VARCHAR(44),
    PRIMARY KEY (l_orderkey, l_linenumber),
    FOREIGN KEY (l_orderkey) REFERENCES orders(o_orderkey),
    FOREIGN KEY (l_partkey) REFERENCES part(p_partkey),
    FOREIGN KEY (l_suppkey) REFERENCES supplier(s_suppkey),
    FOREIGN KEY (l_partkey, l_suppkey) REFERENCES partsupp(ps_partkey, ps_suppkey)
);