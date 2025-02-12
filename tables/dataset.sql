
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

CREATE TABLE `dataset_roles` (
    `dataset_roles_id` VARCHAR(255) NOT NULL, -- Unique identifier for this role record
    `dataset_id` VARCHAR(255) NOT NULL,      -- Reference to the dataset
    `user_id` VARCHAR(255) NOT NULL,         -- Reference to the user
    `role` VARCHAR(255) NOT NULL,            -- Role type (e.g., Admin, Editor, Viewer)
    `level` INT NOT NULL,                    -- Role level (e.g., 1 = Admin, 2 = Editor, 3 = Viewer)
    `is_active` INT NOT NULL DEFAULT 1,      -- Flag for active/inactive roles
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`dataset_roles_id`),        -- Unique identifier
    FOREIGN KEY (`dataset_id`) REFERENCES `dataset`(`dataset_id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE
);
