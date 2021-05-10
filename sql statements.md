# SQL DML statements

* SELECT
* INSERT
* UPDATE
* DELETE


# SQL DDL statements

* CREATE DATABASE, TABLE, INDEX
* ALTER TABLE, INDEX
* DROP DATABASE, TABLE, INDEX

# Create Database

``` sql
CREATE DATABASE ap 
```

# Select database
``` sql
USE ap
```

# Create a new table

``` sql
CREATE TABLE invoices
(
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    vendor_id INT NOT NULL,
    invoice_number VARCHAR(50) NOT NULL,
    invoice_date DATE NOT NULL,
    invoice_total DECIMAL(9,2) NOT NULL,
    payment_total DECIMAL(9,2) DEFAULT 0,
    credit_total DECIMAL(9,2) DEFAULT 0,
    terms_id INT NOT NULL,
    invoice_due_date DATE NOT NULL,
    payment_date DATE,
    CONSTRAINT invoices_fk_vendors
    FOREIGN KEY (vendor_id)
    REFERENCES vendors(vendor_id),
    CONSTRAINT invoices_fk_terms
    FOREIGN KEY (terms_id)
    REFERENCES terms(terms_id)
)
```

# Add a new column to a table

``` sql
ALTER TABLE invoices
ADD balance_due DECIMAL(9,2)
```

# Delete the new column
``` sql
ALTER TABLE invoices
DROP COLUMN balance_due
```
# Create an index on the table

```sql
CREATE INDEX invoices_vendor_id_index
ON invoices(vendor_id)
```

# Delete an index
```sql
DROP INDEX invoices_vendor_id_index
``` 

# Select statements
```sql
SELECT invoice_number, invoice_date, invoice_total, payment_total, credit_total, invoice_total - payment_total - credit_total 
AS balance_due
FROM invoices
WHERE invoice_total - payment_total - credit_total > 0
ORDER BY invoice_date
```