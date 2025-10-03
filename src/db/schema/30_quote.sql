CREATE TABLE IF NOT EXISTS quote (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  company_id INTEGER NOT NULL,
  contact_id INTEGER,
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft','sent','accepted','rejected')),
  currency TEXT NOT NULL DEFAULT 'GBP',
  subtotal_pennies INTEGER NOT NULL DEFAULT 0,
  discount_pennies INTEGER NOT NULL DEFAULT 0,
  tax_pennies INTEGER NOT NULL DEFAULT 0,
  total_pennies INTEGER NOT NULL DEFAULT 0,
  notes TEXT, customer_notes TEXT, valid_until DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
  FOREIGN KEY (contact_id) REFERENCES contact(id) ON DELETE SET NULL
);
CREATE INDEX IF NOT EXISTS idx_quote_company ON quote(company_id);
CREATE INDEX IF NOT EXISTS idx_quote_status ON quote(status);
