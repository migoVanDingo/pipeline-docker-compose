-- migrations/add_files_table.sql
CREATE TABLE IF NOT EXISTS files (
    file_id VARCHAR(255) PRIMARY KEY,
    datastore_id VARCHAR(255) NOT NULL,
    dataset_id VARCHAR(255) NULL,
    file_path VARCHAR(1024) NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    file_type VARCHAR(50) NULL,
    file_size BIGINT,
    create_method VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    status VARCHAR(50) DEFAULT 'active',
    metadata JSON,
    CONSTRAINT fk_files_datastore FOREIGN KEY (datastore_id) REFERENCES datastore(datastore_id) ON DELETE CASCADE,
    CONSTRAINT fk_files_dataset FOREIGN KEY (dataset_id) REFERENCES dataset(dataset_id) ON DELETE CASCADE
);
