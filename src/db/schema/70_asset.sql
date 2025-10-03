CREATE TABLE IF NOT EXISTS asset (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  company_id INTEGER,
  project_id INTEGER,
  quote_id INTEGER,
  kind TEXT NOT NULL CHECK (kind IN ('photo','document')),
  original_filename TEXT NOT NULL,
  stored_path TEXT NOT NULL,
  mime_type TEXT,
  size_bytes INTEGER,
  uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE SET NULL,
  FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE,
  FOREIGN KEY (quote_id) REFERENCES quote(id) ON DELETE SET NULL
);
CREATE INDEX IF NOT EXISTS idx_asset_project ON asset(project_id);
CREATE INDEX IF NOT EXISTS idx_asset_company ON asset(company_id);
CREATE INDEX IF NOT EXISTS idx_asset_quote ON asset(quote_id);
