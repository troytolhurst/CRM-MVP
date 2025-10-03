CREATE TABLE IF NOT EXISTS interaction (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  company_id INTEGER,
  contact_id INTEGER,
  quote_id INTEGER,
  method TEXT NOT NULL DEFAULT 'note' CHECK (method IN ('note','call','email','meeting')),
  body TEXT NOT NULL,
  occurred_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE SET NULL,
  FOREIGN KEY (contact_id) REFERENCES contact(id) ON DELETE SET NULL,
  FOREIGN KEY (quote_id) REFERENCES quote(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_interaction_company ON interaction(company_id, occurred_at);
CREATE INDEX IF NOT EXISTS idx_interaction_quote ON interaction(quote_id, occurred_at);
