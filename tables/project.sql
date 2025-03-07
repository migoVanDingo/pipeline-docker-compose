CREATE TABLE `project` (
  `project_id` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) DEFAULT NULL,
  `path` VARCHAR(1024) DEFAULT NULL,
  `entity_id` VARCHAR(255) NOT NULL, -- Could be a user_id or team_id
  `entity_type` VARCHAR(64) NOT NULL, -- Specify the type of entity ('user' or 'team')
  `is_public` INT NOT NULL DEFAULT 0,
  `is_active` INT NOT NULL DEFAULT 1,
  `created_by` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` VARCHAR(255) DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_by` VARCHAR(255) DEFAULT NULL,
  `deleted_at` DATETIME DEFAULT NULL,
  PRIMARY KEY (`project_id`)
);


CREATE TABLE `project_roles` (
  `project_roles_id` VARCHAR(255) NOT NULL,
  `project_id` VARCHAR(255) NOT NULL,
  `user_id` VARCHAR(255) NOT NULL,
  `role` VARCHAR(255) NOT NULL, -- e.g., Admin, Editor, Viewer
  `level` INT NOT NULL, -- e.g., 1 = Admin, 2 = Editor, 3 = Viewer
  `is_active` INT NOT NULL DEFAULT 1,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`),
  FOREIGN KEY (`project_id`) REFERENCES `project`(`project_id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE
);



CREATE TABLE `project_version` (
  `project_version_id` VARCHAR(255) NOT NULL,  -- Unique ID for the version
  `project_id` VARCHAR(255) NOT NULL,         -- Links to the main project
  `branch` VARCHAR(255) NOT NULL,             -- The branch name
  `commit_hash` VARCHAR(255) NOT NULL,        -- The specific commit
  `clone_url` VARCHAR(1024) NOT NULL,         -- URL to clone the repo
  `path` VARCHAR(1024) NOT NULL,              -- Path to the repo
  `owner` VARCHAR(255) NOT NULL,         -- Owner of the repo (could be different from the project creator)
  `is_fork` BOOLEAN NOT NULL DEFAULT 0,       -- Whether this is a forked version
  `forked_from` VARCHAR(255) DEFAULT NULL,    -- If forked, the original repo it came from
  `is_active` BOOLEAN NOT NULL DEFAULT 1,     -- Whether this version is active
  `is_venv` BOOLEAN NOT NULL DEFAULT 0,       -- Whether this version has a virtual environment
  `created_by` VARCHAR(255) NOT NULL,         -- Who created this version
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_version_id`),
  FOREIGN KEY (`project_id`) REFERENCES `project`(`project_id`) ON DELETE CASCADE
);

