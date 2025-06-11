# Taxi-Management-System
An in-depth exploration and analysis of queries and execution plans in Relation Database Management Systems (RDMSs) with SQL.

## a) Database Preparation:
- Database chosen - MySQL
- Designed relational schema
- Created tables
- Database population: Loaded records into the tables using python scripts

## b) Query Execution and Performance Measurement
- Developed and executed various queries 
- Primarily focused on ```SELECT``` queries 
 
## c) Indexing for Query Performance Improvement
- Developed indexes for appropriate attributes in each table
- Ran identical queries with and without indexes to measure performance improvement
- Observed significant improvement in the speed and cost of execution during index scans

## d) Query Optimization with Varied Join Orders and Types
- Observed and analyzed the variations in performance by -
  - Changing the order of the ```JOIN``` operations within the same query
  - Using different types of ```JOIN``` operations - ```LEFT JOIN```, ```INNER JOIN``` with ```EXISTS``` clause etc.
 
## Query Analysis and Optimization
- Measured performance using -
  - ```EXPLAIN ANALYZE``` statement
  - Query plan diagram in MySQL Workbench
- Understood optimization strategies by -
  - Writing relational algebra expressions
  - Drawing query expression trees
