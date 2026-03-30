-- Drop table if exists (for fresh load)
DROP TABLE IF EXISTS raw_export_data;

-- Create table with improved structure
CREATE TABLE raw_export_data (
    fiscal_year VARCHAR(10),
    unique_id VARCHAR(50),
    deal_number VARCHAR(50),
    decision VARCHAR(20),
    decision_date DATE,
    effective_date DATE,
    expiration_date DATE,
    brokered BOOLEAN,
    deal_cancelled BOOLEAN,
    country VARCHAR(100),
    program VARCHAR(100),
    policy_type VARCHAR(100),
    decision_authority VARCHAR(100),
    product_code VARCHAR(50),
    product_description TEXT,
    term VARCHAR(50),
    primary_applicant VARCHAR(255),
    primary_lender VARCHAR(255),
    primary_exporter VARCHAR(255),
    exporter_city VARCHAR(100),
    exporter_state_code VARCHAR(10),
    exporter_state_name VARCHAR(100),
    primary_borrower VARCHAR(255),
    repayment_source TEXT,
    working_capital_authority VARCHAR(50),
    approved_amount DECIMAL(18,2),
    disbursed_amount DECIMAL(18,2),
    undisbursed_amount DECIMAL(18,2),
    outstanding_amount DECIMAL(18,2),
    small_business_amount DECIMAL(18,2),
    woman_owned_amount DECIMAL(18,2),
    minority_owned_amount DECIMAL(18,2),
    interest_rate DECIMAL(5,2),
    multiyear_extension BOOLEAN
);

-- Verify table
SELECT * FROM raw_export_data;
