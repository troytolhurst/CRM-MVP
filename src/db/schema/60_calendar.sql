CREATE TABLE IF NOT EXISTS calendar_booking (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  project_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  starts_at TIMESTAMP NOT NULL,
  ends_at TIMESTAMP NOT NULL,
  crew TEXT,
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_calendar_time ON calendar_booking(starts_at, ends_at);
CREATE INDEX IF NOT EXISTS idx_calendar_project ON calendar_booking(project_id);
