-- CREATE TABLE FOR DATASTORE
CREATE TABLE IF NOT EXISTS datastore (
    datastore_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NULL,
    path TEXT NOT NULL,
    is_active INT DEFAULT 1 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE (datastore_id),
    PRIMARY KEY (datastore_id)  -- Make datastore_id the primary key
);

-- Create dataset table (No foreign key required)
CREATE TABLE IF NOT EXISTS dataset (
    dataset_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NULL,
    path TEXT NOT NULL,
    is_active INT DEFAULT 1 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    datastore_id VARCHAR(255),  -- Reference the datastore_id directly, but no foreign key
    UNIQUE (dataset_id),
    PRIMARY KEY (dataset_id),  -- Make dataset_id the primary key
    INDEX idx_datastore_id (datastore_id)  -- Add an index on datastore_id for efficient lookup
);