# Базы данных
Базы данных используются везде, практически в каждом приложении они есть.
Знания по базам данных требуются в ИТ, кибербезопасности, в компьютерных науках.
В основном используются запросы по созданию, просмотру, обновлению и удалению данных в базах данных - и в них важна целостность данных.

# Состав - наличие трех компонентов
Database <-> Network <-> Clients

SQL - strustured query language

Clients <-> Application Server <-> Database Server

# Простая web система

Clients <-> Internet <-> Web Server <-> Database Server

Пример (Таблица поставщиков в базе Accounts Payable) - Vendor Table

| vendor_id | vendor_name | vendor_address | vendor_city |
|---|---|---|---|
|1|Почтовая служба 0|а.я. 140| Казань|
|2|Почтовая служба 1|а.я. 138| Москва|
|3|Почтовая служба 2|а.я. 138| Москва|
|4|Почтовая служба 3|а.я. 138| Москва|
|5|Почтовая служба 4|а.я. 138| Москва|
|6|Почтовая служба 5|а.я. 138| Москва|

vendor_id - Primary key - уникальная колонка

vendor_name .. vendor_city - колонки (Columns)

# Связывание двух таблиц

Таблица счетов (Invoice Table)

| invoice_id | vendor_id | invoice_number | invoice_date | invoice_total | payment_total | credit_total|
|---|---|---|---|---|---|---|
|61|2|4545545| 2021-06-01|40.45|40.45|0.0
|62|2|4544483| 2021-06-01|40.45|40.45|0.0
|65|6|4545541|2021-06-01|40.45|40.45|0.0
|67|6|4545542| 2021-06-01|40.45|40.45|0.0
|68|6|4545577| 2021-06-01|40.45|40.45|0.0

vendor_id - Foreign key - полная гарантия того, что этот ID существует.

Parent Table - в данном примере Vendor Table, Child - Invoice Table

# Пример таблицы поставщиков (Vendors)
|Column Name|Datatype|PK|NOT NULL|Auto Inc|Default/Expression
|--|--|--|--|--|--|
|vendor_id|INT(11)|YES|YES|YES|
|vendor_name|VARCHAR(50)||YES
|vendor_address1|VARCHAR(50)||YES
|vendor_address2|VARCHAR(50)||YES
|vendor_city|VARCHAR(50)||YES
|vendor_state|CHAR(2)||YES
|vendor_zip_code|VARCHAR(20)||YES
|vendor_phone|VARCHAR(50)||YES
|vendor_contact_last_name|VARCHAR(50)||YES
|vendor_contact_first_name|VARCHAR(50)||YES


# Пример таблицы счетов (Invoices)

|Column Name|Datatype|PK|NOT NULL|Auto Inc|Default/Expression
|--|--|--|--|--|--|
|invoice_id|INT(11)|YES|YES|YES|
|vendor_id|INT(11)||YES
|invoice_number|VARCHAR(50)||YES
|invoice_date|DATE||YES
|invoice_total|DECIMAL(9,2)||YES
|payment_total|DECIMAL(9,2)||YES||0.00
|credit_total|DECIMAL(9,2)||YES||0.00
|terms_id|INT(11)||YES
|invoice_due_date|DATE||YES
|payment_date|DATE||||NULL

# Datatypes in MySQL

* CHAR
* VARCHAR
* INT
* DECIMAL
* FLOAT
* DATE




