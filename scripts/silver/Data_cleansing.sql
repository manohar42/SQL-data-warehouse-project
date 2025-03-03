
-- Data Normalization or standardization
Truncate table silver.crm_cust_info;
Insert into silver.crm_cust_info(cst_id,cst_key,
cst_firstname,
cst_lastname,
cst_material_status,
cst_gndr, cst_create_date)

(Select cst_id,
cst_key,
TRIM(cst_firstname) as cst_firstname,
TRIM(cst_lastname) as cst_lastname,
Case when Upper(cst_material_status) = 'M' Then 'Married'
when upper(cst_material_status)= 'S' Then 'Single'
else 'n/a'
End cst_material_status,
CASE when UPPER(Trim(cst_gndr)) = 'F' Then 'Female'
when UPPER(Trim(cst_gndr)) = 'M' Then 'Male'
else 'n/a'
END cst_gndr,
cst_create_date
from 
(
select  *,
Row_Number() over ( partition by cst_id order by cst_create_date desc) as flag_last
from bronze.crm_cust_info)t where flag_last =1 )

