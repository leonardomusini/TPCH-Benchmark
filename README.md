# TPC-H Benchmark
 
The aim of this project is to implement and optimize a business-oriented ad-hoc query using the public [**TPC-H benchmark**](https://www.tpc.org/tpch/) in **PostgreSQL**, in order to identify the most effective optimization strategy.

The **TPC-H benchmark** is a standard for evaluating decision support systems. It consists of a schema for a large-scale data warehouse, along with a suite of business-oriented queries and concurrent data modifications that simulate real-world workloads.

This project focuses on:

- Creating a **data warehouse** in PostgreSQL based on the TPC-H schema  
- Implementing and analyzing assigned queries, with emphasis on an **import/export query**  
- Studying **efficient data structures** (e.g., indexes, partitioning) to improve query performance  
- Comparing execution strategies and measuring optimization outcomes 