/* Here silver indicates the schema. In the table name crm_cust_info "crm" represents source system and "cust_info" represents the data from source system" */

Drop table if exists silver.crm_cust_info;
create Table silver.crm_cust_info (
	cst_id INT,
	cst_key VARCHAR(50),
	cst_firstname VARCHAR(50),
	cst_lastname VARCHAR(50),
	cst_material_status VARCHAR(50),
	cst_gndr VARCHAR(50),
	cst_create_date DATE,
	dwh_create_date TIMESTAMP default current_timestamp
);
Drop table if exists silver.crm_prd_info;
create Table silver.crm_prd_info (
	prd_id       INT,
    prd_key      VARCHAR(50),
    prd_nm       VARCHAR(50),
    prd_cost     INT,
    prd_line     VARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt   DATE,
	dwh_create_date TIMESTAMP default current_timestamp
);
Drop table if exists silver.crm_sales_details;

create Table silver.crm_sales_details (
	sls_ord_num  VARCHAR(50),
    sls_prd_key  VARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT,
	dwh_create_date TIMESTAMP default current_timestamp
);
Drop table if exists silver.erp_cust_az12;

create Table silver.erp_cust_az12(
	cid    VARCHAR(50),
    bdate  DATE,
    gen    VARCHAR(50),
	dwh_create_date TIMESTAMP default current_timestamp
);

Drop table if exists silver.erp_loc_a101;

create Table silver.erp_loc_a101(
	cid    VARCHAR(50),
    cntry  VARCHAR(50),
	dwh_create_date TIMESTAMP default current_timestamp
);

Drop table if exists silver.px_cat_g1v2;

create Table silver.px_cat_g1v2(
	id           VARCHAR(50),
    cat          VARCHAR(50),
    subcat       VARCHAR(50),
    maintenance  VARCHAR(50),
	dwh_create_date TIMESTAMP default current_timestamp
);

-- Select * from silver.px_cat_g1v2;
