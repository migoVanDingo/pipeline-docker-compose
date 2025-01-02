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

