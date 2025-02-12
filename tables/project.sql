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

CREATE TABLE `project_git_info` (
  `project_git_info_id` VARCHAR(255) NULL,
  `project_id` VARCHAR(255) NOT NULL, -- Foreign key to the project table
  `git_clone_link` VARCHAR(1024) NOT NULL,
  `latest_commit_hash` VARCHAR(255) DEFAULT NULL, -- SHA-1 hash length
  `branch` VARCHAR(255) DEFAULT 'main', -- Default branch (optional)
  `last_fetched_at` DATETIME DEFAULT NULL, -- Optional, for tracking sync times
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`),
  FOREIGN KEY (`project_id`) REFERENCES `project`(`project_id`) ON DELETE CASCADE
);

