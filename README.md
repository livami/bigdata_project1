# bigdata_project1
This repository is intended for the first assignment for the FHNW module "Big, Semi- and Unstructured Data (BA)".

This small demo project contains a sample MySQL dataset and example analytical queries for a retail gardening store called "Tante Emma's Gardening Tools".

## Overview
- SQL dump with schema and sample data: [`tante emma_DB.sql`](tante emma_DB.sql). The dump contains tables `customers`, `products`, `orders`, `sales` and a denormalized view [`denor_view`](tante emma_DB.sql).
- Example analytical queries are provided in:
  - [`Query to analytical question 1.txt`](Query to analytical question 1.txt)
  - [`Query to analytical question 2.txt`](Query to analytical question 2.txt)
- Build config: [`pom.xml`](pom.xml)
- Logging config: [`config.xml`](config.xml)

## Prerequisites
- Java 17 (JDK)
- Maven
- MySQL server (to load and query the dump)

## Setup
1. Load the sample database into MySQL:
   ```sh
   mysql -u root -p mydb < "tante emma_DB.sql"
   ```
2. Verify the view and tables:
   - The denormalized view is named `denor_view` (see [`tante emma_DB.sql`](tante emma_DB.sql)).

## Build
- This repository uses Maven. To compile (if/when Java sources are added):
  ```sh
  mvn package
  ```

## Analytical queries
- Which products were sold the most / least in June 2025:
  - See [`Query to analytical question 1.txt`](Query to analytical question 1.txt)
- Product with highest annual turnover:
  - See [`Query to analytical question 2.txt`](Query to analytical question 2.txt)

## Project files
- `tante emma_DB.sql` — MySQL dump with tables, data and the view [`denor_view`](tante emma_DB.sql)
- `Query to analytical question 1.txt` — SQL for most/least sold in a 30-day timespan
- `Query to analytical question 2.txt` — SQL for highest turnover in a business year
- `pom.xml` — Maven project file
- `config.xml` — Logback configuration
- `README.md` — this file

## Notes
- No application source code is currently present under `src/`. The `pom.xml` is prepared for a Java 17/Maven project.
- Use the provided SQL dump to run analyses locally using MySQL or any compatible client.

}
// ...existing code...
