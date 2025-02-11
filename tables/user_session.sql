CREATE TABLE user_session (
    session_id VARCHAR(255) PRIMARY KEY, -- Unique session identifier
    user_id VARCHAR(255) NOT NULL,       -- User identifier (foreign key to the users table)
    refresh_token TEXT NOT NULL,         -- Encrypted refresh token
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Session creation time
    expires_at TIMESTAMP NOT NULL,       -- Refresh token expiration time
    last_used_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Last session use time
    device_info TEXT DEFAULT NULL,       -- Optional metadata about device or IP

    -- Foreign key constraint (if users table exists)
    CONSTRAINT fk_user_session_user_id FOREIGN KEY (user_id) 
    REFERENCES user(user_id) ON DELETE CASCADE
);