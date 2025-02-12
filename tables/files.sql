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


CREATE TABLE IF NOT EXISTS datastore_files (
    datastore_files_id VARCHAR(255) PRIMARY KEY,
    datastore_id VARCHAR(255) NOT NULL,
    file_id VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    updated_at TIMESTAMP NULL,
    updated_by VARCHAR(255) NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by VARCHAR(255) NULL,
    CONSTRAINT fk_datastore_files_datastore FOREIGN KEY (datastore_id) REFERENCES datastore(datastore_id) ON DELETE CASCADE,
    CONSTRAINT fk_datastore_files_file FOREIGN KEY (file_id) REFERENCES files(file_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dataset_files (
    dataset_files_id VARCHAR(255) PRIMARY KEY,
    dataset_id VARCHAR(255) NOT NULL,
    file_id VARCHAR(255) NOT NULL,
    set_id VARCHAR(64) NULL,
    file_type ENUM('video', 'audio', 'image', 'annotation', 'ground-truth', 'report', 'model', 'misc') NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL,
    updated_at TIMESTAMP NULL,
    updated_by VARCHAR(255) NULL,
    deleted_at TIMESTAMP NULL,
    deleted_by VARCHAR(255) NULL,
    CONSTRAINT fk_dataset_files_dataset FOREIGN KEY (dataset_id) REFERENCES dataset(dataset_id) ON DELETE CASCADE,
    CONSTRAINT fk_dataset_files_file FOREIGN KEY (file_id) REFERENCES files(file_id) ON DELETE CASCADE
);