CREATE TABLE IF NOT EXISTS quote_line_item (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  quote_id INTEGER NOT NULL,
  product_id INTEGER,
  description TEXT,
  qty INTEGER NOT NULL DEFAULT 1,
  unit_price_pennies INTEGER NOT NULL DEFAULT 0,
  line_discount_pennies INTEGER NOT NULL DEFAULT 0,
  line_total_pennies INTEGER NOT NULL DEFAULT 0,
  position INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY (quote_id) REFERENCES quote(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE SET NULL
);
CREATE INDEX IF NOT EXISTS idx_lineitem_quote ON quote_line_item(quote_id);

-- quote + line item
INSERT INTO quote (company_id, contact_id, status, subtotal_pennies, total_pennies)
VALUES (1, 1, 'draft', 0, 0);

INSERT INTO quote_line_item (quote_id, product_id, qty, unit_price_pennies, line_discount_pennies)
VALUES (1, 1, 2, 125000, 0);

SELECT * FROM quote_line_item;   -- line_total_pennies should be auto-filled by trigger (250000)