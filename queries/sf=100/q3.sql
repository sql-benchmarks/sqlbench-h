-- SQLBench-H query 3 derived from TPC-H query 3 under the terms of the TPC Fair Use Policy.
-- TPC-H queries are Copyright 1993-2022 Transaction Processing Performance Council.
select
	l_orderkey,
	sum(l_extendedprice * (1 - l_discount)) as revenue,
	o_orderdate,
	o_shippriority
from
	customer,
	orders,
	lineitem
where
	c_mktsegment = 'MACHINERY'
	and c_custkey = o_custkey
	and l_orderkey = o_orderkey
	and o_orderdate < date '1995-03-26'
	and l_shipdate > date '1995-03-26'
group by
	l_orderkey,
	o_orderdate,
	o_shippriority
order by
	revenue desc,
	o_orderdate limit 10;
