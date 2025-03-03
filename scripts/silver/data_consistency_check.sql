-- Check for null valyes or duplicates in a primary key
-- expectations: No result

select cst_id, count(*) from bronze.crm_cust_info group by cst_id having count(*) > 1 or cst_id is NULL;

-- Check for Unwanted spaces in data
-- expectation: No Results
select cst_firstname from 
bronze.crm_cust_info 
where cst_firstname != Trim(cst_firstname);

--Data Standardization and Consistency
select distinct cst_gndr
from bronze.crm_cust_info;
