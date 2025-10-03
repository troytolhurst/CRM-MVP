-- Keep updated_at fresh
CREATE TRIGGER IF NOT EXISTS trg_quote_updated_at
AFTER UPDATE ON quote
BEGIN
  UPDATE quote SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

CREATE TRIGGER IF NOT EXISTS trg_project_updated_at
AFTER UPDATE ON project
BEGIN
  UPDATE project SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Auto-calc line_total_pennies AFTER INSERT if it's missing/zero
CREATE TRIGGER IF NOT EXISTS trg_lineitem_calc_total_after_insert
AFTER INSERT ON quote_line_item
FOR EACH ROW
WHEN NEW.line_total_pennies IS NULL OR NEW.line_total_pennies = 0
BEGIN
  UPDATE quote_line_item
  SET line_total_pennies = (NEW.qty * NEW.unit_price_pennies) - COALESCE(NEW.line_discount_pennies, 0)
  WHERE id = NEW.id;
END;

-- Keep line_total_pennies in sync AFTER UPDATE of relevant fields
CREATE TRIGGER IF NOT EXISTS trg_lineitem_calc_total_after_update
AFTER UPDATE OF qty, unit_price_pennies, line_discount_pennies ON quote_line_item
FOR EACH ROW
BEGIN
  UPDATE quote_line_item
  SET line_total_pennies = (NEW.qty * NEW.unit_price_pennies) - COALESCE(NEW.line_discount_pennies, 0)
  WHERE id = NEW.id;
END;