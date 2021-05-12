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
with joins data
```sql
SELECT vendor_name, invoice_number, invoice_date, invoice_total
FROM vendors INNER JOIN invoices
ON vendors.vendor_id = invoices.vendor_id
WHERE invoice_total >= 500
ORDER BY vendor_name, invoice_total DESC
```

# Insert a row to the Invoices table

```sql
INSERT INTO invoices
(vendor_id, invoice_number, invoice_date, invoice_total, terms_id, invoices_due_date)
VALUES (12, '32434343', '2021-06-22', 165, 3, '2021-07-22')
```
# Update the value of a column

```sql
UPDATE invoices
SET credit_total = 35.89
WHERE invoice_number = '32434343'
```
# Update multiple values of a column for multiple rows

```sql
UPDATE invoices
SET invoice_due_date = DATE_ADD(invoice_due_date, INTERVAL 30 day) 
WHERE terms_id = 4
```
# Delete invoice from Invoices table
```sql
DELETE FROM invoices
WHERE invoice_number = '32434343'
```
# Delete all paid invoices
```sql
/*
Author: Ruslan Khusnulin
Date: 22/06/2021
*/

DELETE FROM invoices
WHERE invoice_total - payment_total - credit_total = 0
```
# Example
```sql
SELECT invoice_number, invoice_date, invoice_total 
FROM invoices 
ORDER BY invoice_total DESC;

-- all invoices between dates
SELECT invoice_number, invoice_date, invoice_total
FROM invoices
WHERE invoice_date BETWEEN '2018-06-01' AND '2018-06-30'
ORDER BY invoice_date

-- more than number
SELECT invoice_number, invoice_date, invoice_total
FROM invoices
WHERE invoice_total > 4000
```

# Calculated columns

```sql
SELECT CONCAT(vendor_name, '''s Address: ') AS Vendor,
CONCAT(vendor_city, ', ', vendor_state, " ", vendor_zip_code) AS Address
FROM vendors
```
# Date format

```sql
SELECT invoice_date,
DATE_FORMAT(invoice_date, '%m/%d/%y') AS 'MM/DD/YY',
DATE_FORMAT(invoice_date, '%e-%b-%Y') AS 'DD-Mon-YYYY'
FROM invoices
ORDER BY invoice_date
```

# Create copy of table

```sql
CREATE TABLE invoices_copy AS
SELECT *
FROM invoices
```