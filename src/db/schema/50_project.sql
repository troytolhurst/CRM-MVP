CREATE TABLE IF NOT EXISTS project (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  company_id INTEGER NOT NULL,
  quote_id INTEGER UNIQUE,
  name TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'planning'
    CHECK (status IN ('planning','scheduled','in-progress','completed','on-hold','cancelled')),
  target_start DATE,
  target_end DATE,
  percent_complete INTEGER NOT NULL DEFAULT 0 CHECK (percent_complete BETWEEN 0 AND 100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
  FOREIGN KEY (quote_id) REFERENCES quote(id) ON DELETE SET NULL
);
CREATE INDEX IF NOT EXISTS idx_project_company ON project(company_id);
CREATE INDEX IF NOT EXISTS idx_project_status ON project(status);
