# bigdata_project1
This repository is intended for the first assignment for the FHNW module "Big, Semi- and Unstructured Data (BA)".

This small demo project contains a sample MySQL dataset and example analytical queries for a retail gardening store called "Tante Emma's Gardening Tools".

## Overview
- SQL dump with schema and sample data: [`tante emma_DB.sql`](tante emma_DB.sql). The dump contains tables `customers`, `products`, `orders`, `sales` and a denormalized view [`denor_view`](tante emma_DB.sql).
- Example analytical queries are provided in:
  - [`Query to analytical question 1.txt`](Query to analytical question 1.txt)
  - [`Query to analytical question 2.txt`](Query to analytical question 2.txt)
- Java files: [`EventGenerator.java`](EventGenerator.java), [`EventProcessorAdvanced.java`](EventProcessorAdvanced.java),  [`CountAndSum.java`](CountAndSum.java) and [`MyProcessor.java`](MyProcessor.java)
- Build configuration: [`pom.xml`](pom.xml)
- Logging configuration: [`config.xml`](config.xml)

## Prerequisites
- Java 17 (JDK)
- Maven
- MySQL server (to load and query the dump)

## Analytical queries
- Which products were sold the most and which were sold the least during the timespan of 30 days:
  - See [`Query to analytical question 1.txt`](Query to analytical question 1.txt)
- Product with highest annual turnover:
  - See [`Query to analytical question 2.txt`](Query to analytical question 2.txt)

## Project files
- `tante emma_DB.sql` — MySQL dump with tables, data and the view [`denor_view`](tante emma_DB.sql)
- `Query to analytical question 1.txt` — SQL for most/least sold in a 30-day timespan
- `Query to analytical question 2.txt` — SQL for highest turnover in a business year
- `EventGenerator.java` -
- `EventProcessorAdvanced.java` -
- `CountAndSum.java` -
- `MyProcessor.java` - 
- `pom.xml` — Maven project file
- `config.xml` — Logback configuration
- `README.md` — this file
