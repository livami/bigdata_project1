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
- `EventGenerator.java` - A small utility that simulates or generates sales events, which is being used with the help of Apache Kafka. This java code produces a sample input for processors or local testing. 
- `EventProcessorAdvanced.java` - The main processing application. This implements stream or batch processing logic (aggregation, windowing and filtering), which is intended to be run against generated events or a live stream.
- `CountAndSum.java` - A helper class that implements simple aggregation operations used by processor classes. 
- `MyProcessor.java` - A processor demonstrating how individual events are parsed and transformed before aggregation.  
- `pom.xml` — Maven project file
- `config.xml` — Logback configuration
- `README.md` — this file

## How to load the sample database
- On your MySQL server:
  $ mysql -u root -p < tante\ emma_DB.sql

## How to build the Java files on Eclipse / IntelliJ
- Build the project:
  $ mvn clean package

- Run (example):
  $ java -jar target/your-artifact-id.jar
  (Adjust artifact id/version based on `pom.xml`)

- Run Configuration: in case the main class is not running properly, include this goal to the "Run Configuration" 


## Notes
- The Java files in the repo are kept small and focused for the course assignment — inspect each file to see examples of event generation, parsing and aggregation.
- Replace runtime parameters (DB credentials, input paths) as needed in code or configuration before running in your environment.