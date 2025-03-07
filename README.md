# SQL Data Warehouse Project

## Project Overview
This project focuses on developing a **modern data warehouse** using **SQL Server**. The architecture follows the **Medallion approach** (Bronze, Silver, and Gold layers) to enhance data integrity, performance, and analytics.

## Key Features
- **ETL Processes**: Efficient extraction, transformation, and loading of data.
- **Data Modeling**: Schema designs and optimized storage structures.
- **Data Cleansing**: Standardizing and improving data quality.
- **Procedural Automation**: Stored procedures for automation.
- **Data Consistency Checks**: Ensuring data accuracy and integrity.

## Project Structure
```
SQL-data-warehouse-project/
│── datasets/                   # Placeholder for raw datasets
│── docs/                        # Documentation files
│── scripts/                     # SQL scripts
│   ├── init_database.sql        # Initializes the database
│   ├── bronze/                  # Raw staging area scripts
│   │   ├── Procedure.sql        # Stored procedures for Bronze layer
│   │   ├── table_creation.sql   # Creating staging tables
│   ├── silver/                  # Cleaned and processed data
│   │   ├── DDL.sql              # Data definition queries for Silver layer
│   │   ├── Data_cleansing.sql   # Data transformation and validation
│   ├── gold/                    # Aggregated and analytics-ready data
│   │   ├── data_consistency_check.sql  # Ensures data consistency
│── README.md                    # Documentation file
│── LICENSE                      # Project license
```

## Installation & Setup
1. Install **SQL Server** and **SQL Server Management Studio (SSMS)**.
2. Load the **init_database.sql** script in SSMS and execute it to create the database structure.
3. Execute scripts in the following order:
   - `scripts/bronze/table_creation.sql`
   - `scripts/bronze/Procedure.sql`
   - `scripts/silver/DDL.sql`
   - `scripts/silver/Data_cleansing.sql`
   - `scripts/gold/data_consistency_check.sql`
4. Load data into the **Bronze layer** and process it through the **Silver** and **Gold layers**.

## Data Processing Pipeline
1. **Bronze Layer**:
   - Raw data ingestion.
   - Basic validation and storage.
   - Schema creation via `table_creation.sql`.

2. **Silver Layer**:
   - Cleansed and structured data.
   - Data consistency and validation via `Data_cleansing.sql`.

3. **Gold Layer**:
   - Aggregated and analytics-ready data.
   - Business intelligence and reporting.

## Stored Procedures
- `Procedure.sql` contains automated logic for:
  - Data validation
  - Business rules enforcement
  - Incremental loads

## License
This project is open-source under the **MIT License**.
