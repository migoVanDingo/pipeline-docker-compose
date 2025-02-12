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

CREATE TABLE `datastore_roles` (
    `datastore_roles_id` VARCHAR(255) NOT NULL, -- Unique identifier for this role record
    `datastore_id` VARCHAR(255) NOT NULL,      -- Reference to the datastore
    `user_id` VARCHAR(255) NOT NULL,           -- Reference to the user
    `role` VARCHAR(255) NOT NULL,              -- Role type (e.g., Admin, Editor, Viewer)
    `level` INT NOT NULL,                      -- Role level (e.g., 1 = Admin, 2 = Editor, 3 = Viewer)
    `is_active` INT NOT NULL DEFAULT 1,        -- Flag for active/inactive roles
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`datastore_roles_id`),        -- Unique identifier
    FOREIGN KEY (`datastore_id`) REFERENCES `datastore`(`datastore_id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE
);


CREATE TABLE datastore_config (
    datastore_id VARCHAR(255) NOT NULL,
    field_name VARCHAR(255) NOT NULL,
    field_label VARCHAR(255),
    field_type ENUM('string', 'number', 'date', 'boolean', 'enum') NOT NULL,
    field_options JSON DEFAULT NULL, -- Use for enum options or additional metadata
    required BOOLEAN DEFAULT TRUE, -- Indicates if the field is mandatory
    order_index INT DEFAULT 0, -- Determines the order in forms or groupings
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (datastore_id, field_name), -- Composite primary key using datastore_id and field_name
    FOREIGN KEY (datastore_id) REFERENCES datastore(datastore_id) -- Foreign key to datastore table
);
