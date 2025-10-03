CREATE INDEX IF NOT EXISTS idx_contact_company ON contact(company_id);
CREATE INDEX IF NOT EXISTS idx_enquiry_company ON enquiry(company_id);
CREATE INDEX IF NOT EXISTS idx_enquiry_status ON enquiry(status);
CREATE INDEX IF NOT EXISTS idx_quote_company ON quote(company_id);
CREATE INDEX IF NOT EXISTS idx_quote_status ON quote(status);
CREATE INDEX IF NOT EXISTS idx_lineitem_quote ON quote_line_item(quote_id);
-- Note: SQLite ignores DESC in index definition; included columns still help sorting.
CREATE INDEX IF NOT EXISTS idx_interaction_company ON interaction(company_id, occurred_at);
CREATE INDEX IF NOT EXISTS idx_interaction_quote ON interaction(quote_id, occurred_at);
