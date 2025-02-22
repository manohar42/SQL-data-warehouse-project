-- USE master;
-- GO

-- -- Drop and recreate the 'DataWarehouse' database
-- IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
-- BEGIN
--     ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--     DROP DATABASE DataWarehouse;
-- END;
-- GO
/* The above code checks if there is a database with name DataWarehouse already exists in the database or not.
If yes then it drops it. */

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
