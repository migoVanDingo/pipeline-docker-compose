CREATE TABLE jobs (
    job_id VARCHAR(255) NOT NULL PRIMARY KEY,
    job_name VARCHAR(255) NOT NULL,
    tasks JSON NOT NULL,             -- List of tasks associated with the job
    data JSON NOT NULL,              -- Payload or additional data
    status ENUM('PENDING', 'IN_PROGRESS', 'FAILED', 'COMPLETED', 'CANCELLED') NOT NULL DEFAULT 'PENDING',
    last_stage_completed VARCHAR(255) NULL, -- Last stage completed by the job
    retries INT DEFAULT 0,           -- Number of retries for the job
    error_message TEXT NULL,         -- Stores error details if the job fails
    priority INT DEFAULT 0,          -- Priority of the job (higher = more important)
    created_by VARCHAR(255) NULL,    -- User or system responsible for creating the job
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    completed_at TIMESTAMP NULL,     -- Timestamp when the job is marked as COMPLETED
    UNIQUE (job_id)
);

CREATE INDEX idx_status_priority_created_at 
ON jobs (status, priority DESC, created_at);



CREATE TABLE job_tasks (
    task_id VARCHAR(255) NOT NULL PRIMARY KEY, -- Unique identifier for each task
    job_name VARCHAR(255) NOT NULL,            -- Name of the job this task belongs to
    task_name VARCHAR(255) NOT NULL,           -- Name of the specific task
    service VARCHAR(255) NOT NULL,             -- Service responsible for the task
    order_index INT NOT NULL,                  -- Order of execution within the job
    is_active BOOLEAN DEFAULT TRUE,            -- Whether the task is active
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Timestamp for when the record was created
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Auto-update on changes

);