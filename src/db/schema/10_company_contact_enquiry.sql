CREATE TABLE IF NOT EXISTS company (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  address TEXT, phone TEXT, email TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS contact (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  company_id INTEGER,
  first_name TEXT NOT NULL, last_name TEXT NOT NULL,
  phone TEXT, email TEXT, role TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS enquiry (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  company_id INTEGER, contact_id INTEGER,
  enquiry_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  details TEXT,
  status TEXT DEFAULT 'new' CHECK (status IN ('new','in-progress','closed')),
  FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE SET NULL,
  FOREIGN KEY (contact_id) REFERENCES contact(id) ON DELETE SET NULL
);


-- company/contact
INSERT INTO company (name) VALUES ('Acme Security Ltd');
INSERT INTO contact (company_id, first_name, last_name, email)
VALUES (last_insert_rowid(), 'Sophie', 'Turner', 'sophie@acme.co.uk');