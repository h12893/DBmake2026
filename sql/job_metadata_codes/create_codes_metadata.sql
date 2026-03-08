IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'job_metadata_codes'
)
BEGIN
    CREATE TABLE job_metadata_codes (
    job_code INT NOT NULL PRIMARY KEY,
    job_type NVARCHAR(200) NOT NULL,
);
END;