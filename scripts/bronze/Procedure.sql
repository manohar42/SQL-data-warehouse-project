/* This file consists of code to load the data from csv files into the tables. */

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE 
	Start_time BIGINT;
	End_Time BIGINT;
	duration BIGINT;
	
BEGIN
	start_time := EXTRACT(EPOCH FROM now()) * 100000;
	RAISE NOTICE'=======================================';
	RAISE NOTICE 'Loading data into the bronze layer';
	RAISE NOTICE'=======================================';
	
	
	RAISE NOTICE '---------------------------------------';
	RAISE NOTICE 'Loading CRM Tables';
	RAISE NOTICE '---------------------------------------';
    -- Truncate and Load crm_cust_info
    TRUNCATE TABLE bronze.crm_cust_info;
    EXECUTE FORMAT(
        'COPY bronze.crm_cust_info FROM %L WITH (FORMAT CSV, HEADER, DELIMITER '','')',
        'cust_info.csv'
    );

    -- Truncate and Load crm_prd_info
    TRUNCATE TABLE bronze.crm_prd_info;
    EXECUTE FORMAT(
        'COPY bronze.crm_prd_info FROM %L WITH (FORMAT CSV, HEADER, DELIMITER '','')',
        'prd_info.csv'
    );

    -- Truncate and Load crm_sales_details
    TRUNCATE TABLE bronze.crm_sales_details;
    EXECUTE FORMAT(
        'COPY bronze.crm_sales_details FROM %L WITH (FORMAT CSV, HEADER, DELIMITER '','')',
        'sales_details.csv'
    );
	
	end_time := EXTRACT(EPOCH FROM now()) * 100000;
	duration := end_time - start_time;
	RAISE NOTICE 'Start time is %',start_time;
	RAISE NOTICE 'End time is %',end_time;
	RAISE NOTICE 'Time Taken to load CRP tables is %',duration;
	
	start_time := EXTRACT(EPOCH FROM now()) * 10000000;
	RAISE NOTICE '---------------------------------------';
	RAISE NOTICE 'Loading ERP Tables';
	RAISE NOTICE '---------------------------------------';
    -- Truncate and Load erp_cust_az12
    TRUNCATE TABLE bronze.erp_cust_az12;
    EXECUTE FORMAT(
        'COPY bronze.erp_cust_az12 FROM %L WITH (FORMAT CSV, HEADER, DELIMITER '','')',
        'CUST_AZ12.csv'
    );

    -- Truncate and Load erp_loc_a101
    TRUNCATE TABLE bronze.erp_loc_a101;
    EXECUTE FORMAT(
        'COPY bronze.erp_loc_a101 FROM %L WITH (FORMAT CSV, HEADER, DELIMITER '','')',
        'LOC_A101.csv'
    );

    -- Truncate and Load erp_px_cat_g1v2
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    EXECUTE FORMAT(
        'COPY bronze.erp_px_cat_g1v2 FROM %L WITH (FORMAT CSV, HEADER, DELIMITER '','')',
        'PX_CAT_G1V2.csv'
    );
	end_time := EXTRACT(EPOCH FROM now()) * 10000000;
	duration := end_time - start_time;
	RAISE NOTICE 'Start time is %',start_time;
	RAISE NOTICE 'End time is %',end_time;
	RAISE NOTICE 'Time Taken to load CRP tables is %',duration;

END $$;

-- CALL bronze.load_bronze();
