CREATE TABLE IF NOT EXISTS product (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sku TEXT UNIQUE,
  name TEXT NOT NULL,
  category TEXT,
  unit_price_pennies INTEGER NOT NULL DEFAULT 0,
  description TEXT,
  active INTEGER NOT NULL DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_product_active ON product(active);


-- product
INSERT INTO product (sku, name, category, unit_price_pennies)
VALUES ('TS-FULL-HT', 'Full-Height Turnstile', 'turnstile', 125000);