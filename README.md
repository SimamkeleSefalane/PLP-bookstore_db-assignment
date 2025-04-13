# PLP-bookstore_db-assignment

## 📚 Project Overview
This project involves designing and implementing a relational MySQL database for a bookstore. It covers everything from schema design to table creation and sample data insertion. The goal is to enable efficient storage, retrieval, and management of data related to books, customers, orders, and shipping.

## 🧰 Tools & Technologies
- **MySQL** – For building and managing the database
- **Draw.io** – For designing the Entity Relationship Diagram (ERD)

---

## 🎯 Objectives
- Design a relational schema for a bookstore.
- Implement tables with appropriate keys and data types.
- Establish relationships using foreign keys.
- Test the schema with sample data.
- Write queries to analyze and retrieve information.

---

## 🗃️ Tables Overview

### 1. `book_language`
Stores possible languages a book can be published in.
- `language_id` (PK)
- `language_name`

### 2. `publisher`
Holds publisher information.
- `publisher_id` (PK)
- `pub_name`

### 3. `book`
Stores book details.
- `book_id` (PK)
- `title`
- `publisher_id` (FK → publisher)
- `language_id` (FK → book_language)
- `price`
- `publication_year`

### 4. `author`
Stores authors of books.
- `author_id` (PK)
- `name`

### 5. `book_author`
Many-to-many relationship between books and authors.
- `book_id` (FK → book)
- `author_id` (FK → author)

### 6. `country`
Stores list of countries.
- `country_id` (PK)
- `country_name`

### 7. `address`
Stores addresses with a link to countries.
- `address_id` (PK)
- `street`, `city`, `state`, `zip_code`
- `country_id` (FK → country)

### 8. `address_status`
Lists statuses for addresses (e.g., current, old).
- `address_status_id` (PK)
- `status_description`

### 9. `customer`
Customer details.
- `customer_id` (PK)
- `first_name`, `last_name`, `email`

### 10. `customer_address`
Many-to-many relationship between customers and addresses.
- `customer_id` (FK → customer)
- `address_id` (FK → address)
- `address_status_id` (FK → address_status)

### 11. `shipping_method`
Lists available shipping methods.
- `shipping_method_id` (PK)
- `method_name`

### 12. `order_status`
Defines statuses like pending, shipped, delivered.
- `order_status_id` (PK)
- `status_name`

### 13. `customer_order`
Main table for customer orders.
- `order_id` (PK)
- `customer_id` (FK → customer)
- `shipping_method_id` (FK → shipping_method)
- `order_status_id` (FK → order_status)
- `order_date`

### 14. `order_line`
Details books in each order.
- `order_id` (FK → customer_order)
- `book_id` (FK → book)
- `quantity`

### 15. `order_history`
Tracks order status changes over time.
- `history_id` (PK)
- `order_id` (FK → customer_order)
- `order_status_id` (FK → order_status)
- `status_change_date`

---

## 🧪 Sample Data
```sql
-- Sample publisher and language
INSERT INTO publisher (pub_name) VALUES ('Owl Press');
INSERT INTO book_language (language_name) VALUES ('English');

-- Insert book
INSERT INTO book (title, publisher_id, language_id, price, publication_year)
VALUES ('Parliament Owl', 1, 1, 500.00, 2010);
```

---

## 📊 Sample Query
**List books and their authors:**
```sql
SELECT b.title, a.name
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id;
```

---

## ✅ Outcomes
- Relational database with fully normalized schema
- Secure relationships via foreign keys
- Ready to support real-world bookstore operations
- Flexible for adding advanced features (e.g., inventory, reviews)

---

## 🔒 Next Steps
- Implement user roles and permissions
- Create stored procedures and views
- Expand with analytics and reporting queries

---

> Designed and developed by Simamkele Sefalane as part of a practical SQL database project.

