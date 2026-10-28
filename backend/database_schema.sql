-- Fichier : backend/database_schema.sql (PostgreSQL)
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS bankroll_ledger (
    user_id INT REFERENCES users(id),
    ev_chips_balance INT DEFAULT 100,
    current_league VARCHAR(30) DEFAULT 'Freeroll',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS hand_history (
    hand_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    table_state TEXT,
    player_action VARCHAR(50),
    is_error BOOLEAN,
    error_details TEXT
);
