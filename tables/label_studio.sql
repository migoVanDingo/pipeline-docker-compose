CREATE TABLE label_project (
    label_project_id VARCHAR(255) PRIMARY KEY, -- Primary key for the table
    label_studio_internal_id int NOT NULL, -- Internal ID from Label Studio
    label_studio_project_name VARCHAR(255) NULL, -- Project name in Label Studio
    import_storage_id VARCHAR(255) NULL,
    set_name VARCHAR(255) NULL, -- Name of the set
    set_id VARCHAR(255) NOT NULL, -- Identifier for the set
    project_name VARCHAR(255) NOT NULL, -- Name of the project
    dataset_id VARCHAR(255) NOT NULL, -- Foreign key from the dataset table
    datastore_id VARCHAR(255) NULL, -- Foreign key from the datastore table
    metadata TEXT, -- Metadata (can store JSON or other structured data as text)
    label_config TEXT, -- Label configuration (XML or JSON)
    dataset_directory_path VARCHAR(255) NULL, -- Path to the dataset directory
    is_active BOOLEAN DEFAULT TRUE, -- Flag to indicate if the project is active
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp for when the record was created
    created_by VARCHAR(255) NOT NULL, -- Foreign key from the user table for creator
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Timestamp for the last update
    updated_by VARCHAR(255) NOT NULL -- Foreign key from the user table for last updater
);